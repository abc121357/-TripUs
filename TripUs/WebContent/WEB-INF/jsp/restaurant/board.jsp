<%--
파일명 : board.jsp
설명 : api를 사용해서 지정된 맛집 정보 값을 가져오는 페이지
작성일 : 2019.9.1
작성자 : LHJ
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.api.*"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${viewname} 맛집</title>
<style>
h3 {
	color: blue;
} 
</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.11.0.min.js"></script>

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

<script type="text/javascript">
	
	$(document).ready(function(){
		var contentid=${contentid};
		//alert("contentid : "+contentid);
				$.ajax({
					url : '../PublicData2.do',
					type : 'get',
					data : {contentId:contentid},
					dataType : 'json',
					success : function(data) {
						console.log("DATA : "+data);
						console.log(data);
						console.log(data.response.body.items.item);
						myItem = data.response.body.items.item;
						var output='';
						//for (var i = 0; myItem.length; i++) {
							
							console.log(myItem.length);
							output += '<h2 style="font-size:40px; font-family: 나눔고딕">'  + '맛집' + '</h2>';
							output += '<hr>';
							output += '<h4>' + myItem.title + '</h4>';
							
							output += '<p>' + myItem.addr1 + '</p>';
							output += '<hr>';
							output += '<div class="row" id="resInfo">';
							output += '<div class="col-md-7">';
							output += '<p class="">' + myItem.overview + '</p>';
							output += '</div>';
							output += '<div class="col-md-5">';
							output += '<img class="img-rounded" width="400px" height="400px" src="' + myItem.firstimage  + '"alt="대표이미지">';
							output += '</div>';
							output += '</div>';
							
					
							//output += '<h4>' + myItem.firstimage + '</h4>';
							
							console.log(output);
							$(".List").html(output);
							//document.body.innerHTML += output;
					},
					error : function(XMLHttpRequest, textStatus, errorThrown) {
						alert("Status: " + textStatus);
						alert("Error: " + errorThrown);
					}
				});
		});
	function goback(){

		history.go(-1);
	}
	
</script>
</head>
<body>



	<form method="POST" name="contentForm">
		<c:set var="viewno" value="${viewno}" />
		<input type="hidden" id="contentID" name="contentID" /> <input
			type="hidden" id="viewno" name="viewno" value="${viewno}" />

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



	</form>
	<div class="container" style="padding: 30px">
		<div class="List"></div>
	</div>
	
	<p>${myItem.title}</p>
	
	
	<div class="container">
		<!--  댓글  -->
		<div class="container">
			<label for="content">댓글</label>
			<form name="commentInsertForm">
				<div class="input-group">
					<input type="hidden" name="bno" value="${detail.bno}" /> <input
						type="text" class="form-control" id="content" name="content"
						placeholder="내용을 입력하세요."> <span class="input-group-btn">
						<button class="btn btn-default" type="button"
							name="commentInsertBtn">등록</button>
					</span>
				</div>
			</form>
		</div>

		<div class="container" >
			<div class="commentList" ></div>
		</div>
	</div>
	
	<div align="center" style="margin: 40px">
	<a href="#" class="btn btn-primary" onclick="goback()">뒤로 가기</a>
	</div>
<%--  <%@ include file="/commentS.jsp"%> --%>
</body>
</html>


