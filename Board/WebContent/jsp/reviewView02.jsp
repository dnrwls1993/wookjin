<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="bootLib.jsp"></jsp:include>
<style type="text/css">
	#box {
   		float: left;   
		margin: 30px;
		border: 1px solid black;
		width: 250px;
		height: 350px;
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
	#star {
		font-size: 60px;
		color: blue;
		margin-left: 20px; 
	}
</style>
</head>
<body>
	<div class="container">
		<div class="tab-content">
			<h3 style="display: inline;">
				<i class="fas fa-cloud" style="font-size:38px; color:aqua;"></i>
				OOO님의 후기 게시판
			</h3>
			<br>
			<div class="box" id="box">
				프로필 화면
			</div>
			
			
			
			<button type="button" class="btn btn-primary" id="btnList" onclick="location.href='reviewBoard.jsp'">후기 목록</button>
			<div class="form-group" id="form-group">
				<label for="inputlg">후기 작성자</label> 
				<input class="form-control input-lg" id="inputlg" type="text" readonly="readonly">
			</div>
			<div class="form-group" id="form-group">
				<label for="inputlg">평점</label> 
				<i class="glyphicon glyphicon-thumbs-up" id="star"></i>
				<i class="glyphicon glyphicon-thumbs-up" id="star"></i>
				<i class="glyphicon glyphicon-thumbs-up" id="star"></i>
			</div>
			<div class="form-group" id="form-group">
				<label for="inputlg">후기</label> 
				<textarea class="form-control input-lg" id="inputlg" readonly="readonly" style="width: 800px; height: 450px;"></textarea>
			</div>	
			<table class="table table-striped">
    			<thead>
      				<tr>
        				<th>닉네임</th>
        				<th>댓글</th>
        				<th></th>
      				</tr>
    			</thead>
    			<tbody>
      				<tr>
        				<td>user1</td>
        				<td>즐거웠어요</td>
        				<td><a href="#">신고</a></td>
      				</tr>
      				<tr>
        				<td>user2</td>
        				<td>다음에 또 가요</td>
        				<td><a href="#">신고</a></td>
      				</tr>	
      				<tr>
        				<td>user3</td>
        				<td>저도 껴주세요</td>
        				<td><a href="#">신고</a></td>
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
  			<input type="text" class="form-control form-control-sm" placeholder="댓글을 입력하세요" id="inputReply">
			<button type="button" class="btn btn-primary" id="btnSave">등록</button>
		</div>	
	</div>
	<br><br><br><br><br>
</body>
</html>