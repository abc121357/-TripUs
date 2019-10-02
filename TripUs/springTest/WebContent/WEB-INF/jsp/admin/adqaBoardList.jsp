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
  		
		<title> Admin Q&A page </title>
		
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
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js" type="text/javascript"></script>
		<!--basic form bootstrap and css END-->
		
		<!--ntBoardList style group-->
		<style>
			.containerOne {
					padding-left: 15%;
					padding-top: 5%;
			   		width: 100%;
			    	margin-bottom: -20px;
			}
			
			body { 
	                font-family:Arial, Helvetica, Sans-Serif; 
	                font-size:13px;
	        }
			
			table, th, td {
  				border-top: 1px solid #e4e6e7;
   				border-bottom: 1px solid #e4e6e7;
  				height: 27px;
  				border-collapse : collapse;
  				text-align : center;
			}
			
			#qaBoardList {
				width : 100%;  
			}
			
			#qaBoardList th {
				background : #2f323a none repeat-x scroll center left;
				color:white;
			}
			
			.qaDeleteButton, .qaInsertButtonOne, .qaInsertButtonOneone,
			.qaMySerchButton, .qaAllSerchButton {
   				float : right;
   				color : black;
			}
			
			#qaSearchSelectDiv {
				float : left;
				margin-right : 1%;
			}
			
			#qaSearchCondition {
				width : 80px; 
				height : 30px;
			}
			
			.qaInputGroup {
				height : 30px;
				width : 190px;
				border : 1px solid #ddd;
				background : #ffffff;
				float : left;
			}
			
			.qaInput {
				font-size : 11px;
				width : 120px;
				padding : 5px;
				border : 0px;
				outline : none;
				float : left;
			}
			
			.qaButton {
				width : 50px;
				height : 100%;
				border : 0px;
				float : right;
				background :  #2f323a;
			}
			
			#qaDetailForm {
				color : black; 
				text-decoration : none;
				text-align : left;
			}	
			
			.qaReImg{
				width: 16px;
			}
			
			.qaReColor{
				color: #ddd;
			}
			
			.row {
				margin-top: 4%;
				margin-left : 25%;
				margin-bottom : 2%;
			}
			
			.col-sm-9 {
				margin-left: -6%;
			}
			
			.glyphicon-search:before {
			    content: "\e003";
			    color: white;
			}
		</style>
		
		<script type="text/javascript">
			$(document).ready(function() {
				/* Searching <select> option value fix*/
				if($('#qaSearchSelectHidden').val() != ''){
   					$('#qaSearchCondition option[value = ' + $('#qaSearchSelectHidden').val() + ']').attr('selected',true);
   				}
			});
		
			/*Push Button group Start*/
			function qaSearchForm() {
				if(confirm(' 검색을 진행하시겠습니까? ')) {
					$('#qaSearchCondition').val();
					$('#qaSearchForm').attr('action', '/admin/adqaBoardList.ad');
					$('#qaSearchForm').submit();
				} else {
					return false;
				}
			};
				
			function qaInsertForm(mgrade) {
				if(mgrade=="1" ||mgrade=="2"||mgrade=="3") {
					if(confirm(' 1:1문의 게시물 작성을 진행하시겠습니까? ')) {
						$('#qaNo').val('');
			  			$('#qaListform').attr('action', '/admin/adqaBoardSelect.ad');
						$('#qaListform').submit();
					} else {
						return false;
					}
				} else {
					if(confirm('로그인을 하신 회원만 이용가능합니다. 로그인하시겠습니까? ')) {
						location.href = "/login/loginPage.do";
					} else {
						return false;
					}
				}				
			};
			
			function qaMySerchForm(qaid) {
				if(qaid != '') {
					if(confirm(' 내가 작성한 문의 게시물을 보시겠습니까? ')) {
						$('#qaNo').val('');
						$('#qaId').val(qaid);
			  			$('#qaListform').attr('action', '/admin/adqaBoardList.ad');
						$('#qaListform').submit();
					} else {
						return false;
					}
				} else {
					if(confirm('로그인을 하신 회원만 이용가능합니다. 로그인하시겠습니까? ')) {
						location.href = "/login/loginPage.do";
					} else {
						return false;
					}
				}
			};
			
			function qaAllSerchForm() {
				if(confirm(' 게시물 전체 리스트를 보시겠습니까? ')) {
					location.href = '/admin/adqaBoardList.ad';
				} else {
					return false;
				}
			};
			
			function qaDetailForm(qano) {
				if(confirm(' 게시물 상세페이지로  이동하시겠습니까? ')) { 
					$('#qaNo').val(qano);
		  			$('#qaListform').attr('action','/admin/adqaBoardDetail.ad'); 
					$('#qaListform').submit();
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
	            					<a class="active" href="admin.jsp">
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
        

					<div class="containerOne">
						<div class="row" >
	 						<h1 id="row">관리자에게 1:1문의를 하는 공간입니다.</h1>
						</div>
			
						<br>
			
						<div role="tabpanel">
            				<div class="col-sm-2">
            			</div>
		
						<div class="col-sm-9">
							<%-- Start search --%>
      						<form id='qaSearchForm' method='get'>
								<input type='hidden' id='qaSearchSelectHidden' value='${qasearchcondition}' />
			
        						<div id='qaSearchSelectDiv'>
					            	<select id='qaSearchCondition' name='qasearchcondition' >
					               		<option value='all' selected>전체</option>
					               		<option value='qaType'>문의종류</option>
					               		<option value='qaTitle'>제목</option>
					               		<option value='qaId'>작성자</option>
					            	</select>
				         		</div>
         	   
		           				<div class='qaInputGroup'>
		            				<input class='qaInput' type='text' name='qasearchkeyword' placeholder='검색어를 입력하세요.' value='${qasearchkeyword}' />
		               				
		               				<button class='qaButton' type='button' onclick='qaSearchForm()'>
		                				<i class='glyphicon glyphicon-search'></i>
		                 			</button>
		         				</div>
      						</form>
      						<%-- End search --%>
      
		      				<%--push button --%>
							<span class='qaInsertButtonOne'>
								<button onclick='qaInsertForm("${sessionScope.mgrade}")' class='btn btn-default' >
									<span class='qaInsertButtonOneone'>문의하기</span>
								</button>
								
								<button onclick='qaMySerchForm("${sessionScope.mid}")' class='btn btn-default'>
									<span class='qaMySerchButton'>내문의보기</span>
								</button>
								
								<button onclick='qaAllSerchForm()' class='btn btn-default' >
									<span class='qaAllSerchButton'>전체문의보기</span>
								</button>
							</span>

					      	<br>
					      	<br>
					      	<br>
      
      						<%-- Start List --%>
							<form id='qaListform' name='qaListform' method='post'>
								<input type='hidden' id='qaNo' name='qano' value='${QaBoardVo.qano}' />
								<input type='hidden' id='qaId' name='qaid' value='' />
	
								<table id='qaBoardList' summary='QnA 게시판 리스트'>
						      		<colgroup>
							      		<col width='10%' />
							      		<col width='13%' />
							      		<col width='13%' />
							      		<col width='35%' />
							      		<col width='10%' />
						      		</colgroup>
			      	
						      		<thead>
						        		<tr>
						            		<th>NO</th>
						            		<th>문의종류</th>
						            		<th>답변상태</th>
						            		<th>제목</th>
						            		<th>작성자</th>
						            		<th>등록일</th>
						         		</tr>
						      		</thead>
	      	
	      							<tbody> 
	      						<!-- Data information in list -->
	      						<c:choose> 
	      							<c:when test='${not empty qaBoardList}'>
	      								<c:forEach var='qalist' items='${qaBoardList}'>
	            							<tr>
	            								<c:choose>
		            								<c:when test='${qalist.qastep == 0}'>
		            									<!--Save qano, qaid value of parent post-->
		            									<c:set var='qanoset' value='${qalist.qano}'/>
		            									<c:set var='qaidset' value='${qalist.qaid}'/>
		            									
						               					<td><fmt:formatNumber value='${fn:replace(qalist.qano,"QA","")}' /></td>
						               					<td>${qalist.qatype}</td>
						               					<td>${qalist.qaanswertype}</td>
						               					<td id='qaDetailForm' class='qaDetailForm'>
						               						<c:choose>
						               							<c:when test='${sessionScope.mid==qalist.qaid || sessionScope.mgrade == "1" || qalist.qasecretyn != "Y"}'>
						               								<span onclick='qaDetailForm("${qalist.qano}")'>
						               									 ${qalist.qatitle} 
						               								</span>
						               							</c:when>
						               							
						               							<c:otherwise>
						               								<span>
						               									<img class='qaReImg' src='/img/qaSecret.png' alt='tripUs'> 비밀글
						               								</span>
						               							</c:otherwise>
						               						</c:choose>
						               					</td>	
			               							</c:when>
			               				
			               						<c:otherwise>
						               				<td><fmt:formatNumber value='${fn:replace(qalist.qano,"QA","")}' /></td>
						               				<td>${qalist.qatype}</td>
						               				<td>${qalist.qaanswertype}</td>
													<td id='qaDetailForm' class='qaDetailForm'>	
														<!--set of secret-->
														<c:if test='${qalist.qasecretyn == "Y"}'>
															<c:choose>
																<c:when test='${(qaidset == sessionScope.mid && qanoset == qalist.qaref) || sessionScope.mgrade == "1"}'>
																	<!--You can view the post only if the administrator or 
																		session ID is the same as the creator of the parent post.-->
																	&nbsp;&nbsp;&nbsp;
																	<span class='qeRe' onclick='qaDetailForm("${qalist.qano}")'>
																		<img class='qaReImg' src='/img/qaReListImg.gif' alt='tripUs'/>
																		<span class='qeReColor'> [re] </span> ${qalist.qatitle}
																	</span>
																</c:when>
															
																<c:otherwise>
																	<!--Set up non-login users or You can view the post only if the administrator or 
																		session ID is the same as the creator of the parent post-->
																	<span class='qeRe'>
																		<img class='qaReImg' src='/img/qaReListImg.gif' alt='tripUs'>
																		<span class='qeReColor'> [re] </span>
																		<img class='qaReImg' src='/img/qaSecret.png' alt='tripUs'> 비밀글
																	</span>
																</c:otherwise>
															</c:choose>
														</c:if>
														
														<!--Non-secret setting-->
														<c:if test='${qalist.qasecretyn != "Y"}'>
														&nbsp;&nbsp;&nbsp;
															<span class='qeRe' onclick='qaDetailForm("${qalist.qano}")'>
																<img class='qaReImg' src='/img/qaReListImg.gif' alt='tripUs'/>
																<span class='qeReColor'> [re] </span> ${qalist.qatitle}
															</span>
														</c:if>
						               				</td>
			               						</c:otherwise>
			               					</c:choose>
			               						
					               			<td>${qalist.qaid}</td>
					               			<td>${qalist.qainsertdate}</td>
	            						</tr>
	         						</c:forEach>
	      						</c:when>
	        				
	         					<c:otherwise>
									<tr>
										<td colspan='6' align='center'>등록된 게시물이 존재하지 않습니다.</td>
									</tr>
								</c:otherwise>
								</c:choose>
	      					</tbody>      
						</table>
					</form>
	  			<%-- End List --%>
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