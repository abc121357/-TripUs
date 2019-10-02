<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%! String mid=""; %>
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
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
	<style>
	     .header1{
	        font-size:2em;      
	    }
	</style>
	<script type="text/javascript">
		function cancle(){
			document.DeleteForm.action="/login/goIndex.do";
			document.DeleteForm.submit();
		}
		function next(){
			console.log("next함수 클릭");
			var pw = document.DeleteForm.mpw.value;
			var id = document.DeleteForm.mid.value;
			
			$.ajax({
				url:"/login/memberLogin.do",
				type:"GET",
				data: {mid:id, mpw : pw},
				dataType : "text",
				success:function(data){
					console.log("data : "+data);
					if(data=="false"){
						alert("비밀번호가 일치하지 않습니다. 다시 입력하세요.");
						document.DeleteForm.mpw.value="";
						document.DeleteForm.mpw.focus();
					}
					else{
						var delConfirm = confirm('정말로 탈퇴 하시겠습니까?');
						if(delConfirm) {
							$.ajax({
								url:"/login/memberDelete.do",
								type:"GET",
								data: {mid : id},
								dataType : "text",
								success:function(data){
									console.log("결과 : "+data);
									if(data=="TRUE"){
										alert("탈퇴 성공. 메인페이지로 이동합니다");
										document.DeleteForm.action="/login/goIndex.do";
										document.DeleteForm.submit();
									}
									else{
										alert("탈퇴 실패.. 오류당ㅠㅠ");
									}
								},
								error:function(data){
									console.log("에러발생");				
								}
							});
						}
						else{
							alert('탈퇴가 취소되었습니다.');
						}
					}
				},
				error:function(data){
					console.log("에러발생");				
				}
			});
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
	<%
		hs = request.getSession(true);
		mid =(String)hs.getAttribute("mid");
		if(mid!=null){
			request.setAttribute("mid",mid);	
	%>
	<table class="table"style="margin-left:400px; width:55%;">
	<thead><th>
		<span class="header1">회원탈퇴</span> > 안내사항 > 비밀번호 재확인<br>
	</th></thead>
	<tbody><tr><td>안전한 TripUs 사용을 위해 비밀번호를 다시 한 번 입력해주세요.<br><br><br>
		<div id="delete" style="margin-left:300px; width:40%;">
		<form name="DeleteForm" method="POST">
			<div class="form-group">
				<label>아이디</label><br>
				<input type="text" class="form-control mx-sm-2" id="mid" name="mid" value="${mid}" disabled/><br />
	          	</div>
	          	<div class="form-group">
				<label>비밀번호</label>
				<input type="password" class="form-control mx-sm-0" id="mpw" name="mpw" >
				<small class="text-muted">* 소문자,특수문자,숫자를 포함한 8~15자를 입력해주세요. </small>
			</div>
			<center style="margin-top:100px;">
				<input type="button" class="btn btn-primary btn-sm" name="cancel" value="취소" onclick="cancle()"/>
				<input type="button" class="btn btn-secondary btn-sm" name="ok" value="확인" onclick="next()"/>
			</center>
		</form>
		</div>
	</table>
	<%
		}else{
	%>
		<p><h3>로그인 하고 탈퇴해랏!~</h3></p><br>
			<a href="/login/loginPage.do">로그인하기</a>
	<%
		}
	%>
</body>
</html>