<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<% request.setCharacterEncoding("UTF-8");%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
					  "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<title> Notice Write Page</title>
		
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
			<!-- include libraries(jQuery, bootstrap) -->
			<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
			<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
			<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> 
		<!--basic form bootstrap and css END-->
	
		<!-- include summernote css/js START-->
			<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
			<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>   
		<!-- include summernote css/js END-->
		
		<!-- ntBoardList style group -->
		<style type="text/css">
			@media (min-width: 1200px){
				.container {
			   		width: 1170px;
			    	margin-bottom: -20px;
				}
			}
		
			.ntButton {
				float : right;
				margin-left : 7px;
			}
			
			.textBytesSpan {
				float : right;
				margin-right: 5px;
			}
			
			#ntWriteNtTitleCheck, #ntWriteNtContentCheck {
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
			
			.nav-pills>li.active>a, .nav-pills>li.active>a:focus, 
			.nav-pills>li.active>a:hover {
	    		color: #0b3a61;
	    		background-color: #9ECFFF;
	    		font-weight: bold;
    		}
		</style>

		<script type="text/javascript">
   			$(document).ready(function() {
   				/* Button mode that changes in Situation Start*/
   				var ntMode = '${ntMode}';
				console.log('ntBoardinsert.jsp ntMode value confirm >>> : ' + ntMode);
				
				if(ntMode == 'ntInsert') {
					document.getElementById('ntSummerInsertButton').style.display='block';
					document.getElementById('ntSummerUpdateButton').style.display='none';
					document.getElementById('ntSummerResetButton').style.display='block';
					$('#ntTitle').focus();
				} else if(ntMode == 'ntUpdate') {
					document.getElementById('ntSummerInsertButton').style.display='none';
					document.getElementById('ntSummerUpdateButton').style.display='block';
					document.getElementById('ntSummerResetButton').style.display='block';
					$('#ntTitle').focus();
				}
				/* Button mode that changes in Situation End*/
   				
				/* Summernote Set*/
	       		 $('#ntSummernoteText').summernote({
	             	 height   : 300,                   // set editor height
	            	 minHeight: null,               // set minimum height of editor
	            	 maxHeight: null,               // set maximum height of editor
	             	 callbacks: {
	             	 onBlur   : function(e) {
	    							//validation action on inputBox click
									if($('#ntSummernoteText').val() == '') {
										$('#ntWriteNtContentCheck').text('문의 내용을 입력해주세요.');
										$('#ntWriteNtContentCheck').css('color', 'red');
									return false;
									}
							
	    							if($('#ntSummernoteText').val() != '') {
										$('#ntWriteNtContentCheck').text('');
									return true;
									}
	             	    		}
	             	 }
				 }); 
				
				/* validation action on inputBox click Start */
				$('#ntTitle').blur(function() {
					if($('#ntTitle').val() == '') {
						$('#ntWriteNtTitleCheck').text('문의 제목을 입력해주세요.');
						$('#ntWriteNtTitleCheck').css('color', 'red');
						return false;	
					} else if($('#ntTitle').val().length > 30) {
						$('#ntWriteNtTitleCheck').text('문의 제목을 30자 이내로 입력해주세요.');
						$('#ntWriteNtTitleCheck').css('color', 'red');
						return false;	
					} else if(!$('#ntTitle').val() =='' || $('#ntTitle').val().length < 30) {
						$('#ntWriteNtTitleCheck').text("");
						return true;	
					}
				});
				/* validation action on inputBox click End */
			});
   			
   			
   			/*Push Button group Start*/
  			function ntSummerInsertButton() {
  				if(!ntValidation()) return; 
  					if(confirm(' 게시물 등록을 계속 진행하시겠습니까? ')) {
     					 $('#ntSummerInsertForm').attr('action', '/notice/ntBoardInsert.nt');
  				 		 $('#ntSummerInsertForm').submit();
  				 	} else {
  						return false;
  				 	}
  			};	 
  			
  			function ntSummerUpdateButton() {
  				if(!ntValidation()) return; 
  					if(confirm(' 게시물 수정을 계속 진행하시겠습니까? ')) {
		 				$('#ntSummerInsertForm').attr('action', '/notice/ntBoardUpdate.nt');
	     				$('#ntSummerInsertForm').submit();
  					} else {
  						return false;
  					}
	  		};
  			
  			function ntSummerResetButton() {
  					if(confirm(' 해당 게시물 작업을 취소하시겠습니까? ')) {
		  				$('#ntSummerInsertForm').attr('action', '/notice/ntBoardList.nt'); 
						$('#ntSummerInsertForm').submit();
  					} else {
  						return false;
  					}
 			};
 			/*Push Button group End*/
  			
			/* validation action on insertButton click Start */
			function ntValidation() {
				var ntChk = true;
					
				if($('#ntTitle').val() == '') {
					$('#ntTitle').focus();
					$('#ntWriteNtTitleCheck').text('문의 제목을 입력해주세요.');
					$('#ntWriteNtTitleCheck').css('color', 'red');
					ntChk = false;
					return  ntChk;
				} 
					
				if($('#ntTitle').val().length > 30) {
					$('#ntTitle').focus();
					$('#ntWriteNtTitleCheck').text('문의 제목을 30자 이내로 입력해주세요.');
					$('#ntWriteNtTitleCheck').css('color', 'red');
					ntChk = false;
					return  ntChk;
				}
					
				if(!$('#ntTitle').val() =='' || $('#ntTitle').val().length < 30) {
					$('#ntWriteNtTitleCheck').text("");
					ntChk = true;
				}
					
				if(!$('#ntSummernoteText').val() == '') {
					ntChk = true;
				}
					
				if($('#ntSummernoteText').val() == '') {
					$('#ntWriteNtContentCheck').text('문의 내용을 입력해주세요.');
					$('#ntWriteNtContentCheck').css('color', 'red');
					$('#ntSummernoteText').focus();
					ntChk = false;
					return  ntChk;
				}
				return  ntChk;
			};
			/* validation action on insertButton click End */
		</script>
	</head>
	
	<body>
	<% System.out.println("ntBoardInsert.jsp SUCCESS >>> : "); %>
	<%--<p>${NtBoardVo}</p>--%>
	
		<!--Start tripUs Hedaer Section-->
		<section id="header">
			<div class="header-area">
	        	<div class="top_header">
	            </div>
	                
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
		
   		<div class='container'>
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
	   				<%--Start WriteForm--%>
					<form id='ntSummerInsertForm' method='post'>
					<input type='hidden' id='sessionIdHidden' value='${sessionScope.mid}'/>
						<div class='form-group'>
			       			<label for='ntno'>NO</label>
			       			<input type='text' class='form-control' id='ntNo' name='ntno' value='${NtBoardUpdate.ntno}' readonly='readonly' />
			     		</div>
			     		
			     		<div class='form-group'>
			       			<label for='ntid'>작성자</label>
			       			<input type='text' class='form-control' id='ntId' name='ntid' value='${sessionScope.mid}' readonly='readonly' />
			     		</div>
					
			     		<div class='form-group'>
			       			<label for='nttitle'>제목</label>
			       			<span id='ntWriteNtTitleCheck'></span>
			       			<input type='text' class='form-control' id='ntTitle' name='nttitle'  value='${NtBoardUpdate.nttitle}' />
			     		</div>
			     		
			     		<div class='form-group'>
			       			<label for='ntcontent'>내용</label>
			       			<span id='ntWriteNtContentCheck'></span>
			       			<textarea id='ntSummernoteText' name='ntcontent'>${NtBoardUpdate.ntcontent}</textarea>
			     		</div>
			   		</form>
			        <%-- End WriteForm --%>
				  
				  	<!-- Push Button -->
			     	<span class='ntButton'><button class='btn btn-default'  id='ntSummerResetButton'  onclick='ntSummerResetButton()'>취소</button></span>
			     	<span class='ntButton'><button class='btn btn-default'  id='ntSummerUpdateButton' onclick='ntSummerUpdateButton()'>수정</button></span>
			     	<span class='ntButton'><button class='btn btn-default'  id='ntSummerInsertButton' onclick='ntSummerInsertButton()'>등록</button></span>
	   			</div>
   			</div> 
   		</div>
   		
   		<br>
   		<br>
   		
	</body>
</html>