<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TripUs 홈페이지입니다 ^^</title>

 <!--Animated CSS-->
        <link rel="stylesheet" type="text/css" href="/resources/css/animate.min.css">

        <!-- Bootstrap -->
        <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
        <!--Bootstrap Carousel-->
        <link type="text/css" rel="stylesheet" href="/resources/css/carousel.css" />

        <link rel="stylesheet" href="/resources/css/isotope/style.css">

        <!--Main Stylesheet-->
        <link href="/resources/css/style.css" rel="stylesheet">
        <!--Responsive Framework-->
        <link href="/resources/css/responsive.css" rel="stylesheet">

<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>


<!-- bootstrap 3.4.0 -->	
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>


<!--Scroll to top-->
	<!--End of Scroll to top-->


	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<!-- <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js'></script>-->
	<script src="/resources/js/jquery-1.12.3.min.js"></script>

	<!--Counter UP Waypoint-->
	<script src="/resources/js/waypoints.min.js"></script>
	<!--Counter UP-->
	<script src="/resources/js/jquery.counterup.min.js"></script>
	<!--Google Maps API-->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBjxvF9oTfcziZWw--3phPVx1ztAsyhXL4"></script>


	<!--Isotope-->
	<script src="/resources/js/isotope/min/scripts-min.js"></script>
	<script src="/resources/js/isotope/cells-by-row.js"></script>
	<script src="/resources/js/isotope/isotope.pkgd.min.js"></script>
	<script src="/resources/js/isotope/packery-mode.pkgd.min.js"></script>
	<script src="/resources/js/isotope/scripts.js"></script>


	<!--Back To Top-->
	<script src="/resources/js/backtotop.js"></script>


	<!--JQuery Click to Scroll down with Menu-->
	<script src="/resources/js/jquery.localScroll.min.js"></script>
	<script src="/resources/js/jquery.scrollTo.min.js"></script>
	<!--WOW With Animation-->
	<script src="/resources/js/wow.min.js"></script>
	<!--WOW Activated-->
	<script>
		new WOW().init();
	</script>


	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="/resources/js/bootstrap.min.js"></script>
	<!-- Custom JavaScript-->
	<script src="/resources/js/main.js"></script>


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
                                <a class="navbar-brand custom_navbar-brand" href="#"><img src="/resources/img/trip.png" alt=""></a>
                            </div>
                            <!--End of navbar-header-->

							
                            <!-- Collect the nav links, forms, and other content for toggling -->
                            <div class="collapse navbar-collapse zero_mp" id="bs-example-navbar-collapse-1">
                                <ul class="nav navbar-nav navbar-right main_menu">
                                    <li ><a href="index.html">Home <span class="sr-only">(current)</span></a></li>
                                    <li><a href="notice.html">공지사항</a></li>
                                    <li><a href="tour.html">여행지</a></li>
                                    <li><a href="cource.html">코스</a></li>
                                    <li class="active"><a href="/restaurant/restaurant.do">맛집</a></li>
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



<div class="container">
  <h2 class="text-info">인기태그</h2>
  
  <a href="#">#삼계탕</a>
  <a href="#">#라멘</a>
  <a href="#">#마라탕</a>


<h2 style="font-family: aqua;">지역별 맛집</h2>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>


    <!-- Wrapper for slides -->
    <div class="carousel-inner">
	
      <div class="item active" >
      <a href="#">
        <img src="/resources/img/img1.jpg"  alt="이미지 1" style="width:100%;">
        </a>
        <div class="carousel-caption">
          <h3>경기도</h3>
          <p>경기도의 다양한 음식점들~!</p>
        </div>
      </div>

      <div class="item">
        <img src="/resources/img/img2.jpg" alt="이미지 2" style="width:100%;">
        <div class="carousel-caption">
          <h3>서울</h3>
          <p>서울의 전통적인 음식점들</p>
        </div>
      </div>
    
      <div class="item">
        <img src="/resources/img/img3.jpg" alt="이미지 3" style="width:100%;">
        <div class="carousel-caption">
          <h3>인천</h3>
          <p>해안도시 인천의 수산물 음식점들</p>
        </div>
      </div>
  
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>

<br>
<br>

<h2 style="font-family: aqua;">국가별 맛집</h2>
  <div id="myCarousel2" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel2" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel2" data-slide-to="1"></li>
      <li data-target="#myCarousel2" data-slide-to="2"></li>
      <li data-target="#myCarousel2" data-slide-to="3"></li>
    </ol>


    <!-- Wrapper for slides -->
    <div class="carousel-inner">
	
      <div class="item active" >
        <img src="/resources/img/img1.jpg"  alt="이미지 1" style="width:100%;">
        <div class="carousel-caption">
          <h3>한식</h3>
          <p>경기도의 다양한 음식점들~!</p>
        </div>
      </div>

      <div class="item">
        <img src="/resources/img/img2.jpg" alt="이미지 2" style="width:100%;">
        <div class="carousel-caption">
          <h3>일식</h3>
          <p>서울의 전통적인 음식점들</p>
        </div>
      </div>
    
      <div class="item">
        <img src="/resources/img/img3.jpg" alt="이미지 3" style="width:100%;">
        <div class="carousel-caption">
          <h3>서양식</h3>
          <p>해안도시 인천의 수산물 음식점들</p>
        </div>
      </div>
      
      <div class="item">
        <img src="/resources/img/img3.jpg" alt="이미지 3" style="width:100%;">
        <div class="carousel-caption">
          <h3>중식</h3>
          <p>해안도시 인천의 수산물 음식점들</p>
        </div>
      </div>
  
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel2" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel2" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>

	
	

</body>
</html>