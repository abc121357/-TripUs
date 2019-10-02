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
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
  		<meta name="description" content="">
  		<meta name="author" content="Dashboard">
  		<meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
  		
		<title> Admin Notice Write page </title>
		
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
	
 		<!-- include summernote css/js START-->
		<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
		<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>   
		<!-- include summernote css/js END-->
		
		<!-- ntBoardList style group -->
		<style type="text/css">
			.containerOne {
					padding-left: 15%;
					padding-top: 5%;
			   		width: 100%;
			    	margin-bottom: -20px;
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
			
			.row {
				margin-top: 4%;
				margin-left : 23%;
				margin-bottom : 2%;
			}
			
			.col-sm-9 {
				margin-left: -6%;
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
     					 $('#ntSummerInsertForm').attr('action', '/admin/adntBoardInsert.ad');
  				 		 $('#ntSummerInsertForm').submit();
  				 	} else {
  						return false;
  				 	}
  			};	 
  			
  			function ntSummerUpdateButton() {
  				if(!ntValidation()) return; 
  					if(confirm(' 게시물 수정을 계속 진행하시겠습니까? ')) {
		 				$('#ntSummerInsertForm').attr('action', '/admin/adntBoardUpdate.ad');
	     				$('#ntSummerInsertForm').submit();
  					} else {
  						return false;
  					}
	  		};
  			
  			function ntSummerResetButton() {
  					if(confirm(' 해당 게시물 작업을 취소하시겠습니까? ')) {
		  				$('#ntSummerInsertForm').attr('action', '/admin/adntBoardList.ad'); 
						$('#ntSummerInsertForm').submit();
  					} else {
  						return false;
  					}
 			};
 			
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
				 			<h1 id="row">tripUs 홈페이지에 공지사항을 알려드립니다.</h1>
						</div>
		 	
		 				<br>
			
					<div role="tabpanel">
            			<div class="col-sm-2">
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