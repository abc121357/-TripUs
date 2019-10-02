<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%! String mid=""; %>
<%! String mname=""; %>
<%! String memail=""; %>
<%! String mgrade=""; %>
<%! HttpSession hs =null; %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
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


<link rel="stylesheet" type="text/css"
	href="https://korean.visitkorea.or.kr/resources/css/swiper.min.css">
<link rel="stylesheet" type="text/css"
	href="https://korean.visitkorea.or.kr/resources/css/common.css?v=20190905002" />
<link rel="stylesheet" type="text/css"
	href="/css/common.css" />
	<script type="text/javascript">
		function delete1(){
			location.href="/login/goDeleteNotice.do";
		}
	</script>
</head>

<body>
	<!--Start Hedaer Section-->
	<section id="header">
		<div class="header-area">
			<div class="top_header">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<div class="social_icon text-right">
							<%
								hs = request.getSession(true);
								mid =(String)hs.getAttribute("mid");
								mname = (String)hs.getAttribute("mname");
								memail = (String)hs.getAttribute("memail");
								mgrade = (String)hs.getAttribute("mgrade");
								if(mid==null){
							%>
								<a class="signup" href="/login/loginPage.do" role="button">
								<button type="button" class="btn btn-default btn-sm">
									로그인</button>
								</a>
								<a class="signup" href="/signup/insertForm.do" role="button">
									<button type="button" class="btn btn-default btn-sm">
										회원가입
									</button>
								</a>	
							
							
								<ul class="nav navbar-nav">
								</ul>
							<% 
								}else{ 
									if(mgrade.equals("1")){
							%>
								<a class="signup" href="/admin.jsp" role="button">
								<button type="button" class="btn btn-default btn-sm">
									관리자페이지
								</button>
								</a>	
							<%
									}
							%>
							<script>
							$(document).ready(function(){
								$("#name").html("<%=mname%>");
								$("#email").html("<%=memail%>");
							});
							</script>
							<input type="button" value="탈퇴" onclick="delete1()"/>
								<ul class="nav navbar-nav navbar-right">
									<li class="dropdown"><a href="#" class="dropdown-toggle"
										data-toggle="dropdown"> <span
											class="glyphicon glyphicon-user"></span>  <span
											class="glyphicon glyphicon-chevron-down"></span>
									</a>
										<ul class="dropdown-menu">
											<li>
												<div class="navbar-login">
													<div class="row">
														<div class="col-lg-8">
															<p class="text-center">
																<span class="glyphicon glyphicon-user icon-size"></span>
															</p>
														</div>
														<div class="col-lg-8">
															<p class="text-left">
																<strong> <span id="name"></span>님</strong>
															</p>
															<p class="text-left small"><span id="email"></span></p>
															<li class="divider"></li>

															<p class="text-left">
																<a href="#" class="btn btn-default btn-sm"> My page</a>
																<a href="/login/logout.do" class="btn btn-default btn-sm"> logout</a>
															</p>
														</div>
													</div>
												</div>
											</li>

										</ul></li>
								</ul>
							<% } %>
							</div>
						</div>
						<!--End of col-md-4-->
					</div>
					<!--End of row-->
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
							<a class="navbar-brand custom_navbar-brand" href="#"><img
								src="/img/trip.png" alt=""></a>
						</div>
						<!--End of navbar-header-->


						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse zero_mp"
							id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav navbar-right main_menu">

								<li><a href="/notice/ntBoardList.nt">공지사항</a></li>
								<li><a href="/tour.jsp">여행지</a></li>
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
	<!--Start of slider section-->
	<!--Start of slider section-->
	<section id="slider">
		<div id="carousel-example-generic"
			class="carousel slide carousel-fade" data-ride="carousel"
			data-interval="3000">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0"
					class="active"></li>
				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				<li data-target="#carousel-example-generic" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<div class="slider_overlay">
					<img src="/img/img1.jpg" alt="...">
					<div class="carousel-caption">
						<div class="slider_text">
							<h3>가을에</h3>
							<h2>강릉은 어때요?</h2>
							<p>다양한 먹거리와 산과 바다!</p>
							<a href="" class="custom_btn">Read More</a>
						</div>
					</div>
				</div>
			</div>
			<!--End of item With Active-->
			<div class="item">
				<div class="slider_overlay">
					<img src="/img/img2.jpg" alt="...">
					<div class="carousel-caption">
						<div class="slider_text">
							ㅍ
							<h3>푸르른 바다!</h3>
							<h2>부산으로 떠납시다</h2>
							<p>운치있는 가을 바다!</p>
							<a href="" class="custom_btn">Read More</a>
						</div>
					</div>
				</div>
			</div>
			<!--End of Item-->
			<div class="item">
				<div class="slider_overlay">
					<img src="/img/img3.jpg" alt="...">
					<div class="carousel-caption">
						<div class="slider_text">
							<h3>맛집 추천!</h3>
							<h2>지역의 다양한 맛집이 궁금하다면?</h2>
							<p>믿고 먹는 추천 맛집 소개!</p>
							<a href="" class="custom_btn">Read More</a>
						</div>
					</div>
				</div>
			</div>
			<!--End of item-->
		</div>
		<!--End of Carousel Inner-->
	</div>
	</section>
	<!--end of slider section-->

	<br>
	<br>



	<!--Start of portfolio-->
	<section id="portfolio" class="text-center">
		<div class="col-md-12">
			<div class="portfolio_title">
				<h2>추천!</h2>
				<p>한눈에 보기</p>
			</div>
		</div>
		<!--End of col-md-2-->
		<div class="colum">
			<div class="container">
				<div class="row">
					<form action="/">
						<ul id="portfolio_menu" class="menu portfolio_custom_menu">
							<li>
								<button data-filter="*" class="my_btn btn_active">모두</button>
							</li>
							<li>
								<button data-filter=".blue, .black, .green" class="my_btn">여행지</button>
							</li>
							<li>
								<button data-filter=".red, .green" class="my_btn">코스</button>
							</li>
							<li>
								<button data-filter=".blue, .yellow, .black" class="my_btn">맛집</button>
							</li>
							<li>
								<button data-filter=".black" class="my_btn">축제</button> <!--
                                </li>
                                <li>
                                    <button data-filter=".black" class="my_btn">Black</button>
                                </li>
                                    -->
						</ul>
						<!--End of portfolio_menu-->
					</form>
					<!--End of Form-->
				</div>
				<!--End of row-->
			</div>
			<!--End of container-->
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="notes">
						<div class="note blue">
							<div class="img_overlay">
								<p>부산광안대교</p>
							</div>
							<img
								src="https://support.visitkorea.or.kr/img/call?cmd=VIEW&id=6b393ecc-23d1-4824-ac26-9b8bf3704d87"
								alt="">
						</div>
						<div class="note red">
							<div class="img_overlay">
								<p>한양의 500년 도읍을 거닐다</p>
							</div>
							<img
								src="https://support.visitkorea.or.kr/img/call?cmd=VIEW&id=709996b0-634b-4b31-b310-6462481e8081"
								alt="">
						</div>
						<div class="note green">
							<div class="img_overlay">
								<p>성안 마을 혜화동의 어제와 오늘</p>
							</div>
							<img
								src="https://support.visitkorea.or.kr/img/call?cmd=VIEW&id=ce196cf1-c5f4-4cd0-9590-759410342eea"
								alt="">
						</div>
						<div class="note yellow">
							<div class="img_overlay">
								<p>칠곡 순대국밥</p>
							</div>
							<img
								src="https://support.visitkorea.or.kr/img/call?cmd=VIEW&id=bf030376-ce08-4a90-a28a-4c2f7b3a8f69"
								alt="">
						</div>
						<div class="note black">
							<div class="img_overlay">
								<p>부산고등어축제2019</p>
							</div>
							<img
								src="https://support.visitkorea.or.kr/img/call?cmd=VIEW&id=abc332db-af95-4472-9516-2d71d29c4580"
								alt="">
						</div>
					</div>
					<!--End of notes-->
					</div>
					<!--End of col-lg-12-->
				</div>
				<!--End of row-->
			</div>
			<!--End of container-->
		</div>
		<!--End of colum-->
	</section>
	<!--end of portfolio-->






	<!--Start of Market-->
	<section id="market">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="market_area text-center">
						<div class="row">
							
							
								<div class="btm_cont clfix">
		<!-- 0608 수정 -->
		<div class="wrap_sevice3col type1">
			<!-- [D] 공통 컴포넌트 -->
			<div class="area_left" id="otherleft">
				<div class="box_calendar">
					<!-- 0516 캘린더 수정  -->
					<!-- 190321 달력 버튼 추가 -->
					<div class="calendar_top">
						<!-- 190321 div.calendar_top 추가 -->
						<button type="button" onclick="setNewCalendar(-1);"
							class="btn_prev">
							<span class="ico">이전</span>
						</button>
						<div class="title">
							<h2 id="calTitle">
								<img src="https://korean.visitkorea.or.kr/resources/images/main/ico_calendar03.png"
									class="ico" alt="가을"><em>9월</em>, 축제속으로
							</h2>
							<!-- 1002 텍스트 수정 -->
						</div>
						<button type="button" onclick="setNewCalendar(1);"
							class="btn_next">
							<span class="ico">다음</span>
						</button>
			
					</div>

					<div class="calendar">
						<!-- div class="month">
										<strong></strong>
									</div-->
						<table id="monthsummary">
							<caption>9월 축제 일정을 일자별로 보여주는 달력, 일자별 링크를 실행하면 표 다음에 상세
								일정내용을 제공함</caption>
							<colgroup>
								<col style="width: 14.2%;">
								<col style="width: 14.2%;">
								<col style="width: 14.2%;">
								<col style="width: 14.2%;">
								<col style="width: 14.2%;">
								<col style="width: 14.2%;">
								<col style="width: 14.2%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">S</th>
									<th scope="col">M</th>
									<th scope="col">T</th>
									<th scope="col">W</th>
									<th scope="col">T</th>
									<th scope="col">F</th>
									<th scope="col">S</th>
								</tr>
							</thead>
							<tbody id="calendarUi">
								<tr>
									<td class=""><button type="button" id="1">1</button></td>
									<td class=""><button type="button" id="2">2</button></td>
									<td class=""><button type="button" id="3">3</button></td>
									<td class=""><button type="button" id="4">4</button></td>
									<td class=""><button type="button" id="5">5</button></td>
									<td class=""><button type="button" id="6">6</button></td>
									<td class=""><button type="button" id="7">7</button></td>
								</tr>
								<tr>
									<td class=""><button type="button" id="8">8</button></td>
									<td class="on"><button type="button" id="9" title="선택됨">9</button></td>
									<td class=""><button type="button" id="10">10</button></td>
									<td class=""><button type="button" id="11">11</button></td>
									<td class=""><button type="button" id="12">12</button></td>
									<td class=""><button type="button" id="13">13</button></td>
									<td class=""><button type="button" id="14">14</button></td>
								</tr>
								<tr>
									<td class=""><button type="button" id="15">15</button></td>
									<td class=""><button type="button" id="16">16</button></td>
									<td class=""><button type="button" id="17">17</button></td>
									<td class=""><button type="button" id="18">18</button></td>
									<td class=""><button type="button" id="19">19</button></td>
									<td class=""><button type="button" id="20">20</button></td>
									<td class=""><button type="button" id="21">21</button></td>
								</tr>
								<tr>
									<td class=""><button type="button" id="22">22</button></td>
									<td class=""><button type="button" id="23">23</button></td>
									<td class=""><button type="button" id="24">24</button></td>
									<td class=""><button type="button" id="25">25</button></td>
									<td class=""><button type="button" id="26">26</button></td>
									<td class=""><button type="button" id="27">27</button></td>
									<td class=""><button type="button" id="28">28</button></td>
								</tr>
								<tr>
									<td class=""><button type="button" id="29">29</button></td>
									<td class=""><button type="button" id="30">30</button></td>
									<td class="grey"><button type="button" id="99">1</button></td>
									<td class="grey"><button type="button" id="99">2</button></td>
									<td class="grey"><button type="button" id="99">3</button></td>
									<td class="grey"><button type="button" id="99">4</button></td>
									<td class="grey"><button type="button" id="99">5</button></td>
								</tr>
							</tbody>
						</table>
					</div>
					<ul class="list_calData clfix">
						<li><a href="javascript:"
							onclick="goFesDetail(&quot;04642b81-6030-4a39-92e1-54e1fd4af3e9&quot;)";
							title="마노르블랑 핑크뮬리축제 2019 로 이동"><strong>마노르블랑 핑크뮬리축제
									2019</strong>
								<div class="date">
									<em class="color1">2019.09.09~2019.11.30</em><span>제주
										서귀포시</span>
								</div></a></li>
						<li><a href="javascript:"
							onclick="goFesDetail(&quot;ff016ab9-41e2-4835-9532-344aed2cb2bb&quot;)";
							title="추석 농수특산물 서울장터 2019 로 이동"><strong>추석 농수특산물
									서울장터 2019</strong>
								<div class="date">
									<em class="color1">2019.09.09~2019.09.10</em><span>서울 중구</span>
								</div></a></li>
						<li><a href="javascript:"
							onclick="goFesDetail(&quot;292e9b94-5314-46d9-a3ff-df6e2b1afd59&quot;)";
							title="중문골프장 달빛걷기 2019 로 이동"><strong>중문골프장 달빛걷기 2019</strong>
								<div class="date">
									<em class="color1">2019.06.14~2019.10.11</em><span>제주
										서귀포시</span>
								</div></a></li>
					</ul>
				</div>

				<!-- 1206 관광가이드북 다운로드 배너 추가 -->
				<!-- 						<a href="javascript:goGuideBook();" class="btn_tg_down" title="여행 가이드북 다운로드"> -->
				<!-- 							여행 가이드북 다운로드 -->
				<!-- 							<span>모든 여행 가이드북이 여기에!</span> -->
				<!-- 						</a> -->
				<!-- // 1206 관광가이드북 다운로드 배너 추가 -->

				<!-- 20190830 추가 -->
				<div class="guidebookBanner">
					<div class="pc">
						<a href="https://korean.visitkorea.or.kr/notice/guide_book.do"><span><img
								src="https://korean.visitkorea.or.kr/resources/images/main/main_banner01.gif" alt="여행 가이드북"></span></a>
					</div>
					
					<div class="mo">
						<a href="https://korean.visitkorea.or.kr/notice/guide_book.do"><span><img
								src="https://korean.visitkorea.or.kr/resources/images/main/main_banner01.gif" alt="여행 가이드북"></span></a>
		
					</div>
				</div>

				
			
			</div>

			<div class="area_mid" id="othermid">
				<div class="article">
					<div class="mdu_thum2row2">
						<div class="tit_atc">
							<h3>'가을 별미' 삼총사</h3>
						</div>
						<ul>
							<li><a href="javascript:"
								onclick="otherDetail(&quot;undefined&quot;,&quot;undefined&quot;,&quot;https://korean.visitkorea.or.kr/detail/rem_detail.do?cotid=e1c8fdfb-eede-4d31-8a6a-7a64eeb89ecd&amp;temp=&quot;,&quot;undefined&quot;);">
									<img
									src="https://support.visitkorea.or.kr/img/call?cmd=VIEW&amp;id=27867d6f-9272-4e16-bc9a-8152628d7ce1"
									alt="두말하면 입 아픈 가을 별미, 전어">
									<div class="name">
										<strong title="두말하면 입 아픈 가을 별미, 전어">두말하면 입 아픈 가을 별미,
											전어</strong> <span> </span>
									</div>
							</a></li>
							<li><a href="javascript:"
								onclick="otherDetail(&quot;undefined&quot;,&quot;undefined&quot;,&quot;https://korean.visitkorea.or.kr/detail/rem_detail.do?cotid=7b47ef72-4bc4-4043-9fe5-f57fb32fbb32&amp;temp=&quot;,&quot;undefined&quot;);">
									<img
									src="https://support.visitkorea.or.kr/img/call?cmd=VIEW&amp;id=b2a7293b-e335-475c-a696-daa11bc8b13b"
									alt="가을날의 몸보신, 박속 낙지탕">
									<div class="name">
										<strong title="가을날의 몸보신, 박속 낙지탕">가을날의 몸보신, 박속 낙지탕</strong> <span>
										</span>
									</div>
							</a></li>
							<li><a href="javascript:"
								onclick="otherDetail(&quot;undefined&quot;,&quot;undefined&quot;,&quot;https://korean.visitkorea.or.kr/detail/rem_detail.do?cotid=fe0c20bd-1e43-411d-8368-043582a79a0b&amp;temp=.kr/detail/rem_detail.do?cotid=fe0c20bd-1e43-411d-8368-043582a79a0b&amp;temp=&quot;,&quot;undefined&quot;);">
									<img
									src="https://support.visitkorea.or.kr/img/call?cmd=VIEW&amp;id=57720148-94bb-4327-beb5-53e1b755fb97"
									alt="달콤해요 속살 꽉찬 가을 수게">
									<div class="name">
										<strong title="달콤해요 속살 꽉찬 가을 수게">달콤해요 속살 꽉찬 가을 수게</strong> <span>
										</span>
									</div>
							</a></li>
						</ul>
					</div>
				</div>
				
				<div class="article mt20">
					<div class="mdu_imgTit2">
						<div class="tit_atc">
							<h3>달아난 입맛을 찾습니다</h3>
						</div>
						<div class="imgView">
							<a href="javascript:"
								onclick="otherDetail(&quot;undefined&quot;,&quot;undefined&quot;,&quot;https://korean.visitkorea.or.kr/detail/rem_detail.do?cotid=563aa891-a14b-4895-8b8f-9baff7294bea&quot;,&quot;undefined&quot;);">
								<img
								src="https://support.visitkorea.or.kr/img/call?cmd=VIEW&amp;id=b725ffa6-bac6-42d1-985a-01dbea633326"
								alt="맛집? 휴게소! 금강휴게소 별미 도리뱅뱅이"> <strong
								title="맛집? 휴게소! 금강휴게소 별미 도리뱅뱅이">맛집? 휴게소! 금강휴게소 별미 도리뱅뱅이</strong>
							</a>
						</div>
					</div>
				</div>
				<div class="article mt20">
					<div class="mdu_thum2row2">
						<div class="tit_atc">
							<h3>늦캉스를 부탁해!</h3>
						</div>
						<ul>
							<li><a href="javascript:"
								onclick="otherDetail(&quot;undefined&quot;,&quot;undefined&quot;,&quot;https://korean.visitkorea.or.kr/detail/cs_detail_cos.do?cotid=e538d6f6-d216-4814-a135-bd7031d146c1&quot;,&quot;undefined&quot;);">
									<img
									src="https://support.visitkorea.or.kr/img/call?cmd=VIEW&amp;id=ede36cfc-45b4-4b8e-a946-940f5bcd6101"
									alt="계곡에서 즐기는 호젓한 캠핑">
									<div class="name">
										<strong title="계곡에서 즐기는 호젓한 캠핑">계곡에서 즐기는 호젓한 캠핑</strong> <span>
										</span>
									</div>
							</a></li>
							<li><a href="javascript:"
								onclick="otherDetail(&quot;undefined&quot;,&quot;undefined&quot;,&quot; https://korean.visitkorea.or.kr/detail/cs_detail_cos.do?cotid=3fb1269c-289e-49a6-a701-d287e092ac66&quot;,&quot;undefined&quot;);">
									<img
									src="https://support.visitkorea.or.kr/img/call?cmd=VIEW&amp;id=ec18a993-0071-4121-a9f9-03fc26af1fb1"
									alt="땅굴 속에서 찬바람이? 냉풍욕장 코스">
									<div class="name">
										<strong title="땅굴 속에서 찬바람이? 냉풍욕장 코스">땅굴 속에서 찬바람이?
											냉풍욕장 코스</strong> <span> </span>
									</div>
							</a></li>
							<li><a href="javascript:"
								onclick="otherDetail(&quot;undefined&quot;,&quot;undefined&quot;,&quot; https://korean.visitkorea.or.kr/detail/cs_detail_cos.do?cotid=77a33dac-7c5a-4c9a-aec5-d0402696fb0f&quot;,&quot;undefined&quot;);">
									<img
									src="https://support.visitkorea.or.kr/img/call?cmd=VIEW&amp;id=6ac4a2b2-092c-4bf5-a249-3d33c4ebb550"
									alt="동굴 찾아 떠나는 삼척여행 코스">
									<div class="name">
										<strong title="동굴 찾아 떠나는 삼척여행 코스">동굴 찾아 떠나는 삼척여행 코스</strong> <span>
										</span>
									</div>
							</a></li>
						</ul>
					</div>
				</div>
			</div>


			<div class="area_right">
				<div id="otherright">
					<div class="article">
						<div class="mdu_thum2row2">
							<div class="tit_atc">
								<h3>이 재미를 '인제'알다니!</h3>
							</div>
							<ul>
								<li><a href="javascript:"
									onclick="otherDetail(&quot;undefined&quot;,&quot;undefined&quot;,&quot;https://korean.visitkorea.or.kr/detail/rem_detail.do?cotid=cdca9f70-5cbe-42c7-876d-53a01648699a&amp;temp=&quot;,&quot;undefined&quot;);">
										<img
										src="https://support.visitkorea.or.kr/img/call?cmd=VIEW&amp;id=2f8a705c-2ee7-4160-803c-8f4da553f378"
										alt="이보다 짜릿할 순 없다, 인제 모험레포츠">
										<div class="name">
											<strong title="이보다 짜릿할 순 없다, 인제 모험레포츠">이보다 짜릿할 순 없다,
												인제 모험레포츠</strong> <span> </span>
										</div>
								</a></li>
								<li><a href="javascript:"
									onclick="otherDetail(&quot;undefined&quot;,&quot;undefined&quot;,&quot;https://korean.visitkorea.or.kr/detail/rem_detail.do?cotid=56eda3a1-439d-4dcc-92de-acd583a1052c&amp;temp=&quot;,&quot;undefined&quot;);">
										<img
										src="https://support.visitkorea.or.kr/img/call?cmd=VIEW&amp;id=30e5f805-4664-437b-bdca-5185de04c109"
										alt="인생에 한 번 무한질주! 인제 스피디움 서킷주행!">
										<div class="name">
											<strong title="인생에 한 번 무한질주! 인제 스피디움 서킷주행!">인생에 한 번
												무한질주! 인제 스피디움 서킷주행!</strong> <span> </span>
										</div>
								</a></li>
							</ul>
						</div>
					</div>
					
					<div class="article mt20">
						<div class="mdu_imgTit2">
							<div class="tit_atc">
								<h3>여기가 거기? 촬영지 투어</h3>
							</div>
							<div class="imgView">
								<a href="javascript:"
									onclick="otherDetail(&quot;undefined&quot;,&quot;undefined&quot;,&quot;https://korean.visitkorea.or.kr/detail/rem_detail.do?cotid=ec9657fe-725a-425c-9003-616500775977&amp;temp=&quot;,&quot;undefined&quot;);">
									<img
									src="https://support.visitkorea.or.kr/img/call?cmd=VIEW&amp;id=19994f35-026b-401b-921e-f3936a45b233"
									alt="<슈돌> 건나블리의  유람선타고 낭만여행"> <strong
									title="<슈돌> 건나블리의  유람선타고 낭만여행">&lt;슈돌&gt; 건나블리의 유람선타고
										낭만여행</strong>
								</a>
							</div>
						</div>
					</div>
				</div>


			</div>

		</div>
	</div>
							
							
							
						</div>
						<!--End of row-->
					</div>
					<!--End of market Area-->
				</div>
				<!--End of col-md-12-->
			</div>
			<!--End of row-->
		</div>
		<!--End of container-->
	</section>
	<!--End of market-->


	<br>

	<ul class="logo_list">
		<li><a href="http://api.visitkorea.or.kr/" target="_blank"
			title="새창"><img
				src=https://korean.visitkorea.or.kr/resources/images/common/logo_foot_api.png
				alt="TourAPI"></a></li>
		<li><a href="http://kto.visitkorea.or.kr/kor.kto" target="_blank"
			title="새창"><img
				src=https://korean.visitkorea.or.kr/resources/images/common/logo_foot_gg.png
				alt="한국관광공사"></a></li>
		<li><a href="http://www.mcst.go.kr/" target="_blank" title="새창"><img
				src=https://korean.visitkorea.or.kr/resources/images/common/logo_foot_mg.png
				alt="문화체육관광부"></a></li>
	</ul>


	<!--Start of footer-->
	<section id="footer">
		<div class="container">
			<div class="row text-center">
				<div class="col-md-6">
					<div class="copyright">
						<p>
							@ 2019 - Design By <span><a href="">&#9798;</a></span>
						</p>
					</div>
				</div>
				<div class="col-md-6">
					<div class="designer">
						<p>
							A Design By <a href="#">한땀</a>
						</p>
					</div>
				</div>
			</div>
			<!--End of row-->
		</div>
		<!--End of container-->
	</section>
	<!--End of footer-->



	<!--Scroll to top-->
	<a href="#" id="back-to-top" title="Back to top">&uarr;</a>
	<!--End of Scroll to top-->


	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<!-- <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js'></script>-->
	<script src="/js/jquery-1.12.3.min.js"></script>

	<!--Counter UP Waypoint-->
	<script src="/js/waypoints.min.js"></script>
	<!--Counter UP-->
	<script src="/js/jquery.counterup.min.js"></script>
	<!--Google Maps API-->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBjxvF9oTfcziZWw--3phPVx1ztAsyhXL4"></script>


	<!--Isotope-->
	<script src="/js/isotope/min/scripts-min.js"></script>
	<script src="/js/isotope/cells-by-row.js"></script>
	<script src="/js/isotope/isotope.pkgd.min.js"></script>
	<script src="/js/isotope/packery-mode.pkgd.min.js"></script>
	<script src="/js/isotope/scripts.js"></script>


	<!--Back To Top-->
	<script src="/js/backtotop.js"></script>


	<!--JQuery Click to Scroll down with Menu-->
	<script src="/js/jquery.localScroll.min.js"></script>
	<script src="/js/jquery.scrollTo.min.js"></script>
	<!--WOW With Animation-->
	<script src="/js/wow.min.js"></script>
	<!--WOW Activated-->
	<script>
		new WOW().init();
	</script>


	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="/js/bootstrap.min.js"></script>
	<!-- Custom JavaScript-->
	<script src="/js/main.js"></script>
</body>

</html>