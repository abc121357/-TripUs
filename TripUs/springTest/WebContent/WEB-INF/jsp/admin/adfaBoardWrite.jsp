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
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
  		<meta name="description" content="">
  		<meta name="author" content="Dashboard">
  		<meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
  		
		<title> Admin FAQ Write page </title>
		
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
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> 
		<!--basic form bootstrap and css END-->
		
		<style type="text/css">
			.containerOne {
					padding-left : 15%;
					padding-top : 5%;
			   		width : 100%;
			    	margin-bottom : -20px;
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
				color : white;
				background: #2f323a;
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
		 
			.row {
				margin-top: 4%;
				margin-left : 10%;
				margin-bottom : 2%;
			}
			
			.col-sm-9 {
				margin-left: -6%;
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
						 	 $('#faWriteForm').attr('action', '/admin/adfaBoardInsert.ad'); 
						  	 $('#faWriteForm').submit();
					      } else {
					    return false;
					    }
				});
				
				$('#faUpdateButton').click(function() { 
					if(!faValidation()) return; 
						if(confirm(' 게시물 수정을 계속 진행하시겠습니까? ')) {
							$('#faWriteForm').attr('action', '/admin/adfaBoardUpdate.ad'); 
							$('#faWriteForm').submit();
						} else {
						return false;
					}
				});
				
				$('#faDeleteButton').click(function() { 
					if(confirm(' 게시물 삭제를 계속 진행하시겠습니까? ')) {
						$('#faWriteForm').attr('action', '/admin/adfaBoardDelete.ad'); 
						$('#faWriteForm').submit();
					} else {
						return false;
					}
				});
				
				$('#faBackListButton').click(function() {
					if(confirm(' FAQ 게시물 목록으로 되돌아가시겠습니까? ')) {
						$('#faWriteForm').attr('action', '/admin/adfaBoardList.ad'); 
						$('#faWriteForm').submit();
					} else {
						return false;
					}
				});
				
				function adListMemberButton1() {
		  			$('#adListMemberForm1').attr('action', '/admin/adlistMember.ad');
		 			$('#adListMemberForm1').submit();
		   		 }
					
		   		function adListMemberButton2() {
		  			$('#adListMemberForm2').attr('action', '/admin/adlistMember.ad');
		 			$('#adListMemberForm2').submit();
		   		 }
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
			            				<form id="adListMemberForm1">
			              					<input type="hidden" name="mdeleteyn" value="Y">
			              				</form>
			              				<form id="adListMemberForm2" >
			              					<input type="hidden" name="mdeleteyn" value="N">
			            				</form>
		             	 				<li onclick="adListMemberButton1()"><a>회원 목록</a></li>
		              					<li onclick="adListMemberButton2()"><a>탈퇴 회원 목록</a></li>
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
        
   					<div class='containerOne'>
			   			<div class="row" >
			   				<h1 id="row">FAQ를 이용해 보다 빠르게 문의사항을 해결하실 수 있습니다.</h1>
						</div>
		 	
		 				<br>
			
						<div role="tabpanel">
			            	<div class="col-sm-2">
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
								<br>
								<br>
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
			<script type="text/javascript" src="/admin/lib/gritter/js/jquery.gritter.js"></script>
			<script type="text/javascript" src="/admin/lib/gritter-conf.js"></script>
			
			<!--script for this page-->
			<script src="/admin/lib/sparkline-chart.js"></script>
			<script src="/admin/lib/zabuto_calendar.js"></script>
			<script type="text/javascript"></script>
	</body>
</html>