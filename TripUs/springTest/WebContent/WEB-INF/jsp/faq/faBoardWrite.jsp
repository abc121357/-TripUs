<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<% request.setCharacterEncoding("UTF-8");%>
	
<%
		pageContext.setAttribute("br", "<br/>");
		pageContext.setAttribute("cn", "\n");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
					  "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<title> FAQ Write Page</title>
		
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
			
			<!--JQuery Click to Scroll down with Menu-->
			<script src="/js/jquery.localScroll.min.js"></script>
			<script src="/js/jquery.scrollTo.min.js"></script>
			
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
		
		<style type="text/css">
			@media (min-width: 1200px){
				.container {
			   		width: 1170px;
			    	margin-bottom: -20px;
				}
			}
			
			.faRequired {
				color : #088deb;
			}
			
			.faSpan {
				float : right;
			    margin : 10px 0px 0px 5px;
	    	    font-weight : bold;
			}
			
			.faTbleOne {
				border-collapse : separate;
		 		border-spacing : 3px 2px;
		 	    border-top : 1px solid #ddd;
		 	    border-right: 1px solid #ddd;
		 	    border-left : 1px solid #ddd;
			}
			
			.faTblOneTh {
				width: 6%;
				font-weight : bold;
		 		border : 1px solid #ddd; 
				font-size : 16px;
				color : #747070;
				background: #e9f2fa;
			}
			
			.faTblOneTd {
				width: 20%;
				color : #747070;
			}
			
			#faNo, #faId, #faType {
				width : 30%;
			}
			
			.textBytesSpan {
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
			$(document).ready(function(){
				/* Button mode that changes in Situation Start*/
				var faMode = '${faMode}';
				console.log('faBoardWrite.jsp faMode value confirm >>> : ' + faMode);
				
				if(faMode == 'faInsert') {
					document.getElementById('faInsertButton').style.display='block';
					document.getElementById('faUpdateButton').style.display='none';
					document.getElementById('faDeleteButton').style.display='none';
					document.getElementById('faBackListButton').style.display='block';
					$('#faTitle').focus();
				} else if(faMode == 'faUpdate') {
					document.getElementById('faUpdateButton').style.display='block';
					document.getElementById('faDeleteButton').style.display='none';
					document.getElementById('faInsertButton').style.display='none';
					document.getElementById('faBackListButton').style.display='block';
					$('#faTitle').focus();
				} else if(faMode == 'faDelete'){
					document.getElementById('faUpdateButton').style.display='none';
					document.getElementById('faDeleteButton').style.display='block';
					document.getElementById('faInsertButton').style.display='none';
					document.getElementById('faBackListButton').style.display='block';
				};
				/* Button mode that changes in Situation End*/
				
				/* fixing textbytes value for update */
				if($('#faContent').val() != '' || $('#faContent').val() != null ) {
					faCutText($('#faContent'))
				}
				
				/* check the number of characters in the textarea Start */
				$('#faContent').keyup(function() {
					faCutText(this);
					console.log(this);
				});
				
				//check the number of characters in the korean
				function faGetTextLength(faText) {
					var faLen = 0;
					
					for (var i = 0; i < faText.length; i++) {
						if(escape(faText.charAt(i)).length == 6) {
							faLen++;
						}
						faLen++
					}
					return faLen;
				};
				
				//500 characters setting
				function faCutText(faTextValue) {
					var faTextVal = $(faTextValue).val();
					var faTextLen = faTextVal.length;
					
					while(faGetTextLength(faTextVal) > 1000) {
						faTextLen--;
						faTextVal = faTextVal.substring(0, faTextLen);
					}
					$(faTextValue).val(faTextVal);
					$('.textBytes').text(faGetTextLength(faTextVal));
				};
				/* check the number of characters in the textarea End */
				
				/* setting to fix the selected value */
				if($('#faTypeHidden').val() != "") {
					$('#faType option[value = ' + $('#faTypeHidden').val() + ' ] ').attr('selected', 'selected');
				};
				
				/* validation action on inputBox click Start */
				$('#faTitle').blur(function(){
					if($('#faTitle').val() == '') {
						$('#faWriteFaTitleCheck').text('문의 제목을 입력해주세요.');
						$('#faWriteFaTitleCheck').css('color', 'red');
						return false;
						 document.getElementById("faTitle").focus();   
					} else if($('#faTitle').val().length > 30) {
						$('#faWriteFaTitleCheck').text('문의 제목을 30자 이내로 입력해주세요.');
						$('#faWriteFaTitleCheck').css('color', 'red');
						return false;
						 document.getElementById("faTitle").focus();  
					} else if(!$('#faTitle').val() =='' || $('#faTitle').val().length < 30) {
						$('#faWriteFaTitleCheck').text("");
						return true;	
					}
				});
				/* validation action on inputBox click End */
				
				/* validation action on textareaBox click Start */
				$('#faContent').blur(function(){
					if($('#faContent').val() == '') {
						$('#faWriteFaContentCheck').text('문의 내용을 입력해주세요.');
						$('#faWriteFaContentCheck').css('color', 'red');
						return false;
					} else {
						$('#faWriteFaContentCheck').text('');
						return true;
					}
				});
				/* validation action on textareaBox click End */
				
				/*Push Button group Start*/
				$('#faInsertButton').click(function() {
					if(!faValidation()) return; 
						if($('#faNo').val() == '') {
					  	} if(confirm(' 게시물 등록을 계속 진행하시겠습니까? ')) {
						 	 $('#faWriteForm').attr('action', '/faq/faBoardInsert.fq'); 
						  	 $('#faWriteForm').submit();
					      } else {
					    return false;
					    }
				});
				
				$('#faUpdateButton').click(function() { 
					if(!faValidation()) return; 
						if(confirm(' 게시물 수정을 계속 진행하시겠습니까? ')) {
							$('#faWriteForm').attr('action', '/faq/faBoardUpdate.fq'); 
							$('#faWriteForm').submit();
						} else {
						return false;
					}
				});
				
				$('#faDeleteButton').click(function() { 
					if(confirm(' 게시물 삭제를 계속 진행하시겠습니까? ')) {
						$('#faWriteForm').attr('action', '/faq/faBoardDelete.fq'); 
						$('#faWriteForm').submit();
					} else {
						return false;
					}
				});
				
				$('#faBackListButton').click(function() {
					if(confirm(' FAQ 게시물 목록으로 되돌아가시겠습니까? ')) {
						$('#faWriteForm').attr('action', '/faq/faBoardList.fq'); 
						$('#faWriteForm').submit();
					} else {
						return false;
					}
				});
				/*Push Button group End*/
				
				/* validation action on insertButton click Start */
				function faValidation() {
					var faChk = true;
					
					if($('#faTitle').val() == '') {
						$('#faWriteFaTitleCheck').text('문의 제목을 입력해주세요.');
						$('#faWriteFaTitleCheck').css('color', 'red');
						faChk = false;
						document.getElementById('faTitle').focus();   
						return  faChk;
					} 
					
					if($('#faTitle').val().length > 30) {
						$('#faWriteFaTitleCheck').text('문의 제목을 30자 이내로 입력해주세요.');
						$('#faWriteFaTitleCheck').css('color', 'red');
						faChk = false;
						document.getElementById('faTitle').focus();   
						return  faChk;
					}
					
					if(!$('#faTitle').val() =='' || $('#faTitle').val().length < 30) {
						$('#faWriteFaTitleCheck').text("");
						faChk = true;
					}
					if($('#faContent').val() == '') {
						$('#faWriteFaContentCheck').text('문의 내용을 입력해주세요.');
						$('#faWriteFaContentCheck').css('color', 'red');
						faChk = false;
						document.getElementById('faContent').focus();   
						return  faChk;
					}
					if(!$('#faContent').val() == ''){
						faChk = true;
					}
					return  faChk;
				}
			});
			/* validation action on insertButton click End */
		</script>
	</head>
	
	<body>
	<% System.out.println("faBoardWritet.jsp SUCCESS >>> : "); %>
	<%-- <p>${FaVo}</p> --%>
	
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
   				<h1 id="row"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FAQ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
	 				<small>FAQ를 이용해 보다 빠르게 문의사항을 해결하실 수 있습니다.</small>
				</h1>
			</div>
		 	
		 	<br>
			
			<div role="tabpanel">
            	<div class="col-sm-2">
                	<ul class="nav nav-pills brand-pills nav-stacked" role="tablist">
                		<li role="presentation" class="brand-nav">
                    		<a href="/notice/ntBoardList.nt" >공지사항</a>
                    	</li>
                    	
                    	<li role="presentation" class="brand-nav">
                    		<a href="/qna/qaBoardList.qa" >1:1문의하기</a>
                    	</li>
                    	
                    	<li role="presentation" class="brand-nav  active">
                    		<a href="/faq/faBoardList.fq">FAQ</a>
                    	</li>
                	</ul>
            	</div>
	
				<div class="col-sm-9">
					<%--Start WriteForm--%>
					<form id='faWriteForm' method='post'>
					<input type='hidden' id='sessionIdHidden' value='${sessionScope.mid}'/>
						<table class='faTbleOne'>
							<tr>
								<th class='faTblOneTh'>
									<span class='faRequired'>&nbsp; *</span> &nbsp;&nbsp; NO
								</th>
										
								<td class='faTblOneTd'>
									<input type='text' class='form-control' id='faNo'  name='fano' value='${FaVo.fano}' readonly='readonly' />
								</td>
							</tr>
							
							<tr>
								<th class='faTblOneTh'>
									<span class='faRequired'>&nbsp; *</span>  &nbsp;&nbsp; 작성자
								</th>
								
								<td class='faTblOneTd'>
									<input type='text' class='form-control' id='faId' name='faid' value='${sessionScope.mid}' readonly='readonly' />
								</td>
							</tr>
							
							<tr>
								<th class='faTblOneTh'>
									<span class='faRequired'>&nbsp; *</span>  &nbsp;&nbsp; 문의 유형 분류
								</th>
									
								<td class='faTblOneTd'>
									<input type='hidden' id='faTypeHidden' value='${FaVo.fatype}'/>
										<select class='form-control' id='faType' name='fatype'>
							  				<option value='전체문의'selected>전체 문의</option>
							  				<option value='여행지문의'>여행지 문의</option>
							  				<option value='코스문의'>코스 문의</option>
							  				<option value='축제문의'>축제 문의</option>
							  				<option value='맛집문의'>맛집 문의</option>
							  				<option value='공지사항문의'>공지사항 문의</option>
										</select>
								</td>
							</tr>	
							
							<tr>
								<th class='faTblOneTh'>
									<span class='faRequired'>&nbsp; *</span>  &nbsp;&nbsp; 문의 제목
								</th>
								
								<td class='faTblOneTd'>
									<input type='text' class='form-control' id='faTitle' name='fatitle' value='${FaVo.fatitle}' />
									<div class='faWriteCheckFont' id='faWriteFaTitleCheck' ></div>
								</td>
							</tr>
							
							<tr>
								<th class='faTblOneTh'>
									<span class='faRequired'>&nbsp; * </span>  &nbsp;&nbsp; 문의 내용
								</th>
									
								<td class='faTblOneTd'>
									<span class='textBytesSpan'>
										<span class='textBytes'>0</span> bytes
									</span>
									<textarea class='form-control' id='faContent' name='facontent' rows='15'>${fn:replace(FaVo.facontent, br, cn)}</textarea>
									<div class='faWriteCheckFont' id='faWriteFaContentCheck'></div>
								</td>
							</tr>
						
							<tr>
								<th class='faTblOneTh'>
									<span class='faRequired'>&nbsp;&nbsp;</span>  &nbsp;&nbsp; 참고 사이트 주소
								</th>
								
								<td class='faTblOneTd'>
									<input type='text' class='form-control' id='faAddSite' name=faaddsite value='${FaVo.faaddsite}' />
								</td>
							</tr>
						</table>
					</form>
					<%-- End WriteForm --%>
			
					<!-- Push Button -->
					<span class='faSpan'><input type='button' class='form-control' id='faBackListButton' value='목록' /></span>
					<span class='faSpan'><input type='button' class='form-control' id='faDeleteButton' value='삭제' /></span>
					<span class='faSpan'><input type='button' class='form-control' id='faUpdateButton' value='수정' /></span>
					<span class='faSpan'><input type='button' class='form-control' id='faInsertButton' value='등록' /></span>
				</div>
			</div>
		</div>
		
		<br>
		<br>
	</body>
</html>