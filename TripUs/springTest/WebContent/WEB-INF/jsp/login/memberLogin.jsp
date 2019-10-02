<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%! String mid=""; %>
<%! String mname=""; %>
<%! String memail=""; %>
<%! String mgrade=""; %>
<%! HttpSession hs =null; %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, initial-scale=1, shrink-to-fit=no">
	
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	
	<title>TripUs</title>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
	
	<!--Animated CSS-->
	<link rel="stylesheet" type="text/css" href="/css/animate.min.css">
	
	<!-- Bootstrap -->
	<link href="/css/bootstrap.min.css" rel="stylesheet">
	<!--Bootstrap Carousel-->
	<link type="text/css" rel="stylesheet" href="/css/carousel.css" />

	<link rel="stylesheet" href="/css/isotope/style.css">
	
	<!--Main Stylesheet-->
	<link href="/css/style.css" rel="stylesheet">
	<!--Responsive Framework-->
	<link href="/css/responsive.css" rel="stylesheet">
	
	<link rel="stylesheet" type="text/css" href="https://korean.visitkorea.or.kr/resources/css/swiper.min.css">
	<link rel="stylesheet" type="text/css" href="https://korean.visitkorea.or.kr/resources/css/common.css?v=20190905002" />
	<link rel="stylesheet" type="text/css" href="/css/common.css" />
	
	<script type="text/javascript">
	 
		function login(){
			alert("로그인 버튼 누름~");
			var id = document.loginForm.mid.value;
			var pw = document.loginForm.mpw.value;
			
			$.ajax({
				url:'/login/memberLogin.do',
				type:"GET",
				data: {mid:id,mpw:pw},
				dataType : "text",
				success:function(data){
					console.log("data : "+data);
					if(data=="true"){
						alert("로그인 성공. 메인페이지로 이동");
						document.loginForm.action="/login/goIndex.do";
						document.loginForm.submit();
					}
					else if(data=="false"){
						alert("잘못 입력하였습니다. 다시 입력하세요.");
						
					}
					else{console.log("? 컨트롤러 뭐함");}
				},
				error:function(data){
					console.log("에러발생");				
				}
			});
		}
		$(function() {
			$("#login").load("/login/goLogin.do");
		});
	</script>
	
	
	</head>
	<body>
		<!--Start Hedaer Section-->
	<section id="header">
		<div class="header-area">
			<div class="top_header">
				
			</div>
		</div>
		<!--End of top header-->
		<div class="header_menu text-center" data-spy="affix"
			data-offset-top="50" id="nav">
			<div class="container">
				<nav class="navbar navbar-default zero_mp ">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1"
							aria-expanded="false">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand custom_navbar-brand" href="/login/goIndex.do"><img
							src="/img/trip.png" alt=""></a>
					</div>
					<!--End of navbar-header-->


					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse zero_mp"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav navbar-right main_menu">

							<li><a href="/notice/ntBoardList.nt">공지사항</a></li>
							<li><a href="/tour.html">여행지</a></li>
							<li><a href="/cource.html">코스</a></li>
							<li><a href="/rest.html">맛집</a></li>
							<li><a href="/festival.html">축제</a></li>
							<li><a href="/contact.html">contact us</a></li>
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
	<!--End of Hedaer Section-->
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<table class="table"style="margin-left:400px; width:55%;">
	<thead><th>
		<div class="header1">로그인</div><br>
		
	</th></thead>
	<tbody><tr><td><br><br>
		<div id="login" style="margin-left:300px; width:40%;">
		</div>
	</td></tr></tbody></table>
	</body>
</html>