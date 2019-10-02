<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mail.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
	
	function emailCheck(){	//[인증번호 전송]버튼 클릭 시
		alert("버튼 누름~");
		var email = $("#memail").val();
		console.log("입력 email : "+email);
		$.ajax({
			url:"/login/emailCheck.do",
			type:"GET",
			data: {memail:email},
			dataType : "text",
			success:function(data){
				console.log("data : "+data);
				if(data=="false"){
					alert("잘못된 이메일을 입력하였습니다. 다시 입력하세요.");
					document.idFindForm.memail.value="";
					document.idFindForm.memail.focus();
				}
				else{
					document.idFindForm.ck.value="인증번호 재전송";
					document.idFindForm.number.value=data;
					window.open('','EmailCHECK',"width=370,height=360, resizable=no, scrollbars=no, status=no");
					document.idFindForm.action="/login/goTestMail.do";
					document.idFindForm.target='EmailCHECK';
					document.idFindForm.submit();
				}
			},
			error:function(data){
				console.log("에러발생");				
			}
		});
	}
	function numCheck(){	//[인증번호 확인] 버튼 클릭 시
		var num = document.idFindForm.number.value;
		console.log("인증번호 확인 버튼 클릭, number : "+num);
		var input = document.idFindForm.num.value;
		console.log("입력한 인증번호 : "+input);
		if(num==input){
			console.log("인증 성공!!!");
			alert("인증 성공!");
			document.idFindForm.nextOK.value="인증성공";
			return;
		}
		else{
			console.log("인증 실패.");
			alert("잘못된 인증번호를 입력하였습니다.");
			return;
		}
	}
	function cancel(){	//[로그인하기] 버튼 클릭 시 로그인화면으로 이동
		document.idFindForm.action="/login/loginPage.do";
		document.idFindForm.submit();
	}	
	function OK(){		//[다음] 버튼 클릭 시 아이디 출력화면 (창 새로 뜸 ㅠㅠ)
		var res=document.idFindForm.nextOK.value;
		if(res=="인증성공"){
			
			document.idFindForm.action="/login/goIdFindPrint.do";
			document.idFindForm.submit();
		}
		else{
			alert("인증번호 확인을 하세요.");
		}
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
		<div class="header1">아이디 찾기</div><br>
		
	</th></thead>
	<tbody><tr><td><br><br>
		<div id="idFind" style="margin-left:300px; width:40%;">
		<form name="idFindForm" method="POST">
		<input type="hidden" id="result" name="result"/>
		<input type="hidden" id="number" name="number"/>
		<input type="hidden" id="nextOK"/>
			<div class="form-group">
			<label>이메일</label>
				<input type="email" class="form-control mx-sm-2" id="memail" name="memail"/>
				<small class="text-muted">* 회원가입 시 등록한 이메일을 입력해주세요. </small>
          		</div>
			<input type="button" class="btn btn-secondary btn-sm" value="인증번호 전송" onclick="emailCheck()" id="ck"/>
			
			<div class="form-group">
				<label>인증번호</label>
				<input type="email" class="form-control mx-sm-0" id="num" name="num" >
				<small class="text-muted">* 이메일로 전송된 인증번호를 입력하세요. </small>
			</div>
			
			<input type="button" class="btn btn-secondary btn-sm" value="인증번호 확인" onclick="numCheck()" />
			<br>
			<center style="margin-top:30px;">
				<input type="button" class="btn btn-secondary btn-sm" value="로그인하기" onclick="cancel()" />
				<input type="button" class="btn btn-primary btn-sm" value="다음" onclick="OK()" />
			</center>
		</form>
		</div>
	</td></tr></tbody></table>
	<div id="result"></div>	
	
</body>
</html>