<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% request.setAttribute("contextPath", request.getContextPath()); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="bootLib.jsp"></jsp:include>
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>

<script type="text/javascript">
	
	// -----댓글 달기----- //
	$(function() {
		createReplyList();
		$("#replyForm").on("submit",function() {
			var d = $(this).serialize();
			$.ajax({
				url : "${contextPath}/reply/reply",
				data : d,
				type : "post",
				datatype : "json",
				success : function(data) {
					if(data) {
						createReplyList();
						$("#inputReply").val("");
					}
				}
			});
			return false;
		});
	});
	
	// -----댓글 단 후 리스트 출력----- //
	function createReplyList() {
		var replyTable = $("#replies");
		$("#replies tr:gt(0)").remove();
		$.ajax({
			url : "${contextPath}/reply/all/${review.NUM}",
			type : "get",
			dataType : "json",
			success : function(data) {
				for(var i in data) {
					var tr = $("<tr>");
					var href = $("<a href='#' style='text-decoration: none;'>신고</a>");
					$("<td style='text-align: center; border: 1px solid #cccccc;'>").text(data[i].NUM).appendTo(tr);
					$("<td style='border: 1px solid #cccccc;'>").text(data[i].REPLYCONTENT).appendTo(tr);
					$("<td style='border: 1px solid #cccccc; text-align: center;'>").append(href).appendTo(tr);
					
					tr.appendTo(replyTable);
				}
			}
		});
	}
	
	
</script>

<style type="text/css">
	#box {
  		float: left;  
		margin: 30px;
		border: 1px solid #cccccc;
		width: 250px;
		height: 350px;
		text-align: center;
		font-size: 20px;
		background: #eeeeee;
	}
	#form-group {
		width: 800px;
		float: right;
	}
	#btnList {
		float: right;
	}
	#btnSave {
		display: inline;
		float: right;
	}
	#inputReply {
		width: 1000px; 
		display: inline;
	}
	#contentView {
		 border: 1px solid #cccccc;
/* 		 width: 800px; */
		 width: auto;
		 height: auto;
		 background: #eeeeee;
	}
	#userimg {
 		background-image: url("${contextPath}/img/img02.jpg");   
		background-repeat: no-repeat;
		background-position: bottom;
		background-size: cover;
		border-radius: 50%;
		z-index: 2;
 		border: 1px solid black; 
 		margin: 0 auto; 
 		margin-top: 20px; 
		width: 100px;
		height: 100px;
	}
	
</style>
</head>
<body>
<form action="reviewView" method="get">
	<div class="container">
		<div class="tab-content">
			
			<!----------------------------------------- 프로필 시작 -------------------------------------->
			<div class="box" id="box">
				<div id="userimg"></div>
				<br>
				<a>${review.NUM}</a>
				<br><br>
				<a>여행지 : <b>${review.TRAVLE}</b></a>
				<br><br>
				<i class="fas fa-home">
					<br>
					<a>숙소 평점</a>
					<br>
					<a><i style="color: blue;">4.2</i> / 5</a>
				</i>
				<i class="fas fa-camera" style="margin-left: 20px;">
					<br>
					<a>후기 평점</a>
					<br>
					<a><i style="color: blue;">4.8</i> / 5</a>
				</i>
			</div>
			<!----------------------------------------- 프로필 끝 -------------------------------------->
			
			<h3>
				<i class="fas fa-cloud" style="font-size:38px;color:aqua;"></i>
				${review.NUM}님의 여행후기입니다
			</h3>
			
			<button type="button" class="btn btn-primary" id="btnList" onclick="location.href='main'">후기 목록</button>
			
			<!------------ 등록한 정보 출력 시작 ------------>
				<div class="form-group" id="form-group">
					<label for="inputlg">제목</label> 
					<input class="form-control input-lg" id="inputlg" type="text" readonly="readonly" value="${review.TITLE}">
				</div>
			
				<div class="form-group" id="form-group">
					<label for="inputlg">여행지</label> 
					<input class="form-control input-lg" id="inputlg" type="text" readonly="readonly" value="${review.TRAVLE}">
				</div>
			
				<div class="form-group" id="form-group">
					<label for="inputlg">후기</label> 
					<div class="form-control input-lg" id="contentView">
						${review.content}
					</div>
				</div>
			<!------------ 등록한 정보 출력 끝 ------------>
				
			</div>
		</div>	
</form>

<div class="container">
		<div class="tab-content">
		
		<!------------ 댓글 리스트 시작 ------------>
			<table class="table table-striped" id="replies">
      				<tr style="border: 1px solid #cccccc;">
        				<th style="width: 130px; border: 1px solid #cccccc; text-align: center;">닉네임</th>
        				<th style="width: 900px; border: 1px solid #cccccc; text-align: center;">댓글</th>
        				<th style="float: right;"></th>
      				</tr>
  			</table>
  		<!------------ 댓글 리스트 끝 ------------>	
  			
  		<!------------ 댓글 리스트 페이징 시작 ------------>
  			<div align="center">
  				<ul class="pagination justify-content-center">
  					<li class="page-item">
    					<a class="page-link" href="javascript:void(0);">
    						Previous
    					</a>
    				</li>
    				<li class="page-item">
    					<a class="page-link" href="javascript:void(0);">
    						1
    					</a>
    				</li>
    				<li class="page-item">
    					<a class="page-link" href="javascript:void(0);">
    						2
    					</a>
    				</li>
    				<li class="page-item">
    					<a class="page-link" href="javascript:void(0);">
    						3
    					</a>
    				</li>
    				<li class="page-item">
    					<a class="page-link" href="javascript:void(0);">
    						4
    					</a>
    				</li>
    				<li class="page-item">
    					<a class="page-link" href="javascript:void(0);">
    						5
    					</a>
    				</li>
    				<li class="page-item">
    					<a class="page-link" href="javascript:void(0);">
    						Next
    					</a>
    				</li>
  				</ul>
  			</div>
			<!------------ 댓글 리스트 페이징 끝 ------------>
	
  			<!------------ 댓글 달기 시작 ------------>
  			<form name="replyForm" id="replyForm" method="post" action="#">
  				<input type="hidden" name="board_num" value="${review.NUM}">
  				<input type="text" class="form-control form-control-sm" placeholder="댓글을 입력하세요" id="inputReply" name="replycontent">
				<input type="submit" class="btn btn-primary" id="btnSave" value="등록">
			</form>
			<!------------ 댓글 달기 끝 ------------>
			
		</div>	
	</div>
	<br><br><br><br><br>
</body>
</html>