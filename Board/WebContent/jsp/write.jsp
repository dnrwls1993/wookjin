<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="bootLib.jsp"></jsp:include>

</head>
<body>
	<form action="write" method="post" id="write">
		<div class="container">
			
			<h1><i class="fas fa-cloud" style="font-size:38px;color:aqua;"></i>후기 작성</h1>
			
			<div class="form-group">
				<label for="inputlg">제목</label> 
				<input class="form-control input-lg" name="title" id="inputlg" type="text">
			</div>
			
			<div class="form-group">
				<label for="inputlg">여행지</label> 
				<input class="form-control input-lg" name="travle" id="inputlg" type="text">
			</div>
			
			<div class="form-group">
    			<label for="exampleFormControlFile1">배경이미지</label>
    			<input type="file" class="form-control-file" name="backimg" id="exampleFormControlFile1">
  			</div>
		
			<!-- Summernote -->
			<textarea rows="10" id="summernote" name="content"></textarea>
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
					width : 1150,
					focus : true
				});
				$(document).ready(function() {
					$('#summernote').summernote();
				});
				
			</script>
			<input type="submit" class="btn btn-primary" id="save" value="저장">
		</div>
	</form>
</body>
</html>