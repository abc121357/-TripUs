<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
	<style>
	     .header1{
	        font-size:2em;    
	    }
	    .cont{
	    	font-size:1.4em;
	    	font-weight: 600;
	    }
	</style>
	<script type="text/javascript">
		function cancle(){
			document.NoticeForm.action="/login/goIndex.do";
			document.NoticeForm.submit();
		}
		function next(){
			document.NoticeForm.action="/login/goMemberDelete.do";
			document.NoticeForm.submit();
		}
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
		<span class="header1">회원탈퇴</span> > 안내사항 <br>
	</th></thead>
	<tbody><tr><td><br><br><br>
		<div id="Notice" style="margin-left:100px; width:80%;">
		<form name="NoticeForm" method="POST">
			<div class="form-group">
				<span class="cont">1. 사용하고 계신 아이디는 탈퇴할 경우 재사용 및 복구가 불가능합니다.</span><br>
				<small class="text-muted">&nbsp;* 탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다. </small></br></br>
				<span class="cont">2. 탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</span></br></br>
				<span class="cont">3. 탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.</span></br>
				<small class="text-muted">* 게시글 및 댓글은 탈퇴 시 자동 삭제되지 않고 그대로 남아 있습니다. </small></br>
				<small class="text-muted">* 삭제를 원하는 게시물이 있다면 반드시 탈퇴 전 비공개 처리하거나 삭제하시기 바랍니다. </small></br></br>
			</div>	
			<center style="margin-top:100px;">			
				<input type="checkbox" name="notice" value="confirmed">안내 사항을 모두 확인하였으며, 이에 동의합니다.<br></br>
				<input type="button" class="btn btn-primary btn-sm" name="cancel" value="취소" onclick="cancle()"/>
				<input type="button" class="btn btn-secondary btn-sm" name="ok" value="확인" onclick="next()"/>
			</center>
		</form>
		</div>
	</table>
</body>
</html>