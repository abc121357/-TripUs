<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<% request.setCharacterEncoding("UTF-8");%>

<!-- textarea br set -->
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
		
		<title> FAQ Page</title>
		
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
		
		<!--faBoardList style group-->
		<style type="text/css">
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
	        
	        #faBoardList { 
	                width : 100%;
	        }
	        
	        #faBoardList ul { 
	        		margin:10px 0 10px 40px; 
	        		padding:0px;
	        }
	        
	        #faBoardList th { 
	                background:#9ECFFF repeat-x scroll center left; 
	                color:black;
	                padding:7px 15px; 
	                text-align:left;
	       }
	       
	        #faBoardList td { 
	        				background:#ecf3f8 none repeat-x scroll center left; 
	        				color: #454343; 
	        				padding:7px 15px;
	        				border-bottom : 1px solid #ddd;
	        }
	        
	        #faBoardList tr.odd td { 
	        						background:#fff repeat-x scroll center left; 
	        						cursor:pointer;
			}
			
	        #faBoardList div.up { 
	        					background-position:0px 0px;
	        }
	        
	        #faBoardButton {
							width: 10%;
							text-align: right;
							margin-bottom: 5%;
			} 
			
			#faSearchButtonOne {
			               		width : 10%;
			               		text-align: left;
			}
			
			.faSearchSelectDiv {
				float : left;
				margin-right : 1%;
			}
			
			.fqInputGroup {
				height : 30px;
				width : 190px;
				border : 1px solid #ddd;
				background : #ffffff;
				float : left;
			}
			
			.faInput {
				font-size : 11px;
				width : 120px;
				padding : 5px;
				border : 0px;
				outline : none;
				float : left;
			}
			
			.fqButton {
				width : 50px;
				height : 100%;
				border : 0px;
				float : right;
				background :  #9ECFFF;
			}
			
			#faSearchCondition{
				height: 30px;
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
				/* setting for jquery Arcordian*/
				$('#faBoardList tr:odd').addClass('odd');
            	$('#faBoardList tr:not(.odd)').hide();
            	$('#faBoardList tr:first-child').show();
            
            	$('#faBoardList tr.odd').click(function() {
                	$(this).next('tr').toggle();
                	$(this).find('.arrow').toggleClass('up');
            	});
        	});
    	
			$(function() {
				/* Searching <select> option value fix*/
				if($('#faSelectHidden').val() != null || $('#faSelectHidden').val() != ''){
					$('#faSearchCondition option[value = '+ $("#faSelectHidden").val() +' ]').attr('selected', 'selected');
				}
				
				/*Push Button group Start*/
	  			$('#faInsertButton').click(function() {
	  				if(confirm(' 게시물 작성을 진행하시겠습니까? ')) {
			  			$('#faNo').val("");
			  			$('#faboardListForm').attr('action', '/faq/faBoardSelect.fq');
						$('#faboardListForm').submit();
	  				} else {
	  					return false;
	  				}
	  		 	});
				
	  			$('#faAllListButton').click(function() {
	  				if(confirm(' 전체리스트 보기를 진행하시겠습니까? ')) {
			  			$('#faNo').val('');
			  			$('#faboardListForm').attr('action', '/faq/faBoardList.fq');
						$('#faboardListForm').submit();
	  				} else {
	  					return false;
	  				}
	  		 	});
			});	

			function faUpdateButton(fano, faUpdate) {
				if(confirm(' 게시물 수정을 진행하시겠습니까? ')) { 
		  			$('#faNo').val(fano);
		  			$('#faMode').val(faUpdate);
		  			$('#faboardListForm').attr('action', '/faq/faBoardSelect.fq');
					$('#faboardListForm').submit();
				} else {
					return false;
				}
			};
			
			function faDeleteButton(fano, faDelete) {
				if(confirm(' 게시물 삭제를 진행하시겠습니까? ')) {
		  			$('#faNo').val(fano);
		  			$('#faMode').val(faDelete);
		  			$('#faboardListForm').attr('action', '/faq/faBoardSelect.fq');
					$('#faboardListForm').submit();
				} else {
					return false;
				}
			}; 
			
			function faSearchButtonOneForm() {
				if(confirm(' 검색을 진행하시겠습니까? ')) {
		  			$('#faSearchCondition').val();
		  			$('#faSearchForm').attr('action', '/faq/faBoardList.fq');
					$('#faSearchForm').submit();
				} else {
					return false;
				}
			};
			
			$(function() {
				$('.pbutton').click(function() {
					$('[name=START_NUM]').val($(this).val());
					$('#faboardListForm').attr('action', '/faq/faBoardList.fq');
					$('#faboardListForm').submit();
				});
			});
			/*Push Button group End*/
		</script>
	</head>
	
	<body>
	<% System.out.println("faBoardList.jsp SUCCESS >>> : "); %>
	
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
					<%-- Start search --%>
					<div id='faButtonDiv'>
						<form id='faSearchForm' method='get'>
							<table>
								<tr>
									<td id='faSearchButtonOne'>
										<div class='faSearchSelectDiv'>
											<input type='hidden' id='faSelectHidden' value='${fasearchcondition}' />
												<select id='faSearchCondition' name='fasearchcondition'>
													<option value='all'>전체</option>
													<option value='faType'>문의종류</option>
													<option value='faTitle'>제목</option>
													<option value='faContent'>내용</option>
												</select>
										</div>
							
										 <div class='fqInputGroup'>	
											<input type='text' class='faInput' id='faSearchKeyword' name='fasearchkeyword' placeholder='검색어를 입력하세요.' value='${fasearchkeyword}' />
							               		<button type='button' class='fqButton' onclick='faSearchButtonOneForm()'>
					                				<i class='glyphicon glyphicon-search'></i>
					                 			</button>
						 				</div>
									</td>
							 
									 <%-- push button --%>
									 <td id='faBoardButton'>
									     <input type='button' class='btn btn-default' id='faAllListButton' value='전체보기' />	
									     
									     <!--only admin use-->
									     <c:if test='${sessionScope.mgrade=="1"}'>
									     	<input type='button' class='btn btn-default' id='faInsertButton' value='글쓰기' />
									     </c:if>
									 </td>
								</tr>
							</table>
						</form>
					</div>
					<%-- End search --%>
		
					<br>
					
					<%-- Start List --%>
					<form id='faboardListForm' method='post'>
						<input type='hidden' id='faNo' name='fano' value='${FaqVo.fano}' />
						<input type='hidden' id='faMode' name='faMode' value='' />
						<input type='hidden' name='START_NUM' value='1'>
						
						<table id='faBoardList' summary='FAQ게시판 리스트'>
							<thead>
								<tr>
									<th>NO</th>
									<th>문의종류</th>
									<th>제목</th>
								</tr> 
							</thead>
				
							<tbody>
							<!-- Data information in list -->
							<c:set var='index' value='${index}' />
								<c:choose>
									<c:when test='${not empty faBoardLists}'>
										<c:forEach items='${faBoardLists}' var='row' >
											<tr>
												<td>
													<fmt:formatNumber value='${fn:replace(row.fano,"FA","")}' />
												</td>
												<td>${row.fatype}</td>
												<td align='left'>
													<span class='faDetail'>Q. ${row.fatitle}</span>
												</td>	
											</tr>
								
											<tr>
												<td colspan='4'>
													<p>${fn:replace(row.facontent, cn, br)}</p>
												<ul>
													<li style="text-align:left"> <a href='http://${row.faaddsite}' target='blank'>${row.faaddsite}</a></li>
												</ul>
										
													<span style='float:right'>
														<!--only admin use-->
														<c:if test='${sessionScope.mgrade=="1"}'>
															<input type='button' class='btn btn-default' class='faUpdateButton' value='수정' onclick='faUpdateButton("${row.fano}", "faUpdate")' />
															<input type='button' class='btn btn-default' class='faDeleteButton' value='삭제' onclick='faDeleteButton("${row.fano}", "faDelete")' />
														</c:if>
													</span>
								    			</td>			
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
		
				<%-- <div style='text-align: center;'>
					<tr>
						<td colspan='4' align='center'>
					    	<c:if test="${sss != 's'}">
					        	<button class='pbutton' value='${sENTRY_SIZE -1}'>이전</button>
					        </c:if>
								 	
							<c:forEach var='faPageNum' items='${faBoardListCountCalculation}' begin='0' step='1' varStatus='status' >
								<input type='button' class='pbutton' value='${status.count}' />
							</c:forEach>
								 	
					        <c:if test="${sss != 'e'}">
					        	<button class='pbutton' value='${eENTRY_SIZE +1}'>다음</button>
					        </c:if>
					      </td>
					</tr>
				</div> --%>
				</div>
			</div>
		</div>
		
		
		
		<%-- <div style="text-align: center;">
		<br/>
		<fmt:formatNumber value="${(faBoardListCount % 10)}" type="number" />
		[test]: ${faBoardListCountCalculation}
		<c:forEach var="faPageNum" items="${faBoardListCountCalculation}" begin="0" step="1" varStatus="status" >
			<a style="padding: 5px;">${status.count}</a>
		</c:forEach>
		</div>
		
		</div> --%>
		<%-- End List --%>
	</body>
</html>