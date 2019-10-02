<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% request.setCharacterEncoding("UTF-8");%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
					  "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<title> Notice Detail Page</title>
		
		<!--tripUs header bootstrap and css START-->
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
        
			<!-- Custom JavaScript-->
			<script src="/js/main.js"></script>
		<!--tripUs header bootstrap and css END-->
		
		<!--side navigation bootstrap and css START-->
			<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
			<script src="/js/jquery-1.12.3.min.js"></script>
         
        	<!-- Include all compiled plugins (below), or include individual files as needed -->
			<script src="/js/bootstrap.min.js"></script>
		
       	 	<!-- notice Bootstrap -->
        	<link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
			<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
			<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
		<!--side navigation bootstrap and css END-->
		
		<!--basic form bootstrap and css START-->
			<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
			<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
			<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> 
			<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js" type="text/javascript"></script>
		<!--basic form bootstrap and css END-->
		
		<!-- ntBoardList style group -->
		<style type="text/css">
			@media (min-width: 1200px){
				.container {
			   		width: 1170px;
			    	margin-bottom: -20px;
				}
			}
			
			.ntUpdateDivButton {
				float : right;
			}
			
			#row {
				margin-left : 3px;
				margin-bottom: 2%;
    		 	margin-top: 3%; 
			}
			
			.col-sm-9 {
				margin-left : 5%;
			}
			
			#topHr {
				width: 73%;
    			margin-left: 23%;
			}
			
			.nav-pills>li.active>a, .nav-pills>li.active>a:focus, 
			.nav-pills>li.active>a:hover {
	    		color: #0b3a61;
	    		background-color: #9ECFFF;
	    		font-weight: bold;
    		}
		</style>
		
		<script type="text/javascript">
			/*Push Button group Start*/
		   function ntBoardUpdateButton(ntno) {
				if(confirm(' 게시물 수정을 진행하시겠습니까? ')) { 
	  				$('#ntNo').val(ntno);
	  				$('#ntSummerDetailForm').attr('action', '/notice/ntBoardSelect.nt');
					$('#ntSummerDetailForm').submit();
				} else {
					return false;
				}
			};
		     
		   function ntBoardDeleteButton(ntno) {
			  if(confirm(' 게시물 삭제를 진행하시겠습니까? ')) {
		      	 $('#ntNo').val(ntno);
		     	 $('#ntSummerDetailForm').attr('action', '/notice/ntBoardDelete.nt');
		     	 $('#ntSummerDetailForm').submit();
			  } else {
				  return false;
			  }
		   };
		   
			function ntBoardListButton() {
				if(confirm(' FAQ 게시물 목록으로 되돌아가시겠습니까? ')) {
					$('#ntSummerDetailForm').attr('action', '/notice/ntBoardList.nt'); 
					$('#ntSummerDetailForm').submit();
				} else {
					return false;
				}
			};
			/*Push Button group End*/
		</script>
	</head>
	
	<body>
	<% System.out.println("ntBoardDetail.jsp SUCCESS >>> : "); %>
	<%--<p>${ntBoardDetail}</p>--%>
		
		<!--Start tripUs Hedaer Section-->
		<section id="header">
			<div class="header-area">
        		<div class="top_header">
            	</div>
                
            	<div class="header_menu text-center" data-spy="affix" data-offset-top="50" id="nav">
					<div class="container">
						<nav class="navbar navbar-default zero_mp">
                  			<!-- Brand and toggle get grouped for better mobile display -->
							<div class="navbar-header">
	                    		<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
		                        	<span class="sr-only">Toggle navigation</span>
		                            <span class="icon-bar"></span>
		                            <span class="icon-bar"></span>
		                            <span class="icon-bar"></span>
	                        	</button>
                    		
                    			<a class="navbar-brand custom_navbar-brand" href="/index.html"><img src="/img/trip.png" alt=""></a>
							</div>
                 			<!--End of navbar-header-->

				 			<!-- Collect the nav links, forms, and other content for toggling -->
                  			<div class="collapse navbar-collapse zero_mp" id="bs-example-navbar-collapse-1">
					   			<ul class="nav navbar-nav navbar-right main_menu">
	                          		<li class="active"><a href="/notice/ntBoardList.nt">공지사항</a></li>
	                          		<li><a href="/tour.html">여행지</a></li>
	                         		<li><a href="/cource.html">코스</a></li>
	                          		<li><a href="/rest.html">맛집</a></li>
	                          		<li><a href="/festival.html">축제</a></li>
	                          		<li><a href="/contact.html">contact us</a></li>
                       			</ul>
				   			</div>
                   			<!--/.navbar-collapse-->
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
		
		<div class="container">
			<div class="row" >
	 			<h1 id="row"> &nbsp;&nbsp; 공지사항 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <small>tripUs 홈페이지에 공지사항을 알려드립니다.</small></h1>
			</div>
		 	
		 	<br>
			
			<div role="tabpanel">
            	<div class="col-sm-2">
                	<ul class="nav nav-pills brand-pills nav-stacked" role="tablist">
                		<li role="presentation" class="brand-nav active">
                    		<a href="/notice/ntBoardList.nt" >공지사항</a>
                    	</li>
                    	
                    	<li role="presentation" class="brand-nav">
                    		<a href="/qna/qaBoardList.qa" >1:1문의하기</a>
                    	</li>
                    	
                    	<li role="presentation" class="brand-nav">
                    		<a href="/faq/faBoardList.fq">FAQ</a>
                    	</li>
                	</ul>
            	</div>
				
				
				<div class="col-sm-9">
					<%--Start DetailForm--%>
	   				<form id='ntSummerDetailForm'>
			   			<input type='hidden'  id='ntNo' name='ntno' value='${ntBoardDetail.ntno}'>
			   			<input type='hidden'  id='ntTitle' name='nttitle' value='${ntBoardDetail.nttitle}'>
			   			<input type='hidden'  id='ntId' name='ntid' value='${ntBoardDetail.ntid}'>
			   			<input type='hidden'  id='ntContent' name='ntcontent' value='${ntBoardDetail.ntcontent}'>
   					</form>
     			
     				<div class='form-group'>
             			제목   &nbsp;&nbsp; <span>${ntBoardDetail.nttitle}</span>
             			<br>
            			작성자 &nbsp;&nbsp; <span>${ntBoardDetail.ntid}</span>
            			<br>
            			등록일 &nbsp;&nbsp; <span>${ntBoardDetail.ntinsertdate}</span>
    					
    					<span style='float: right;'>
           					조회수 &nbsp;&nbsp; ${ntBoardDetail.nthit}
     					</span>
     					<br>
      				</div>
     			
     				<hr>
     			
     				<div class='form-group'>
       					<label for='ntcontent'>내용</label>
       				  	${ntBoardDetail.ntcontent}
     				</div>
     		
     				<!-- Push Button -->
     				<div class='ntUpdateDivButton'>
     					<!-- only admin use -->
     					<c:if test='${sessionScope.mgrade=="1"}'>
							<button class='btn btn-default' onclick='ntBoardUpdateButton("${ntBoardDetail.ntno}")'>수정</button>
							<button class='btn btn-default' onclick='ntBoardDeleteButton("${ntBoardDetail.ntno}")'>삭제</button>
						</c:if>
						
						<button class='btn btn-default' onclick='ntBoardListButton()'> 목록 </button>
     				</div>
     				
		     		<br>
		     		<hr>
     		
     				<div>
         				댓글공간예정
     				</div>   
     		
     				<hr>
   				</div>
   			</div> 
   			<%--End DetailForm--%>
   		</div>
	</body>
</html>