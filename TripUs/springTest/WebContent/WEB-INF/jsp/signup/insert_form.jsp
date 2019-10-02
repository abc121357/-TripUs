<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TripUs 회원가입 </title>
<link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
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
<script type="text/javascript" src="/js/bootstrap.min.js">
	
</script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.6.4.js"></script>
<script type="text/javascript">
	// 별명 [중복확인] 버튼 클릭시
	function nickCheckFun() {
		
		var nick = $("#mnick").val();
		console.log("insert_form.jsp mnick >>> " + nick);
		$.ajax({
			type : "POST",
			url : "/signup/nickCheck.do",
			data : {
				mnick : nick
			},
			success : function(data) {
				console.log("data >>> " + data);
				if ($.trim(data) == "true") {
					if ($('#mnick').val() != '') {
						alert("사용 가능한 별명 입니다.");
					}
				} else {
					if ($('#mnick').val() != '') {
						alert("중복된 별명입니다. 다른 별명을 입력해주세요.");
						$('#mnick').val('');
						$('#mnick').focus();
					}
				}
			}
		})
	};

	// 비밀번호 [재확인] 버튼 클릭시
	function pwCheckFun() {
		alert("비밀번호가 일치 합니다.");
		$('#mpw_r').blur(function() {
			if ($('#mpw').val() != $('#mpw_r').val()) {
				if ($('#mpw_r').val() != '') {
					alert("비밀번호가 일치하지 않습니다.");
					$('#mpw_r').val('');
					$('#mpw_r').focus();
				}
			}
		})
	};

	//아이디 [중복확인] 버튼 클릭시
	function idCheckFun() {
		
		var id = $("#mid").val();
		console.log(" insert_form.jsp mid >>> " + id);
		$.ajax({
			type : "POST",
			url : "/signup/idCheck.do",
			data : {
				mid : id
			},
			success : function(data) {
				console.log("data >>> " + data);
				if ($.trim(data) == "true") {
					if ($('#mid').val() != '') {
						alert("사용 가능한 아이디 입니다.");
					}
				} else {
					if ($('#mid').val() != '') {
						alert("중복된 아이디입니다.");
						$('#mid').val('');
						$('#mid').focus();
					}
				}
			}
		})
	};

	//[인증번호 전송] 클릭시
	function emailCheck() {
		alert("인증번호를 전송합니다.");
		var memail = $('#memail').val();
		console.log(" insert_form.jsp memail >>> " + memail);
		$
				.ajax({
					url : "/signup/emailCheck.do",
					type : "GET",
					data : {
						memail : memail
					},
					dataType : "text",
					success : function(data) {
						console.log("data : " + data);
						if (data == "false") {
							alert("중복이메일입니다. 이메일을 다시 입력하세요");
							document.signupform.memail.value = "";
							document.signupform.memail.focus();
						} else {
							alert("사용가능한 이메일입니다. 인증절차를 완료해주세요");
							//document.signupform.memail.ck.value="인증번호 재전송";
							document.signupform.number.value = data;
							window
									.open('',"_blank",
											"width=370,height=360, resizable=no, scrollbars=no, status=no");
							document.signupform.action = "/signup/goTestMail.do";
							document.signupform.target = "_blank";
							document.signupform.submit();
						}
					},
					error : function(data) {
						console.log("에러발생");
					}
				})
	};
	// end of emailCheck() function

	function numCheck() { // [인증번호 확인] 클릭시
		var num = document.signupform.number.value;
		console.log("인증번호 확인 버튼 클릭 > number >>> " + num);
		var input = document.signupform.num.value;
		console.log("입력한 인증번호 >>> " + input);
		if (num === input) {
			console.log("인증 성공  !! ");
			alert("이메일 인증에 성공하였습니다 !");
			document.signupform.nextOK.value = "인증 성공";
			return;
		} else {
			console.log("인증 실패 >>>");
			alert("인증번호가 일치하지 않습니다.");
			return;
		}
	}// end of numCheck() function

	function formCheckFun() {
		// 성별
		var checked_radio = $('input:radio[name=mgender]:checked').val();
		if (checked_radio === undefined && "") {
			alert('성별을 선택 해주세요');
			document.getElementById("mgender").focus();
			return false;
		} else {
			alert("선택된 성별은 >>> " + checked_radio);
			document.signupform.mgender.value = checked_radio;
		}

		alert("회원가입을 진행합니다.");

		$('#signupform').attr("action", "/signup/insertMember.do");
		$('#signupform').submit();

		alert("회원가입이 완료되었습니다! TripUs의 회원이 되신 걸 환영합니다!");
	};
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
							<a class="navbar-brand custom_navbar-brand" href="index.html"><img
								src="/img/trip.png" alt="index.html"></a>
						</div>
						<!--End of navbar-header-->


						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse zero_mp"
							id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav navbar-right main_menu">
								<li><a href="index.html">Home <span class="sr-only">(current)</span></a></li>
								<li><a href="notice.html">공지사항</a></li>
								<li><a href="tour.html">여행지</a></li>
								<li><a href="cource.html">코스</a></li>
								<li><a href="rest.html">맛집</a></li>
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
	<!--End of Hedaer Section-->
