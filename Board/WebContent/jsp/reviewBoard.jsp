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
	
	#replyList {
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
<form action="withBoard" method="get">
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
		<table class="table table-bordered" id="replyList">
    		<thead>
      			<tr>
        			<th>닉네임</th>
        			<th>평점</th>
        			<th>후기내용</th>
      			</tr>
    		</thead>
    		<tbody>	
      			<tr>
        			<td><a href="reviewView02.jsp">user1</a></td>
        			<td>4 / 5</td>
        			<td>너무 즐거웠어요</td>
      			</tr>
      			<tr>
        			<td>user2</td>
        			<td>3 / 5</td>
        			<td>다음에 또 봐요~</td>
      			</tr>
      			<tr>
        			<td>user3</td>
        			<td>4 / 5</td>
        			<td>짱짱</td>
      			</tr>
      			<tr>
        			<td>user4</td>
        			<td>5 / 5</td>
        			<td>2일차 점심 너무 맛있었어요</td>
      			</tr>
      			<tr>
        			<td>user5</td>
        			<td>4 / 5</td>
        			<td>다음엔 어디로 갈까요</td>
      			</tr>
    		</tbody>
  		</table>
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
	</div>
</form>
</body>
</html>