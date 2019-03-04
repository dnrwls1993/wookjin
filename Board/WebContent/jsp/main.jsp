<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% request.setAttribute("contextPath", request.getContextPath()); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 메인</title>
<jsp:include page="bootLib.jsp"></jsp:include>

<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>

<script type="text/javascript">
	
	//---------- 무한 스크롤 시작 ---------- //
	$(window).on("scroll",function(){
		var scrollHeight = $(document).height();
		var scrollPosition = $(window).height()+$(window).scrollTop();
		
		if(scrollPosition > scrollHeight - 300){
			$("#smenu1").append('<div class="box" id="box"></div>');
			$("#smenu2").append('<div class="box" id="box"></div>');
		}
	});
	//---------- 무한 스크롤 끝 ---------- //
	
</script> 

<style type="text/css">
	
	#smenu {
		float: left;
		margin-right: 2%;
	}
	
	#upload {
		float: right;
		margin-right: 15px;
	}
	
	#box {
 		float: left; 
		margin: 10px;
		border: 1px solid black;
		width: 350px;
		height: 350px;
	}
	
	#search {
		width: 1000px;
		left: -60px;
	}
	
 	#backimg { 
   		background-image: url("${contextPath}/img/backimg.png");   
 		background-repeat: no-repeat; 
 		background-position: left; 
 		background-size: cover; 
	  	border: 1px solid red;  
 		z-index: 1; 
 		width: 348px; 
 		height: 190px; 
 		margin: auto; 
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
   		margin-top: -50px;   
 		width: 100px; 
 		height: 100px; 
 		
 	} 
	
 	#profile { 
 		font-size: 20px; 
 		text-align: center; 
 		z-index: 1;
/*  		position: fixed; */
	} 
	
	#footer {
		background-color: #eeeeee;
	}
	
	#header {
		background-color: #eeeeee;
	}
	
</style>

</head>

<!-- HEADER-START -->
<header class="hidden-xs" id="header">
    <div class="container">
       <div style="text-align: center;">
			<h1><a id="nickName" href="main" style="text-decoration: none;">라온다님112321</a></h1>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	        <ul class="nav navbar-nav navbar-right" style="display: inline; float: right;">
               	<li><a href="#">로그인</a></li>
				<li><span class="vertical-separator"></span><a href="#">회원가입</a></li>
	            <li class="dropdown">
	            	<span class="vertical-separator"></span>
	                	<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
	                		한국어 
	                    </a>
	                    <ul class="dropdown-menu">
	                        <li><a href="#" data-language="ko">한국어</a></li>
	                        <li><a href="#" data-language="en">English</a></li>
	                        <li><a href="#" data-language="ja">日本語</a></li>
	                        <li><a href="#" data-language="zh-hans">简体中文</a></li>
	                        <li><a href="#" data-language="zh-hant">繁體中文</a></li>
	                    </ul>
	                </li>
	            </ul>
	        </div>
    </div>
</header>
<!-- HEADER-END -->


