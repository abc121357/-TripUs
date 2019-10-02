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
		
		<title> Q&A Write Page </title>
		
		<!--tripUs header bootstrap and css START-->
			<!--Main Stylesheet-->
       		<link rel="stylesheet" type="text/css" href="/css/style.css" > 
			
			<!--Animated CSS-->
       		<link rel="stylesheet" type="text/css" href="/css/animate.min.css"> 

        	<!-- Bootstrap -->
       	 	<link href="/css/bootstrap.min.css" rel="stylesheet">
        
        	<!--Bootstrap Carousel-->
        	<link type="text/css" rel="stylesheet" href="/css/carousel.css" /> 

        	<link rel="stylesheet" href="/css/isotope/style.css"> 

        	<!--Responsive Framework-->
        	<link href="/css/responsive.css" rel="stylesheet"> 
		<!--tripUs header bootstrap and css END-->
		
		<!--side navigation bootstrap and css START-->
			<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
			<script src="/js/jquery-1.12.3.min.js"></script> 
         
        	<!-- Include all compiled plugins (below), or include individual files as needed -->
			<script src="/js/bootstrap.min.js"></script>
		
       	 	<!-- notice Bootstrap -->
			<script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
        	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
			<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
		<!--side navigation bootstrap and css END-->
		
		<!--basic form bootstrap and css START-->
		<!-- include libraries(jQuery, bootstrap) -->
		<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css">
		<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
		<!--basic form bootstrap and css END-->
		
		<!-- qaBoardList style group -->
		<style type="text/css">
			@media (min-width: 1200px){
				.container {
			   		width: 1170px;
			    	 margin-bottom: -20px; 
				}
			}
	
			.qaButton {
				float : right;
				margin-right : 7px;
			}
	
			.qaTbleOne {
				border-collapse : separate;
		 		border-spacing : 3px 2px;
		 	    border-top : 1px solid #ddd;
		 	    border-right: 1px solid #ddd;
		 	    border-left : 1px solid #ddd;
			}
			
			.qaTbleReply {
			    border-collapse : separate;
		 		border-spacing : 3px 2px;
		 	    border-bottom : 1px solid #ddd;
		 	    border-right: 1px solid #ddd;
		 	    border-left : 1px solid #ddd;
			
			}
			
			.qaTbleOne .Ttd{
				width: 1%;
				text-align : left;
				font-weight : bold;
		 		border : 1px solid #ddd; 
				font-size : 16px;
				color : #747070;
				background: #e9f2fa;
			}
			
			.Ttdfile{
				width: 2%;
				text-align : center;
				font-weight : bold;
		 		border : 1px solid #ddd; 
				font-size : 16px;
				color : #747070;
			}
			
			.TdReply {
				font-weight : bold;
				font-size : 16px;
				color : #747070;
				width: 23%;
    			text-align : left;
    			border : 1px solid #ddd;
   				background: #e9f2fa; 
			} 
			
			.faRequired {
				color : #088deb;
			}
			
			.secret {
				padding-right : 8%;
				text-align : right;
				font-weight : bold;
				color : #747070;
			}
			
			.qaImg {
				vertical-align: middle;
			    width: 200px;
			    height: 150px;
			}
			
			#qaNo, #qaId, #qaType, #qaAnswerType{
				width : 30%;
			}
			
			.textBytesSpan, .textBytesSpan2  {
				float : right;
				margin-right: 5px;
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
				var qaMode='${qaMode}';
				var qaReplyMode='${qaReplyMode}';
				console.log('qaBoardinsert.jsp qaMode value confirm >>> : ' + qaMode);
				console.log('qaBoardinsert.jsp qaReplyMode value confirm >>> : ' + qaReplyMode);
		
				if(qaMode == 'qaInsert') {
					document.getElementById('qaReInsertButton').style.display='none';
					document.getElementById('qaReUpdateButton').style.display='none';
					document.getElementById('qaInsertButton').style.display='block';
					document.getElementById('qaUpdateButton').style.display='none';
					document.getElementById('qaResetButton').style.display='block';
					$('#qaAnswerType').attr('disabled',true);
					$('#qaTitle').focus();
				} else if(qaMode == 'qaUpdate') {
					document.getElementById('qaReInsertButton').style.display='none';
					document.getElementById('qaReUpdateButton').style.display='none';
					document.getElementById('qaInsertButton').style.display='none';
					document.getElementById('qaUpdateButton').style.display='block';
					document.getElementById('qaResetButton').style.display='block';
					$('#qaAnswerType').attr('disabled',true);
					$('#qaTitle').focus();
				} else if(qaReplyMode == 'qaReplyInsert') {
					document.getElementById('qaReInsertButton').style.display='block';
					document.getElementById('qaReUpdateButton').style.display='none';
					document.getElementById('qaInsertButton').style.display='none';
					document.getElementById('qaUpdateButton').style.display='none';
					document.getElementById('qaResetButton').style.display='block';
					$('#qaAnswerType').attr('disabled',false);
					$('#qareplycontent').focus();
				} else if(qaReplyMode == 'qaReplyUpdate') {
					document.getElementById('qaReInsertButton').style.display='none';
					document.getElementById('qaReUpdateButton').style.display='block';
					document.getElementById('qaInsertButton').style.display='none';
					document.getElementById('qaUpdateButton').style.display='none';
					document.getElementById('qaResetButton').style.display='block';
					$('#qaAnswerType').attr('disabled',false);
					$('#qareplycontent').focus();
				}
				/* Button mode that changes in Situation End*/
		
				/* Searching <select> option value fix*/
				if($('#qaTypeSelectHidden').val() != '') {
					$('#qaType option[value = '+ $("#qaTypeSelectHidden").val() + ']').attr('selected',true);
				}
		
				/* fixing qaAnswerType value for update */
				if($('#qaAnswertypeSelectHidden').val() != '') {
					$('#qaAnswerType option[value = '+ $('#qaAnswertypeSelectHidden').val() + ']').attr('selected',true);
				}
				
				/* fixing textbytes value for update */
				if($('#qaContent').val() != '' || $('#qaContent').val() != null ) {
					qaCutText($('#qaContent'))
				}
				
				/* fixing qareplycontent value for update */
				if($('#qareplycontent').val() != '' || $('#qareplycontent').val() != null ) {
					qaReCutText($('#qareplycontent'))
				}
				
				/* Secret box check value fix*/
				if($('#qasecretyn').val() == 'Y') {
					$('#qasecretynOne').attr('checked', true);
				} else if($('#qasecretyn').val() == 'N') {
					$('#qasecretynOne').attr('checked', false);
				}
				
				/* check the number of characters in the textarea Start */
				$('#qaContent').keyup(function() {
					qaCutText(this);
					console.log(this);
				});
				
				//check the number of characters in the korean
				function qaGetTextLength(qaText) {
					var qaLen = 0;
					
					for (var i = 0; i < qaText.length; i++) {
						if(escape(qaText.charAt(i)).length == 6) {
							qaLen++;
						}
						qaLen++
					}
					return qaLen;
				};
				
				//500 characters setting
				function qaCutText(qaTextValue) {
					var qaTextVal = $(qaTextValue).val();
					var qaTextLen = qaTextVal.length;
					
					while(qaGetTextLength(qaTextVal) > 1000) {
						qaTextLen--;
						qaTextVal = qaTextVal.substring(0, qaTextLen);
					}
					$(qaTextValue).val(qaTextVal);
					$('.textBytes').text(qaGetTextLength(qaTextVal));
				};
				/* check the number of characters in the textarea End */
				
				/* check the number of characters in the ReplyTextarea Start */
				$('#qareplycontent').keyup(function() {
					qaReCutText(this);
					console.log(this);
				});
				
				//check the number of characters in the korean
				function qaReGetTextLength(qaReText) {
					var qaReLen = 0;
					
					for (var i = 0; i < qaReText.length; i++) {
						if(escape(qaReText.charAt(i)).length == 6) {
							qaReLen++;
						}
						qaReLen++
					}
					return qaReLen;
				};
				
				//500 characters setting
				function qaReCutText(qaReTextValue) {
					var qaReTextVal = $(qaReTextValue).val();
					var qaReTextLen = qaReTextVal.length;
					
					while(qaReGetTextLength(qaReTextVal) > 1000) {
						qaReTextLen--;
						qaReTextVal = qaReTextVal.substring(0, qaReTextLen);
					}
					$(qaReTextValue).val(qaReTextVal);
					$('.textBytesTwo').text(qaReGetTextLength(qaReTextVal));
				};
				/* check the number of characters in the ReplyTextarea End */
				
				/* validation action on inputBox click Start */
				$('#qaTitle').blur(function(){
					if($('#qaTitle').val() == '') {
						$('#qaWriteQaTitleCheck').text('1:1문의 제목을 입력해주세요.');
						$('#qaWriteQaTitleCheck').css('color', 'red');
						return false; 
					} else if($('#qaTitle').val().length > 30) {
						$('#qaWriteQaTitleCheck').text('1:1문의 제목을 30자 이내로 입력해주세요.');
						$('#qaWriteQaTitleCheck').css('color', 'red');
						return false;
					} else if(!$('#qaTitle').val() =='' || $('#qaTitle').val().length < 30) {
						$('#qaWriteQaTitleCheck').text("");
						return true;	
					}
				});
				/* validation action on inputBox click End */
				
				/* validation action on textareaBox click Start */
				$('#qaContent').blur(function(){
					if($('#qaContent').val() == '') {
						$('#qaWriteQaContentCheck').text('1:1문의 내용을 입력해주세요.');
						$('#qaWriteQaContentCheck').css('color', 'red');
						return false;
					} else {
						$('#qaWriteQaContentCheck').text('');
						return true;
					}
				});
				/* validation action on textareaBox click End */
			});
	
			/*Push Button group Start*/
			function qaInsertButton() {
				if(!qaValidation()) return;
					if(confirm(' 게시물 등록을 계속 진행하시겠습니까? ')) {
						//Secretbox check
						if($('#qasecretynOne').is(':checked') == true) {
							$('#qasecretyn').val('Y');
						} else {
							$('#qasecretyn').val('N');
						}
						$('#qaAnswerType').attr('disabled', false);
						$('#qaInsertForm').attr('action', '/qna/qaBoardInsert.qa');
						$('#qaInsertForm').submit();
					} else {
						return false;
				}
			};
			
			function qaReInsertButton(qaReInsert) {
				if(confirm(' 게시물에 대한 답변 등록을 계속 진행하시겠습니까? ')) {
					//Secretbox check
					if($('#qasecretynOne').is(':checked') == true) {
						$('#qasecretyn').val('Y');
					} else {
						$('#qasecretyn').val('N');
					}
					$('#qaReplyMode').val(qaReInsert);
					$('#qaInsertForm').attr('action', '/qna/qaBoardInsert.qa');
					$('#qaInsertForm').submit();
				} else {
					return false;
				}
			};
			
			function qaReUpdateButton(qaReUpdate) {
				if(confirm(' 게시물에 대한 답변 수정을 계속 진행하시겠습니까? ')) {
					//Secretbox check
					if($('#qasecretynOne').is(':checked') == true) {
						$('#qasecretyn').val('Y');
					} else {
						$('#qasecretyn').val('N');
					}
					$('#qaReplyMode').val(qaReUpdate);
					$('#qaInsertForm').attr('action', '/qna/qaBoardUpdate.qa');
					$('#qaInsertForm').submit();
				} else {
					return false;
				}
			};
	
			function qaUpdateButton(){
				if(!qaValidation()) return;
					//Secretbox check
					if(confirm(' 게시물 수정을 계속 진행하시겠습니까? ')) {
						if($('#qasecretynOne').is(':checked') == true) {
							$('#qasecretyn').val('Y');
						} else {
							$('#qasecretyn').val('N');
						}
					$('#qaAnswerType').attr('disabled', false);
					$('#qaInsertForm').attr('action', '/qna/qaBoardUpdate.qa');
					$('#qaInsertForm').submit();
				} else {
					return false;
				}
			};
	
			function qaResetButton() {
				if(confirm(' 해당 게시물 작업을 취소하시겠습니까? ')) {
					$('#qaInsertForm').attr('action', '/qna/qaBoardList.qa'); 
					$('#qaInsertForm').submit();
				} else {
					return false;
				}
			}
			/*Push Button group End*/
			
			/* validation action on insertButton click Start*/
			function qaValidation() {
				var qaChk = true;
				
				if($('#qaTitle').val() == '') {
					$('#qaWriteQaTitleCheck').text('1:1문의 제목을 입력해주세요.');
					$('#qaWriteQaTitleCheck').css('color', 'red');
					qaChk = false;
					document.getElementById('qaTitle').focus();   
					return  qaChk;
				} 
				
				if($('#qaTitle').val().length > 30) {
					$('#qaWriteQaTitleCheck').text('1:1문의 제목을 30자 이내로 입력해주세요.');
					$('#qaWriteQaTitleCheck').css('color', 'red');
					qaChk = false;
					document.getElementById('qaTitle').focus();   
					return  qaChk;
				}
				
				if(!$('#qaTitle').val() =='' || $('#qaTitle').val().length < 30) {
					$('#qaWriteQaTitleCheck').text("");
					qaChk = true;
				}
				
				if($('#qaContent').val() == '') {
					$('#qaWriteQaContentCheck').text('1:1문의 내용을 입력해주세요.');
					$('#qaWriteQaContentCheck').css('color', 'red');
					qaChk = false;
					document.getElementById('qaContent').focus();   
					return  qaChk;
				}
				
				if(!$('#qaContent').val() == ''){
					qaChk = true;
				}
				return  qaChk;
			}
			/* validation action on insertButton click End*/
		
		
		</script>
		
		
	</head>
	
	<body>
	<% System.out.println("qaBoardInsert.jsp SUCCESS >>> : "); %>
	<%-- <p>${QaBoardUpdate}</p> --%>
	
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
                   			<!-- /.navbar-collapse -->
                		</nav> <!--End of nav-->
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
	 			<h1 id="row"> &nbsp;&nbsp;&nbsp; 1:1문의 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <small>관리자에게 1:1문의를 하는 공간입니다.</small></h1>
			</div>
			
			<br>
			
			<div role="tabpanel">
            	<div class="col-sm-2">
                	<ul class="nav nav-pills brand-pills nav-stacked" role="tablist">
                    	<li role="presentation" class="brand-nav">
                    		<a href="/notice/ntBoardList.nt" >공지사항</a>
                    	</li>
                    	
                    	<li role="presentation" class="brand-nav active">
                    		<a href="/qna/qaBoardList.qa" >1:1문의하기</a>
                    	</li>
                    	
                    	<li role="presentation" class="brand-nav">
                    		<a href="/faq/faBoardList.fq">FAQ</a>
                    	</li>
                	</ul>
            	</div>
	
				<div class="col-sm-9">
					<%-- Start WriteForm --%>
					<form id='qaInsertForm' method='post' enctype='multipart/form-data'>
						<input type='hidden' id='sessionIdHidden' value='${sessionScope.mid}'/>
						<input type='hidden' id='qaReplyMode' name='qaReplyMode' value='' />
						<table class='qaTbleOne'>
							<tr> 
								<td class='Ttd'><span class='faRequired'>&nbsp; * &nbsp;</span> 문의  번호</td>
									
								<td colspan='2'>
									<input type='text' class='form-control' id='qaNo' name='qano' value='${QaBoardUpdate.qano}' readonly='readonly' />
								</td>
							</tr>
					
							<tr>
								<td class='Ttd'><span class='faRequired'>&nbsp; * &nbsp;</span>작 &nbsp;성 &nbsp;자</td>
								
								<td colspan='2'> 
									<input type='text' class='form-control' id='qaId' name='qaid' value='${sessionScope.mid}' readonly='readonly' /> 
								</td>
							</tr>
					
							<tr>
								<td class='Ttd'><span class='faRequired'>&nbsp; * &nbsp;</span>문의  유형</td>
						
								<td colspan='2'> 
									<input type='hidden' id='qaTypeSelectHidden' value='${QaBoardUpdate.qatype}' />
										<select  class='form-control' id='qaType' name='qatype'>
							               <option value='전체문의' selected>전체문의</option>
							               <option value='기타문의'>기타문의</option>
							               <option value='여행지게시글문의'>여행지게시글문의</option>
							               <option value='코스게시글문의'>코스게시글문의</option>
							               <option value='맛집게시글문의'>맛집게시글문의</option>
							               <option value='축제게시글문의'>축제게시글문의</option>
							               <option value='공지사항게시글문의'>공지사항게시글문의</option>
							               <option value='코스게시글문의'>코스게시글문의</option>
				            			</select>
								</td>
							</tr>
				
							<tr>
								<td class='Ttd'><span class='faRequired'>&nbsp; * &nbsp;</span>답변  상태</td>
						
								<td colspan='2'> 
									<input type='hidden' id='qaAnswertypeSelectHidden' value='${QaBoardUpdate.qaanswertype}'/>
										<select  class='form-control' id='qaAnswerType' name='qaanswertype'>
				               				<option value='답변대기' selected>답변대기</option>
				               				<option value='답변완료'>답변완료</option>
	            						</select>
								</td>
							</tr>
					
							<tr>
								<td class='Ttd'><span class='faRequired'>&nbsp; * &nbsp;</span>문의  제목</td>
						
								<td>
									<input type='text' class='form-control' id='qaTitle' name='qatitle' value='${QaBoardUpdate.qatitle}' />
									<div class='qaWriteCheckFont' id='qaWriteQaTitleCheck' ></div>
								</td>
						
								<td class='secret'>
									<input type='hidden' id='qasecretyn' name='qasecretyn' value='${QaBoardUpdate.qasecretyn}' />
									비밀글 &nbsp;&nbsp;<input type='checkbox' id='qasecretynOne' value='Y' />
								</td>
							</tr>
					
							<tr>
								<td class='Ttd'><span class='faRequired'>&nbsp; * &nbsp;</span>문의  내용</td>
								
								<td colspan='2'> 
									<textarea class='form-control' id='qaContent' name='qacontent' cols='100' rows='5'>${QaBoardUpdate.qacontent}</textarea>
									<span class='textBytesSpan'>
											<span class='textBytes'>0</span> bytes
									</span>
									<div class='qaWriteCheckFont' id='qaWriteQaContentCheck'></div>
								</td>
							</tr>
					
							<tr>
								<td class='Ttd'>&nbsp;&nbsp;&nbsp;&nbsp; 첨부  파일</td>
								
								<td colspan='2' class='Ttdfile'> 
									<!-- Usually name property have used to vo file , but MultipartFile property use different file name for collision avoid -->
									<c:if test='${QaBoardUpdate.qaimage != null }'>
										<img src='/fileupload/${QaBoardUpdate.qaimage}'  alt='tripUs' class="qaImg"/>
										<p>${QaBoardUpdate.qaimage}</p>
									</c:if>
									<input type='file' id='file' name='file' />
									<input type='hidden' id='qaImage' name='qaimage' value='${QaBoardUpdate.qaimage}' />
								</td>
							</tr>
						</table>
	   			
	   					<div>
	   						<c:choose >
	   							<c:when test='${qaMode == "qaInsert" || qaMode == "qaUpdate"}'>
	       							<input type='hidden' id='qareplycontent' name='qareplycontent' />
	       						</c:when>
	       						
	       						<c:otherwise>
	       							<table class='qaTbleReply'>
			       						<tr>
			       							<td class='TdReply'><span class='faRequired'>&nbsp; * &nbsp;</span>답 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;변</td>
			       					
			       							<td colspan='2'>
			       								<textarea class='form-control' id='qareplycontent' name='qareplycontent' cols='100' rows='5'>${QaBoardUpdate.qareplycontent}</textarea>
			       									<span class='textBytesSpan'>
														<span class='textBytesTwo'>0</span> bytes
									    			</span>
			       							</td>
			       						</tr>
	       							</table>
	       						</c:otherwise>
	       					</c:choose>
       						<br>
     					</div>   
	   				</form>
	   				<%-- End WriteForm --%>
	   			
	  			
		  			<!-- Push Button -->
		     		<span class='qaButton'><button class='btn btn-default' id='qaResetButton'  onclick='qaResetButton()'>취소</button></span>
		     		<span class='qaButton'><button class='btn btn-default' id='qaUpdateButton' onclick='qaUpdateButton()'>수정</button></span>
		     		<span class='qaButton'><button class='btn btn-default' id='qaInsertButton' onclick='qaInsertButton()'>등록</button></span>
		     		<span class='qaButton'><button class='btn btn-default' id='qaReUpdateButton' onclick='qaReUpdateButton("qaReUpdate")'>답글수정</button></span>
		    	    <span class='qaButton'><button class='btn btn-default' id='qaReInsertButton' onclick='qaReInsertButton("qaReInsert")'>답글등록</button></span>
	    	    
		    	    <br>
		    	    <br>
	    	   	</div>
   			</div>
   		</div>
 		<br>
   		<br>
   		
	</body>
</html>