<br>
<br>
<br>
<br>



	<div style="margin-left: 700px;width: 500px;">
		<h2 style="text-align: center;">회원가입</h2>
		<br>
		<form id="signupform" name="signupform" method="post">
			
			<div class="signup-form">
				<label for="input_mid">아이디</label> <input type="text" id="mid"
					name="mid" class="form-control"
					placeholder="* 영문(필수) + 숫자(추가) / 5~10자" value="${memberVO.mid}" />
			</div>
			<div class="signup-form" style="text-align: right; margin-top: 5px;">
				<button type="button" class="btn btn-sm" id="idcheck" name="idcheck"
					onclick="idCheckFun()">중복확인</button>
			</div>

			<div class="signup-form" style="margin-bottom: 15px;">
				<label for="input_mpw">비밀번호</label> <input type="password" id="mpw"
					name="mpw" class="form-control"
					placeholder="* 소문자 + 특수문자 + 숫자 / 8 ~15자" value="${memberVO.mpw}" />
			</div>
			<div class="signup-form">
				<label for="input_mpw_r">비밀번호 확인</label> <input type="password"
					id="mpw_r" name="mpw_r" class="form-control"
					placeholder="비밀번호를 확인해주세요" />
			</div>
			<div class="signup-form" style="text-align: right;margin-top: 5px;">
				<button type="button" class="btn btn-sm" id="pwcheck" name="pwcheck"
					onclick="pwCheckFun()" >재확인</button>
			</div>
			<div class="signup-form" style="margin-bottom: 15px;">
				<label for="input_mname">이름</label> <input type="text" id="mname"
					name="mname" class="form-control" placeholder="* 한글 10자"
					value="${memberVO.mname}" />
			</div>
			<div class="signup-form">
				<label for="input_mnick">별명</label> <input type="text" id="mnick"
					name="mnick" class="form-control" placeholder="* 한글 10자"
					value="${memberVO.mnick}" />
			</div>
			<div class="signup-form" style="text-align: right;margin-top: 5px;">
				<button type="button" class="btn btn-sm" id="nickcheck" name="nickcheck"
					onclick="nickCheckFun()" >중복확인</button>
			</div>
			<div class="signup-form" style="margin-bottom: 15px;">
				<label for="input_mgender">성별</label> <br> <input type="radio"
					id="mgender" name="mgender" value="F"> 여성 <input
					type="radio" id="mgender" name="mgender" value="M"> 남성
			</div>
			<div class="signup-form" style="margin-bottom: 15px;">
				<label for="input_mhp">전화번호</label> <input type="text" id="mhp"
					name="mhp" class="form-control" placeholder="* 예) 01077771111"
					value="${memberVO.mhp}" />
			</div>
			<div class="signup-form">
				<label for="input_memail">이메일</label> <input type="text" id="memail"
					name="memail" class="form-control"
					placeholder="* 예) tripus@tripus.com" value="${memberVO.memail}" />
			</div>
			<div class="signup-form" style="text-align: right; margin-top: 5px;">
				<input type="hidden" id="number" name="number" />
				<button type="button" class="btn btn-sm" id="send_email"
					onclick="emailCheck(); return false;">인증번호 전송</button>
			</div>
			<div class="signup-form">
				<label for="input_num">인증번호</label> <input type="text" id="num"
					name="num" class="form-control"
					placeholder="메일로 전송받으신 인증번호를 입력해주세요." value="${memberVO.num}" />
			</div>
			<div class="signup-form" style="text-align: right; margin-top: 5px;">
				<button type="button" class="btn btn-sm" onclick="numCheck()" >
				인증번호 확인
				</button>
			</div>
			<div class="signup-form">
				<label for="input_mbirth">생년월일</label> <input type="text"
					id="mbirth" name="mbirth" class="form-control"
					placeholder="* 예) 1995-05-05" value="${memberVO.mbirth}" />
			</div>
			<br> <br>

			<div class="signup-form" style="text-align: center; margin-bottom: 50px;">
				<input type="button" class="btn btn-default" id="formcheck"
					value="등록" onclick="formCheckFun()" /> <input type="hidden"
					id="nextOK" />
			</div>
		</form>
	</div>
	
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<!-- <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js'></script>-->
	<script src="/js/jquery-1.12.3.min.js"></script>



	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="/js/bootstrap.min.js"></script>
	<!-- Custom JavaScript-->
	<script src="/js/main.js"></script>
	
</body>
</html>