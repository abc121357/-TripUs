<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<!-- include libraries(jQuery, bootstrap) -->
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
	<!-- include summernote css/js-->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
	<!-- include summernote-ko-KR -->
	<script src="/resources/js/summernote-ko-KR.js"></script>
	<title>글쓰기</title>

	<script>
	$(document).ready(function() {
		  $('#summernote').summernote({
				placeholder: '내용',
				minHeight: 370,
				maxHeight: null,
				focus: true,
				lang : 'ko-KR'
		  });
		});
	</script>
	</head>
	<body>
	<h2 style="text-align: center;">글쓰기</h2><br><br><br>
	<div class="container">
		<div style="width: 60%; margin: auto;">
			<form method="post" action="/write">
				<div class="form-group">
				작성자 : <input class="form-control" type="text" name="writer" style="width: 20%;" placeholder="작성자"/><br>
				제목 : <input class="form-control" type="text" name="title" style="width: 40%;" placeholder="제목"/>
				</div>
				<textarea id="summernote" name="content"></textarea>
				<button class="btn-info" id="subBtn" type="button" value="글 작성" style="float: right;" onclick="goWrite(this.form)">글작성</button>
			</form>
		</div>
	</div>
	</body>
</html>