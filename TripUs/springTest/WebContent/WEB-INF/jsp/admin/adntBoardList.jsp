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
			
		<title> Admin Notice page </title>
		
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
  		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> 
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js" type="text/javascript"></script>
	
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
			
			#ntBoardList th {
				background : #2f323a none repeat-x scroll center left; 
				color : white;
			}
			
			#ntBoardList {
	             width : 100%;
			}
			
			.ntBoardInsertOne, .ntAllList, 
			.ntBoardInsertWrite {
   				float : right;
   				color : black;
			}
			
			#ntSearchSelectDiv {
				float : left;
				margin-right : 1%;
			}
			
			#ntSearchCondition {
				width : 80px; 
				height : 30px;
			}
			
			.ntInputGroup {
				height : 30px;
				width : 190px;
				border : 1px solid #ddd;
				background : #ffffff;
				float : left;
			}
			
			 .ntInput {
				font-size : 11px;
				width : 120px;
				padding : 5px;
				border : 0px;
				outline : none;
				float : left;
			} 
			
			.input-group {
				 float : left;
				 width : 20%;
			}
			
			 .ntButton {
				width : 50px;
				height : 100%;
				border : 0px;
				float : right;
				background :  #2f323a;
			}
			
			#ntBoardDetailForm {
				color : black; 
				text-decoration : none;
			}
			
			.row {
				margin-top: 4%;
				margin-left : 23%;
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
   				if($('#searchSelectHidden').val() != '') {
   					$('#ntSearchCondition option[value='+ $('#ntSearchSelectHidden').val()+']').attr('selected',true);
   				}
			});
			
			/*Push Button group Start*/
			function ntSearchButtonOneForm() {
				if(confirm(' 검색을 진행하시겠습니까? ')) {
		  			$('#ntSearchCondition').val();
		  			$('#ntSearchForm').attr('action', '/admin/adntBoardList.ad');
					$('#ntSearchForm').submit();
				} else {
					return false;
				};
			};
			
			function ntAllList() {
				if(confirm(' 전체리스트 보기를 진행하시겠습니까? ')) {
					$('#ntNo').val('');
		  			$('#ntListform').attr('action', '/admin/adntBoardList.ad');
					$('#ntListform').submit();
				} else {
					return false;
				};
			};
			
			function ntInsertForm() {
				if(confirm(' 게시물 작성을 진행하시겠습니까? ')) {
					$('#ntNo').val('');
		  			$('#ntListform').attr('action', '/admin/adntBoardSelect.ad');
					$('#ntListform').submit();
				} else {
					return false;
				};
			};
			
			function ntBoardDetailForm(ntno) {
				if(confirm(' 게시물 상세페이지로  이동하시겠습니까? ')) { 
					$('#ntNo').val(ntno);
		  			$('#ntListform').attr('action', '/admin/adntBoardDetail.ad');
					$('#ntListform').submit();
				} else {
					return false;
				};
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
        	
					<div class="containerOne">
						<div class="row" >
	 						<h1 id="row"> tripUs 홈페이지에 공지사항을 알려드립니다.</h1>
						</div>
			
						<br>
			
					<div role="tabpanel">
            			<div class="col-sm-2">
            			</div>
		
					<div class="col-sm-9">
						<%-- Start search --%>
			      		<form id='ntSearchForm' method='get'>
							<input type='hidden' id='ntSearchSelectHidden' value='${ntsearchcondition}' />
			        	
					        <div id='ntSearchSelectDiv'>
						    	<select id='ntSearchCondition' name='ntsearchcondition'>
						        	<option value='all' selected>전체</option>
						            <option value='ntTitle'>제목</option>
						            <option value='ntContent'>내용</option>
						    	</select>
					        </div>
			         	   
					        <div class='ntInputGroup'>
					        	<input class='ntInput' type='text' name='ntsearchkeyword' placeholder='검색어를 입력하세요.' value='${ntsearchkeyword}' />
					            
					            <button class='ntButton' type='button' onclick='ntSearchButtonOneForm()'>
					            	<i class='glyphicon glyphicon-search'></i>
					            </button>
							</div>
						</form>
      					<%-- End search --%>
      
      					<%-- push button --%>
						<span class='ntBoardInsertOne'>
							<button onclick='ntAllList()' class='btn btn-default' >
								<span class='ntAllList'>전체보기</span>
							</button>
				
							<!--only admin use-->
							<c:if test='${sessionScope.mgrade=="1"}'>
								<button onclick='ntInsertForm()' class='btn btn-default' >
									<span class='ntBoardInsertWrite'>글쓰기</span>
								</button>
							</c:if>
						</span>

		      			<br>
		      			<br>
		      			<br>
      
      					<%-- Start List --%>
						<form id='ntListform' name='ntListform' method='post'>
 							<input type='hidden' id='ntNo' name='ntno' value='' /> 
	
	      					<table id='ntBoardList' summary='공지사항 게시판 리스트'>
						      	<colgroup>
						      		<col width='10%' />
						      		<col width='60%' />
						      		<col width='20%' />
						      	</colgroup>
	      	
		      					<thead>
		        					<tr>
						            	<th>NO</th>
						            	<th>제목</th>
						            	<th>등록일</th>
						            	<th>조회수</th>
		         					</tr>
		      					</thead>
	      	
	      						<tbody> 
		      						<!-- Data information in list -->
		      						<c:choose> 
	      								<c:when test='${not empty ntBoardListCont}'>
	        								<c:forEach var='list' items='${ntBoardListCont}'>
	            			
		            							<tr>
						               				<td><fmt:formatNumber value='${fn:replace(list.ntno,"NT","")}' /></td>
						               				<td id='ntBoardDetailForm' onclick='ntBoardDetailForm("${list.ntno}")'>${list.nttitle}</td>
						               				<td>${list.ntinsertdate}</td>
						               				<td>${list.nthit}</td>
		            							</tr>
	         								</c:forEach>
	         							</c:when>
	         		
		         					<c:otherwise>
										<tr>
											<td colspan='4' align='center'>등록된 게시물이 존재하지 않습니다.</td>
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