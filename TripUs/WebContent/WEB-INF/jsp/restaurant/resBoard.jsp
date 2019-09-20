<%--
파일명 : resBoard.jsp
설명 : 맛집 게시글 작성 페이지
작성일 : 2019.9.1
작성자 : LHJ
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!--Animated CSS-->
        <link rel="stylesheet" type="text/css" href="css/animate.min.css">

        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!--Bootstrap Carousel-->
        <link type="text/css" rel="stylesheet" href="css/carousel.css" />

        <link rel="stylesheet" href="css/isotope/style.css">

        <!--Main Stylesheet-->
        <link href="css/style.css" rel="stylesheet">
        <!--Responsive Framework-->
        <link href="css/responsive.css" rel="stylesheet">
 		 <style>
		  /* Make the image fully responsive */
		  .carousel-inner img {
		      width: 100%;
		      height: 100%;
		  }
		  
		  #myCarousel{
		  	width:60%;
		  	height:60%;
		  	margin:auto;
		  }
		  </style>
		  
		  
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
	
	<!--Start Hedaer Section-->
        <section id="header">
            <div class="header-area">
                <div class="top_header">
                                      <!--End of container-->
                </div>
                <!--End of top header-->
                <div class="header_menu text-center" data-spy="affix" data-offset-top="50" id="nav">
                    <div class="container">
                        <nav class="navbar navbar-default zero_mp ">
                            <!-- Brand and toggle get grouped for better mobile display -->
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                                <a class="navbar-brand custom_navbar-brand" href="#"><img src="img/trip.png" alt=""></a>
                            </div>
                            <!--End of navbar-header-->

							
                            <!-- Collect the nav links, forms, and other content for toggling -->
                            <div class="collapse navbar-collapse zero_mp" id="bs-example-navbar-collapse-1">
                                <ul class="nav navbar-nav navbar-right main_menu">
                                    <li ><a href="index.html">Home <span class="sr-only">(current)</span></a></li>
                                    <li><a href="notice.html">공지사항</a></li>
                                    <li><a href="tour.html">여행지</a></li>
                                    <li><a href="cource.html">코스</a></li>
                                    <li class="active"><a href="rest.html">맛집</a></li>
                                    <li><a href="festival.html">축제</a></li>
                                    <li><a href="contact.html">contact us</a></li>
                                </ul>

							
						</div>
                            <!-- /.navbar-collapse -->
                        </nav>
                        <!--End of nav-->
                    </div>
                    <!--End of container-->
                </div>
                <!--End of header menu-->
            </div>
            <!--end of header area-->
        </section>
        <!--End of Header Section-->
	
	
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