<body>
	<div class="container" style="border: 1px solid #eeeeee;">
  
		<!-- Nav-Main -->
		<ul class="nav nav-tabs" role="tablist" id="navBar">
			<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#menu">후기</a></li>
		</ul>
			
		<div id="menu" class="container tab-pane fade" style="visibility: visible;">
			<ul class="nav nav-tabs" role="tablist" id="navBar" style="list-style: none;">
				<li class="nav-item" id="smenu"><a class="nav-link" data-toggle="tab" href="#smenu1">여행후기</a></li>
				<li class="nav-item" id="smenu"><a class="nav-link" data-toggle="tab" href="#smenu2">동행후기</a></li>
			</ul>
		</div>
			
			
			
		<div class="tab-content">
		
		<!---------------------------------------------- 여행 후기 시작 ---------------------------------------------->
		<div id="smenu1" class="container tab-pane fade">
				<br><br>
				<h3>여행후기</h3>
				<h5>다른 회원들에게 여행지 정보를 공유해주세요</h5>
				<input type="button" onclick="location.href='writeForm'" class="btn btn-primary" id="upload" value="후기 올리기">
				<br><br>
				
				<!------------ 회원 프로필 화면 시작 ------------>
				<c:forEach items="${review}" var="review" varStatus="status">
					<div class="box" id="box">
						<div id="backimg"></div>
	  					<div id="userimg"></div>  
						<div id="profile">
							<a style="text-align: center; display: inline-block;">${review.NUM}</a>
							<br>
							<a style="text-align: center; display: inline-block;">여행지 : <b>${review.TRAVLE}</b></a>
							<br>
							<a href="reviewView?num=${review.NUM}" style="text-align: center;">${review.TITLE}</a>
						</div>
					</div>		
				</c:forEach>
				<!------------ 회원 프로필 화면 끝 ------------>
				
				<!------------ 화면 맨 위로 시작 ------------>
				<div style="position: fixed; bottom: 30px; right: 300px;">
					<a href="#smenu1" style="font-size: 50px;"><i class="fas fa-arrow-alt-circle-up" style="color: #cccccc;"></i></a>
				</div>
				<!------------ 화면 맨 위로 끝 ------------>
				
			</div>
			<!---------------------------------------------- 여행 후기 끝 ---------------------------------------------->
			
			
			
				
			<!---------------------------------------------- 동행 후기 시작 ---------------------------------------------->
			<div id="smenu2" class="container tab-pane fade">
			<br><br>
				<h3>동행후기</h3>
			<br>
				<!------------ 검색 시작 ------------>
				<div class="row justify-content-center" id="search">
					<div class="col-12 col-md-10 col-lg-8" id="search">
						<form class="card card-sm" id="search">
							<div class="card-body row no-gutters align-items-center" id="search">
								<div class="col-auto">
									<i class="fas fa-search h4 text-body" style="margin: 5px;"></i>
								</div>
								<div class="col" >
									<input class="form-control form-control-lg form-control-borderless" 
											type="search" placeholder="검색하세요" style="margin: 5px; height: 60px;">
								</div>
								<div class="col-auto">
									<button class="btn btn-lg btn-success" type="submit" style="margin: 10px;">검색</button>
								</div>
							</div>
						</form>
					</div>
				</div>
				<!------------ 검색 끝 ------------>
				
				<br><br><br>
				
				<!------------ 회원 프로필 화면 시작 ------------>
				<c:forEach items="${review}" var="review" varStatus="status"> 
					<div class="box" id="box">
						<div id="backimg"></div>
	  					<div id="userimg"></div>  
						<div id="profile">
							<a href="withBoard?num=${review.NUM}" style="text-align: center; display: inline-block;">${review.NUM}</a>
							<br>
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
					</div>		
				</c:forEach>
				<!------------ 회원 프로필 화면 끝 ------------>
				
				<!------------ 화면 맨 위로 시작 ------------>
				<div style="position: fixed; bottom: 30px; right: 300px;">
					<a href="#smenu2" style="font-size: 50px;"><i class="fas fa-arrow-alt-circle-up" style="color: #cccccc;"></i></a>
				</div>
				<!------------ 화면 맨 위로 끝 ------------>
				
			</div>
			<!---------------------------------------------- 동행 후기 끝 ---------------------------------------------->
			
			
			
			
			
			
		</div>
	</div>
	
	<br><br><br><br>
	
	
</body> 


<footer class="hidden-xs" id="footer">
    <div class="container">
        <div class="col-sm-3">
        </div>
        <div class="col-sm-3">
            <ul>
                <li><h5>사이트</h5></li>
                <li><a href="#">소개</a></li>
            </ul>
        </div>
        <div class="col-sm-3">
            <ul>
                <li><h5>약관안내</h5></li>
                <li><a href="#">개인정보처리방침</a></li>
                <li><a href="#">이용약관</a></li>
            </ul>
        </div>
        <div class="col-sm-3">
            <ul>
                <li><h5>고객센터</h5></li>
                <li><a href="#" target="_blank">문의하기</a></li>
            </ul>
        </div>
    </div>
</footer>
</html>