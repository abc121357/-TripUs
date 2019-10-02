<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
					  "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
  		<meta name="description" content="">
  		<meta name="author" content="Dashboard">
  		<meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
  		
		<title> Admin Q&A Write page </title>
		
		<!--Favicons-->
  		<link href="/admin/img/tripFavicons.png" rel="icon">

  		<!--Bootstrap core CSS-->
  		<link href="/admin/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
 
 		<!--external css-->
 		<!--for font-->
  		<link href="/admin/lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
  		<!--for calendar-->
  		<link rel="stylesheet" type="text/css" href="/admin/css/zabuto_calendar.css">
  
  		<!--Custom styles for this template-->
  		<link href="/admin/css/style.css" rel="stylesheet">
  		<link href="/admin/css/style-responsive.css" rel="stylesheet">
  		<script src="/admin/lib/chart-master/Chart.js"></script>
  		 
  		<!--basic form bootstrap and css START-->
		<!-- include libraries(jQuery, bootstrap) -->
		<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css">
		<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
		<!--basic form bootstrap and css END-->
		
		<!-- qaBoardList style group -->
		<style type="text/css">
			.containerOne {
					padding-left: 15%;
					padding-top: 5%;
			   		width: 100%;
			    	margin-bottom: -20px;
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
				color : white;
				background: #2f323a;
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
			
			.row {
				margin-top: 4%;
				margin-left : 25%;
				margin-bottom : 2%;
			}
			
			.col-sm-9 {
				margin-left: -6%;
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
						$('#qaInsertForm').attr('action', '/admin/adqaBoardInsert.ad');
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
					$('#qaInsertForm').attr('action', '/admin/adqaBoardInsert.ad');
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
					$('#qaInsertForm').attr('action', '/admin/qaBoardUpdate.ad');
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
					$('#qaInsertForm').attr('action', '/admin/adqaBoardUpdate.ad');
					$('#qaInsertForm').submit();
				} else {
					return false;
				}
			};
	
			function qaResetButton() {
				if(confirm(' 해당 게시물 작업을 취소하시겠습니까? ')) {
					$('#qaInsertForm').attr('action', '/admin/adqaBoardList.ad'); 
					$('#qaInsertForm').submit();
				} else {
					return false;
				}
			}
				
	  		 function adListMemberButton1() {
	  			$('#adListMemberForm1').attr('action', '/admin/adlistMember.ad');
	 			$('#adListMemberForm1').submit();
	   		 }
				
	   		 function adListMemberButton2() {
	  			$('#adListMemberForm2').attr('action', '/admin/adlistMember.ad');
	 			$('#adListMemberForm2').submit();
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
		<section id="container">
  		<!--TOP BAR CONTENT & NOTIFICATIONS-->
    
    	<!--header start-->
    	<header class="header black-bg">
      		<div class="sidebar-toggle-box">
       			<div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
      		</div>
      		
      		<!--logo start-->
      		<a href="/admin.jsp" class="logo"><b>trip<span>Us</span></b></a>
      		<!--logo end-->
      
      		<div class="nav notify-row" id="top_menu">
        		<!--  notification start -->
       			<ul class="nav top-menu">
        			<!--inbox dropdown start-->
        			<li id="header_inbox_bar" class="dropdown">
	            		<a data-toggle="dropdown" class="dropdown-toggle" href="/admin.jsp#">
	              			<i class="fa fa-envelope-o"></i>
	              			<span class="badge bg-theme">3</span>
	              		</a>
            
            			<ul class="dropdown-menu extended inbox">
              			<div class="notify-arrow notify-arrow-green"></div>
		              		<li>
		                		<p class="green">새로운 메세지 3개가 있습니다.</p>
		              		</li>
              
		              		<li>
		                		<a href="/admin.jsp#">
		                  			<span class="photo"><img alt="avatar" src="/admin/img/jingoo.JPG"></span>
		                  			<span class="subject">
		                  				<span class="from">여진구</span>
		                  				<span class="time">Just now</span>
		                  			</span>
		                  			<span class="message">
		                  				점심 몇시에 먹어?
		                  			</span>
		                  		</a>
		              		</li>
              		
		              		<li>
		                		<a href="/admin.jsp#">
		                  			<span class="photo"><img alt="avatar" src="/admin/img/iu.JPG"></span>
		                  			<span class="subject">
		                  				<span class="from">IU</span>
		                 				<span class="time">40 mins.</span>
		                  			</span>
		                  			<span class="message">
		                 				10시에 공지사항 수정예정!
		                  			</span>
		                 		 </a>
		              		</li>
              
		              		<li>
		               			<a href="/admin.jsp#">
		                  			<span class="photo"><img alt="avatar" src="/admin/img/gong.JPG"></span>
		                  			<span class="subject">
		                  				<span class="from">공유</span>
		                  				<span class="time">2 hrs.</span>
		                  			</span>
		                  			<span class="message">
		                  				오늘안에 업무 보고 바람.
		                  			</span>
		                 		</a>
		              		</li>
		              
		              		<li>
		                		<a href="/admin.jsp#">See all messages</a>
		              		</li>
            			</ul>
          			</li>
          			<!--inbox dropdown end-->
          	
          			<!-- notification dropdown start-->
          			<li id="header_notification_bar" class="dropdown">
            			<a data-toggle="dropdown" class="dropdown-toggle" href="/admin.jsp#">
              				<i class="fa fa-bell-o"></i>
              				<span class="badge bg-warning">2</span>
              			</a>
            
            			<ul class="dropdown-menu extended notification">
              				<div class="notify-arrow notify-arrow-yellow"></div>
              					<li>
                					<p class="green">2개의 알림이 있습니다.</p>
              					</li>
              		
              					<li>
                					<a href="/admin.jsp#">
	                  					<span class="label label-warning"><i class="fa fa-bell"></i></span>
	                  						결제서류 보고 받는날
	                  					<span class="small italic">30 mins.</span>
                  					</a>
              					</li>
              
				              	<li>
				                	<a href="/admin.jsp#">
				                  		<span class="label label-success"><i class="fa fa-plus"></i></span>
				                 			새로운 관리자가 등록완료
				                  		<span class="small italic">3 hrs.</span>
				                  	</a>
				              	</li>
             		
			             		<li>
			                		<a href="/admin.jsp#">See all notifications</a>
			              		</li>
            				</ul>
          				</li>
          				<!--notification dropdown end-->
       				</ul>
       				<!--notification end-->
      			</div>
     
      			<div class="top-menu">
        			<ul class="nav pull-right top-menu">
          				<li><a class="logout" href="/admin/html/login.html">Logout</a></li>
        			</ul>
      			</div>
    		</header>
    		<!--header end-->
    
    		<!--MAIN SIDEBAR MENU-->
    		
    		<!--sidebar start-->
    		<aside>
      			<div id="sidebar" class="nav-collapse ">
        			<!-- sidebar menu start-->
       				<ul class="sidebar-menu" id="nav-accordion">
          				<p class="centered"><a href="/admin/html/profile.html"><img src="/admin/img/jeonjihyun.JPG" class="img-circle" width="80"></a></p>
          					<h5 class="centered">admin</h5>
	          					<li class="mt">
	            					<a class="active" href="/admin.jsp">
		              					<i class="fa fa-dashboard"></i>
		              					<span>Admin page</span>
	              					</a>
	          
	          					</li>
	          					
          						<li class="sub-menu">
            						<a href="javascript:;">
	              						<i class="fa fa-cogs"></i>
	              						<span>공지사항 관리</span>
              						</a>
            						
            						<ul class="sub">
						            	<li><a href="/admin/adntBoardList.ad">공지사항</a></li>
						            	<li><a href="/admin/adqaBoardList.ad">Q&A</a></li>
						              	<li><a href="/admin/adfaBoardList.ad">FAQ</a></li>
						            </ul>
          						</li>
          						
          						<li class="sub-menu">
           							<a href="javascript:;">
              							<i class="fa fa-cogs"></i>
              							<span>회원관리</span>
              						</a>
			            
			            			<ul class="sub">
			             	 			<li><a href="/admin/html/gallery.html">회원 목록</a></li>
			              				<li><a href="/admin/html/calendar.html">탈퇴 회원 목록</a></li>
			            			</ul>
          						</li>

          						<li class="sub-menu">
            						<a href="javascript:;">
              							<i class=" fa fa-bar-chart-o"></i>
              							<span>통계</span>
              						</a>
              						
						            <ul class="sub">
						               	<li><a href="/admin/html/morris.html">tripUs 통계</a></li>
							            <li><a href="/admin/html/morris.html">데이터마이닝</a></li>
						            </ul>
         						</li>
          	
          						<li class="sub-menu">
            						<a href="javascript:;">
              							<i class="fa fa-comments-o"></i>
              							<span>관리자 관리</span>
              						</a>
              						
						            <ul class="sub">
						            	<li><a href="/admin/html/morris.html">관리자 활동내역</a></li>
						            </ul>
         						</li>
          
          						<li>
           							<a href="/google_maps.html">
              							<i class="fa fa-map-marker"></i>
              							<span>Google Maps </span>
              						</a>
          						</li>
        					</ul>
       						<!-- sidebar menu end-->
      					</div>
    				</aside>
    				<!--sidebar end-->
        
					<div class="containerOne">
						<div class="row" >
				 			<h1 id="row">관리자에게 1:1문의를 하는 공간입니다.</h1>
						</div>
			
						<br>
			
						<div role="tabpanel">
			            	<div class="col-sm-2">
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
													<img src='/fileupload/${QaBoardUpdate.qaimage}'  alt='사진없음' class="qaImg"/>
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
					    	    <br>
					    	    <br>
				    	   	</div>
			   			</div>
   					</div>
 	 		</section> 
 	 		
 	 		
		    <!-- js placed at the end of the document so the pages load faster -->
		    <script src="/admin/lib/jquery/jquery.min.js"></script>
		    <script src="/admin/lib/bootstrap/js/bootstrap.min.js"></script>
		    <script class="include" type="text/javascript" src="/admin/lib/jquery.dcjqaccordion.2.7.js"></script>
		    <script src="/admin/lib/jquery.scrollTo.min.js"></script>
		    <script src="/admin/lib/jquery.nicescroll.js" type="text/javascript"></script>
		    <script src="/admin/lib/jquery.sparkline.js"></script>
		  
		    <!--common script for all pages-->
		    <script src="/admin/lib/common-scripts.js"></script>

		  	<!--script for this page-->
		    <script src="/admin/lib/sparkline-chart.js"></script>
		    <script src="/admin/lib/zabuto_calendar.js"></script>
		    <script type="text/javascript"></script>
	</body>
</html>