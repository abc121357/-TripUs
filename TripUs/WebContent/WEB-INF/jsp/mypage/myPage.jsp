<%--
파일명 : myPage.jsp
설명 : 자신의 정보등을 관리할 수 있는 페이지
작성일 : 2019.9.1
작성자 : LHJ
 --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>tripUs</title>

	
	

  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Small Business - Start Bootstrap Template</title>

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

<!-- bootstrap 3.4.0 -->	
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>



  <!-- Bootstrap core CSS //이게 현재 충돌남 -->
  <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/resources/css/small-business.css" rel="stylesheet">
	
	<style type="text/css">
	
	p.member{
	
	padding: 0px 15px
	
	}
	
	.card-footer{
	
	padding: 8px 20px;
	
	}
	
	.card-body{
	padding: 12.5px 12.5px 100px 12.5px;
	}
	
	
	</style>
		
	
	</head>
	<body>	
	


  <!-- Page Content -->
  <div class="container">


    <!-- Heading Row -->
    <div class="row align-items-center my-5">
    
    <!-- 왼쪽 공백 -->
    <div class="col-lg-1">
	</div>
      <div class="col-lg-5" align="center">
      <p class="btn btn-dark">나의 프로필 </p>
      <br><br>
        <img class="img-fluid rounded mb-4 mb-lg-0" src="${mprofile}" width="200px" height="200px" alt="">
      </div>
      <!-- /.col-lg-8 -->
      <div class="col-lg-5" style="padding: 0px 30px">
       
        <b style="font-size: 20px">유저 정보</b>
        
        <br>
        <br>
        
		<c:forEach items="${mInfo}" var="mem" varStatus="i">



            <div class="panel-group">
	            <div class="panel panel-primary" style="width:320px; padding : 10px 0px 0px 10px">
				 <h3 class="member text-primary">닉네임 : </h3>
	            	<p class="data" align="center">${mem.mnick}</p>	           
	            
				</div>
			</div>
			
			<div class="panel-group">
	            <div class="panel panel-primary" style="width:320px; padding : 10px 0px 0px 10px">
		          <h3 class="member text-primary">전화번호 : </h3>
		          <p class="data"align="center">${mem.mhp}</p>
             
	            
				</div>
			</div>
			
			<div class="panel-group">
	            <div class="panel panel-primary" style="width:320px; padding : 10px 0px 0px 10px">
	        		<h3 class="member text-primary">가입일 : </h3>
	        		<p class="data" align="center">${mem.minsertdate}</p>
			   
	            
				</div>
			</div>
					
			
			</c:forEach>
		
        </div>
      <!-- /.col-md-4 -->
    </div>
    <!-- /.row -->

    <!-- 이 기능은 보류중 --><!--
    <div class="card text-white bg-secondary my-5 py-4 text-center">
      <div class="card-body">
        <p class="text-white m-0">This call to action card is a great place to showcase some important information or display a clever tagline!</p>
      </div>
    </div>
     -->

	<br>
	<br>

    <!-- Content Row -->
    
    <div class="row" style="padding: 0px 10%">
      <div class="col-md-6 mb-6">
        <div class="card h-100">
          <div class="card-body">
            <h2 class="card-title">가입정보 수정</h2>
            <p class="card-text"> 내정보를 수정하려면 누르세요.</p>
          </div>
          <div class="card-footer" align="right">
            <a href="/mypage/infoupdate.do" class="btn btn-primary">수정</a>
          </div>
        </div>
      </div>
      <!-- /.col-md-4 -->
      <div class="col-md-6 mb-6">
        <div class="card h-100">
          <div class="card-body">
            <h2 class="card-title">즐겨찾기 목록</h2>
            <p class="card-text">자신이 즐겨찾기한 축제,관광지,맛집을 볼 수 있습니다.</p>
           
          </div>
          <div class="card-footer" align="right">
            <a href="/mypage/myfavorite.do?mygrade=0" class="btn btn-primary">이동</a>
          </div>
        </div>
      </div>
      <!-- /.col-md-4 -->
      

    </div>
    <!-- /.row -->
	<br>
	<br>

    <div class="row" style="padding: 0px 10%">
      <div class="col-md-6 mb-6">
        <div class="card h-100">
          <div class="card-body">
            <h2 class="card-title">Q&A</h2>
            <p class="card-text">Q&A게시판으로 이동합니다.</p>
          	
          </div>
          <div class="card-footer" align="right">
            <a href="#" class="btn btn-primary">이동</a>
          </div>
        </div>
      </div>
 		
 	   <div class="col-md-6 mb-6">
        <div class="card h-100">
          <div class="card-body">
            <h2 class="card-title">회원탈퇴</h2>
            <p class="card-text">회원을 탈퇴하려면 탈퇴버튼을 누르세요.</p>
          
          </div>
          <div class="card-footer" align="right">
            <a href="#" class="btn btn-primary">탈퇴</a>
          </div>
        </div>
      </div>    	 
 	 </div>
  </div>
  
  <!-- /.container -->

	<br>
	<br>

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="/resources/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
	
	
	
	
	
	</body>
</html>