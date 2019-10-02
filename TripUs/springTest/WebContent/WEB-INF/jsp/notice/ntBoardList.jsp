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
		
		<title> Notice Page</title>
		
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
			<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js" type="text/javascript"></script>
		<!--basic form bootstrap and css END-->
		
		<!--ntBoardList style group-->
		<style>
			@media (min-width: 1200px) {
				.container {
			   		width: 1170px;
			    	margin-bottom: -20px;
				}
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
				background : #9ECFFF none repeat-x scroll center left; 
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
				background :  #9ECFFF;
			}
			
			#ntBoardDetailForm {
				color : black; 
				text-decoration : none;
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
				/* Searching <select> option value fix*/
   				if($('#searchSelectHidden').val() != '') {
   					$('#ntSearchCondition option[value='+ $('#ntSearchSelectHidden').val()+']').attr('selected',true);
   				}
			});
			
			/*Push Button group Start*/
			function ntSearchButtonOneForm() {
				if(confirm(' 검색을 진행하시겠습니까? ')) {
		  			$('#ntSearchCondition').val();
		  			$('#ntSearchForm').attr('action', '/notice/ntBoardList.nt');
					$('#ntSearchForm').submit();
				} else {
					return false;
				};
			};
			
			function ntAllList() {
				if(confirm(' 전체리스트 보기를 진행하시겠습니까? ')) {
					$('#ntNo').val('');
		  			$('#ntListform').attr('action', '/notice/ntBoardList.nt');
					$('#ntListform').submit();
				} else {
					return false;
				};
			};
			
			function ntInsertForm() {
				if(confirm(' 게시물 작성을 진행하시겠습니까? ')) {
					$('#ntNo').val('');
		  			$('#ntListform').attr('action', '/notice/ntBoardSelect.nt');
					$('#ntListform').submit();
				} else {
					return false;
				};
			};
			
			function ntBoardDetailForm(ntno) {
				if(confirm(' 게시물 상세페이지로  이동하시겠습니까? ')) { 
					$('#ntNo').val(ntno);
		  			$('#ntListform').attr('action', '/notice/ntBoardDetail.nt');
					$('#ntListform').submit();
				} else {
					return false;
				};
			};
			/*Push Button group End*/
		</script>
	</head>
	
	<body>
	<% System.out.println("ntBoardList.jsp SUCCESS >>> : "); %>
	
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
	</body>
</html>