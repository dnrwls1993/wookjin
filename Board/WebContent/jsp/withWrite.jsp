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

<!-- <script -->
<!--   src="https://code.jquery.com/jquery-3.3.1.min.js" -->
<!--   integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" -->
<!--   crossorigin="anonymous"></script> -->

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
	#star {
		font-size: 80px;
		color: blue;
	}
	#btnSave {
		width: 100px;
	}
</style>
</head>
<body>
<form id="withWrite" action="withWrite" method="post">
	<div class="container">
		<div class="tab-content">
			<h3>
				<i class="fas fa-cloud" style="font-size:38px;color:aqua;"></i>
				${review.NUM}님에게 후기를 남겨주세요
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
			
			<div class="dropdown dropright" id="star">
    			<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
      				평점을 선택하세요
    			</button>
    			<div class="dropdown-menu">
      				<a class="dropdown-item" href="#">
      					<i class="glyphicon glyphicon-thumbs-up" id="star"></i>
      				</a>
      				<a class="dropdown-item" href="#">
						<i class="glyphicon glyphicon-thumbs-up" id="star"></i>
						<i class="glyphicon glyphicon-thumbs-up" id="star"></i>
					</a>
      				<a class="dropdown-item" href="#">
						<i class="glyphicon glyphicon-thumbs-up" id="star"></i>
						<i class="glyphicon glyphicon-thumbs-up" id="star"></i>
						<i class="glyphicon glyphicon-thumbs-up" id="star"></i>
					</a>
					<a class="dropdown-item" href="#">
						<i class="glyphicon glyphicon-thumbs-up" id="star"></i>
						<i class="glyphicon glyphicon-thumbs-up" id="star"></i>
						<i class="glyphicon glyphicon-thumbs-up" id="star"></i>
						<i class="glyphicon glyphicon-thumbs-up" id="star"></i>
					</a>
					<a class="dropdown-item" href="#">
						<i class="glyphicon glyphicon-thumbs-up" id="star"></i>
						<i class="glyphicon glyphicon-thumbs-up" id="star"></i>
						<i class="glyphicon glyphicon-thumbs-up" id="star"></i>
						<i class="glyphicon glyphicon-thumbs-up" id="star"></i>
						<i class="glyphicon glyphicon-thumbs-up" id="star"></i>
					</a>
    			</div>
  			</div>
			
			<!-- Summernote -->
			
			<div style="float: right;">
				<textarea rows="10" id="summernote" name="editor"></textarea>
			</div>
				<script type="text/javascript">
					$('.summernote').summernote({
						height : 500,
						minHeight : null,
						maxHeight : null,
						lang : 'ko-KR',
						onImageUpload : function(files, editor, welEditable) {
							sendFile(files[0], editor, welEditable);
						}
					}); 
					$('#summernote').summernote({
						height : 500,
						width : 800,
						focus : true
					});
					$(document).ready(function() {
						$('#summernote').summernote();
					});
				</script>
				<input type="button" class="btn btn-primary" id="btnSave" onclick="location.href='reviewBoard'" value="등록">
			
		</div>
	</div>
</form>
</body>
</html>