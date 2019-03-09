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

<script type="text/javascript">

	// ------------------- 별점 시작 ------------------- //
	$(function(){
		$(".starRev span").click(function(){
	         var index = $(".starRev span").index(this);
	         console.log(index+1);
	         for(i=0; i<5; i++){
	            
	            $(this).parent().children('span').removeClass('on');
	            $(this).addClass('on').prevAll('span').addClass('on');
	         }
	         $("#avgscore").val(index+1);

	        return false;
	      });	
	});
	// ------------------- 별점 끝 ------------------- // 
	 
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
	#btnSave {
		width: 100px;
		margin-left: 9%;
	}
	.starR{
  		background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
  		background-size: auto 100%;
  		width: 30px;
  		height: 30px;
  		display: inline-block;
  		text-indent: -9999px;
  		cursor: pointer; 
	}
	.starR.on{
		background-position:0 0;
	}
	#star {
		margin-left: 20px;
		
	}
	#starCase {
	  border: 1px solid #cccccc; 
	  background-color: #eeeeee; 
	  width: 800px; 
	  float: right;
	  margin-bottom: 10px;
	}
</style>
</head>
<body>
<form id="withWrite" action="withWrite1" method="post">
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
			
			<br>
			
			<!----------------------------------------- 별점 시작 -------------------------------------->
			<div id="starCase">
				<h5 style="text-align: center;">
					<b>별의 갯수로 평점을 남겨주세요</b>
				</h5>
				
				<div class="starRev" style="text-align: center;" id="reviewScore">
  					<span class="starR on" id="star">별1</span>
  					<span class="starR" id="star">별2</span>
  					<span class="starR" id="star">별3</span>
  					<span class="starR" id="star">별4</span>
  					<span class="starR" id="star">별5</span>	
  					<input type="hidden" name="avgscore" id="avgscore" value="1">
				</div>
  			</div>
  			<!----------------------------------------- 별점 끝 -------------------------------------->
			
			<!---------------------- 섬머노트 시작 ---------------------->
			<div style="float: right;">
				<textarea rows="10" id="summernote" name="withcontent"></textarea>
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
			<!---------------------- 섬머노트 끝 ---------------------->
			
			<input type="submit" class="btn btn-primary" id="btnSave" value="등록">
		</div>
	</div>
</form>
</body>
</html>