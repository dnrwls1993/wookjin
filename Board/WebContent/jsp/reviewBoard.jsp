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
	$(function() {
		var boardTable = $("#withReview");
		$("#withReview tr:gt(0)").remove();
		$.ajax({
			url : "${contextPath}/review/withBoard",
			type : "get",
			dataType : "json",
			success : function(data) {
				for(var i in data) {
					var tr = $("<tr>");
					var href = $("<a href='#' style='text-decoration: none;'>신고</a>");
					$("<td style='text-align: center; border: 1px solid #cccccc;'>").text(data[i].NUM).appendTo(tr);
					$("<td style='border: 1px solid #cccccc;'>").text(data[i].AVGSCORE).appendTo(tr);
					$("<td style='border: 1px solid #cccccc;'>").text(data[i].WITHCONTENT).appendTo(tr);
					$("<td style='border: 1px solid #cccccc; text-align: center;'>").append(href).appendTo(tr);
					
					tr.appendTo(boardTable);
				}
			}
		});
	});
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
		width: 250px;
		height: 350px;
	}
	
	#withReview {
		float: right;
		width: 800px;
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
<form action="withWriteForm" method="get">

	<div class="container">
		<div class="tab-content">
			
			<h3>
				<i class="fas fa-cloud" style="font-size:38px;color:aqua;"></i>
				${review.NUM}님의 후기 게시판
			</h3>
			
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
			
			<button type="button" class="btn btn-primary" id="btnSave" style="float: right;" onclick="location.href='withWriteForm'">후기올리기</button>
		</div>
		
		<br><br><br>
		
		<!---------------------------------- 동행후기 리스트 시작 ---------------------------------->
		<table class="table table-bordered" id="withReview">
      			<tr style="border: 1px solid #cccccc;">
        			<th style="width: 130px; border: 1px solid #cccccc; text-align: center;">닉네임</th>
        			<th style="width: 130px; border: 1px solid #cccccc; text-align: center;">평점</th>
        			<th style="width: 130px; border: 1px solid #cccccc; text-align: center;">후기내용</th>
        			<th style="float: right;"></th>
      			</tr>    		
  		</table>
  		<!---------------------------------- 동행후기 리스트 끝 ---------------------------------->
  		
  		<!---------------------------------- 동행후기 리스트 페이징 시작 ---------------------------------->
  		<div align="center">
  			<ul class="pagination justify-content-center">
    			<li class="page-item"><a class="page-link" href="javascript:void(0);">Previous</a></li>
    			<li class="page-item"><a class="page-link" href="javascript:void(0);">1</a></li>
    			<li class="page-item"><a class="page-link" href="javascript:void(0);">2</a></li>
    			<li class="page-item"><a class="page-link" href="javascript:void(0);">3</a></li>
    			<li class="page-item"><a class="page-link" href="javascript:void(0);">4</a></li>
    			<li class="page-item"><a class="page-link" href="javascript:void(0);">5</a></li>
    			<li class="page-item"><a class="page-link" href="javascript:void(0);">Next</a></li>
  			</ul>
  		</div>
  		<!---------------------------------- 동행후기 리스트 페이징 끝 ---------------------------------->
  		
	</div>
</form>
</body>
</html>