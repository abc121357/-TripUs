<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<% request.setCharacterEncoding("UTF-8");%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
					  "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<title> Q&A Detail Page </title>
		
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

		<!-- qaBoardList style group -->
		<style type="text/css">
			@media (min-width: 1200px){
				.container {
			   		width: 1170px;
			    	margin-bottom: -20px;
				}
			}
			
			.qaUpdateDivButton {
				float : right;
				margin-right : 3px;
			}
			
			.qaTbl {
				border-collapse : separate;
		 		border-spacing : 3px 2px;
		 	    border : 1px solid #ddd;
			}
			
			.qaTbleDetailReply {
			    border-collapse : separate;
		 		border-spacing : 3px 2px;
		 	    border : 1px solid #ddd;
			}
			
			.qaTbl .qaTd {
				width: 1%;
				text-align : center;
				font-weight : bold;
		 		border : 1px solid #ddd; 
				font-size : 16px;
				color : #747070;
				background: #e9f2fa;
			}
			
			.qafile {
				width: 2%;
				text-align : center;
				font-weight : bold;
		 		border : 1px solid #ddd; 
				font-size : 16px;
				color : #747070;
			}
			
			.TdDetailReply {
				font-weight : bold;
				font-size : 16px;
				color : #747070;
				width: 32%;
    			text-align : center;
    			border : 1px solid #ddd;
   				background: #e9f2fa; 
   				margin-right: 2%;
			}
			
			.secretText {
				padding-left : 1%;
				text-align : right;
				font-weight : bold;
				color : #747070;
			}
			
			#qaNo, #qaId, #qaType, #qaAnsertType {
			width : 30%;
			}
			
			textarea {
				width : 100%;
				height : 100%;
			}
				
			.form-control[readonly], .form-control[disabled] {
			    background-color : white;
			    opacity : 1;
			}
			
			#qaTitleSecret {
				width : 80%;
				display : inline;
			}
			
			.qafile {
				border-bottom  :1px solid #ddd; 	
			}
			
			.qaReImg {
				vertical-align: middle;
			    width: 200px;
			    height: 150px;
			}
			
			#row {
				margin-left : 3px;
				margin-bottom: 2%;
    		 	margin-top: 3%; 
			}
			
			.col-sm-9 {
				margin-left : 5%;
			}
			
			#topHr {
				width: 73%;
    			margin-left: 23%;
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
				/* Secret box check value fix*/
				if($('#qasecretyn').val() == 'Y') {
					$('#qasecretyn1').attr('checked', true);
					$('#qasecretyn1').attr('disabled', true);
				} else if($('#qasecretyn').val() == 'N') {
					$('#qasecretyn1').attr('checked', false);
					$('#qasecretyn1').attr('disabled', true);
				}
			});
	
			/*Push Button group Start*/
			function qaBoardUpdateButton(qano) {
				if(confirm(' 게시물 수정을 진행하시겠습니까? ')) { 
		  			$('#qaNo').val(qano);
		  			$('#qaBoardDetailForm').attr('action', '/qna/qaBoardSelect.qa');
					$('#qaBoardDetailForm').submit();
				} else {
					return false;
				}
			} 
				
			function qaBoardListButton() {
				if(confirm(' FAQ 게시물 목록으로 되돌아가시겠습니까? ')) {
					$('#qaReplyForm').attr('action', '/qna/qaBoardList.qa');
					$('#qaReplyForm').submit();
				} else {
					return false;
				}
			} 
	
			function qaRePlyInsertButton(qano){
				if(confirm(' 게시물에 대한 답변 등록을  진행하시겠습니까? ')) {
					$('#qaNoOne').val(qano);
					$('#qaReplyContent').val('');
					$('#qaReplyForm').attr('action', '/qna/qaBoardReplySelect.qa');
					$('#qaReplyForm').submit();
				} else {
					return false;
				}
			}
			   
			function qaRePlyUpdateButton(qano) {
				if(confirm(' 게시물에 대한 답변 수정을  진행하시겠습니까? ')) {
					$('#qaNoOne').val(qano);
					$('#qaReplyForm').attr('action', '/qna/qaBoardReplySelect.qa');
					$('#qaReplyForm').submit();
				} else {
					return false;
				}
			}
			   
			function qaRePlyDeleteButton(qano) {
				if(confirm(' 게시물 삭제를 진행하시겠습니까? ')) {
					$('#qaNoOne').val(qano);
					$('#qaReplyForm').attr('action', '/qna/qaBoardDelete.qa');
					$('#qaReplyForm').submit();
				} else {
					return false;
				}
			}
			/*Push Button group End*/
		</script>
	</head>
	
	<body>
	<% System.out.println("qaBoardDetail.jsp 진입 성공 >>> : "); %>
	<%-- <p>${qaBoardDetail}</p> --%>
		
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
					<%-- Start DetailForm --%>
					<form id='qaBoardDetailForm'>
	   					<input type='hidden'  id='qaNo' name='qano' value='${qaBoardDetail.qano}' />
	   				</form> 
     			
					<table class='qaTbl'>
						<tr> 
							<td class='qaTd'>문의번호</td>
						
							<td> 
								<input type='text' class='form-control' id='qaNo' readonly='readonly' value='${qaBoardDetail.qano}' />
							</td>
						</tr>
					
						<tr>
							<td class='qaTd'>작성자</td>
							
							<td> 
								<input type='text' class='form-control'  id='qaId' readonly='readonly' value='${qaBoardDetail.qaid}' />
							</td>
						</tr>
					
						<tr>
							<td class='qaTd'>문의유형</td> 
							
							<td> 
								<input type='text' class='form-control' id='qaType' readonly='readonly' value='${qaBoardDetail.qatype}' />
							</td>
						</tr>
				
						<tr>
							<td class='qaTd'>답변상태</td> 
							
							<td> 
								<input type='text' class='form-control'  id='qaAnsertType' readonly='readonly' value='${qaBoardDetail.qaanswertype}' />
							</td>
						</tr>
					
						<tr> 
							<td class='qaTd'>등록일</td>
							<td> 
								<input type='text' class='form-control' readonly='readonly' value='${qaBoardDetail.qainsertdate}'>
							</td>
						</tr>
					
					
						<tr>
							<td class='qaTd'>문의제목</td>
							
							<td>
								<input type='hidden' id='qasecretyn' name='qasecretyn' value='${qaBoardDetail.qasecretyn}'>
								<span>
									<input type='text' class='form-control' readonly='readonly' value='${qaBoardDetail.qatitle}' id='qaTitleSecret' />
								</span>
								<span class='secretText'>비밀글 
									<input type='checkbox' id='qasecretyn1' value='Y'>
								</span>
							</td>
						</tr>
					
						<tr>
							<td class='qaTd'>문의내용</td>
							
							<td> 
								<textarea class='form-control' readonly='readonly'  rows='5' >${qaBoardDetail.qacontent}</textarea>
							</td>
						</tr>
					
						<tr>
							<td class='qaTd'>첨부파일</td>
							
							<td colspan='2'  class='qafile' >
								<!-- Usually name property have used to vo file , but MultipartFile property use different file name for collision avoid -->
								<c:if test="${qaBoardDetail.qaimage != null}">
									<img src='/fileupload/${qaBoardDetail.qaimage}'  alt='사진없음' />
									<p>${qaBoardDetail.qaimage}</p>
								</c:if>
								<input type='hidden' id='qaImage' name='qaimage' value='${QaBoardUpdate.qaimage}' />
							</td>
						</tr>
					</table>
				
   		 			<br>
   		 		
   		 			<!-- Push Button -->
   		 			<c:if test='${qaBoardDetail.qastep == 0}'>
	   		 			<div class='qaUpdateDivButton'>
	   		 				<!-- only admin use -->
	   		 				<c:if test='${sessionScope.mgrade=="1"}'>
		   		 				<span><button class='btn btn-default' onclick='qaRePlyInsertButton("${qaBoardDetail.qano}")'>답글등록</button></span>
							</c:if>
							
							<!-- only authors use -->
							<c:if test='${sessionScope.mid==qaBoardDetail.qaid}'>
								<span><button class='btn btn-default' onclick='qaBoardUpdateButton("${qaBoardDetail.qano}")'>수정</button></span>
							</c:if>
							<span><button class='btn btn-default' onclick='qaBoardListButton()'> 목록 </button></span>
	     				</div>
     				</c:if>
     				<%-- End DetailForm --%>
	     			<br>
	     			<hr>
     				
     				<div>
     				<%-- Start DetailReplyForm --%>	
         			<form id='qaReplyForm'>
    		   			<input type='hidden'  id='qaNoOne' name='qano' value='${qaBoardDetail.qano}' />
	       					<c:choose>
	       						<c:when test='${qaBoardDetail.qastep == 0}'>
	       							<input type='hidden' id='qaReplyContent' name='qareplycontent' />
	       						</c:when>
	       				
	       					<c:otherwise>
	       						<table class='qaTbleDetailReply'>
	       							<tr>
	       								<td class='TdDetailReply'>답변</td>
	       					
	       								<td>
	       									<textarea id='qaReplyContent' name='qareplycontent' readonly='readonly' rows='5' cols='100'>${qaBoardDetail.qareplycontent}</textarea>
	       								</td>
	       							</tr>
								</table>
							
								<!-- Push Reply Button -->
	       						<div class='qaUpdateDivButton'>
	       							<!-- only admin use -->
	       							<c:if test='${sessionScope.mgrade=="1"}'>
										<span><button class='btn btn-default' onclick='qaRePlyUpdateButton("${qaBoardDetail.qano}")'>답글수정</button></span>
										<span><button class='btn btn-default' onclick='qaRePlyDeleteButton("${qaBoardDetail.qano}")'>문의글 삭제</button></span>
									</c:if>
										<span><button class='btn btn-default' onclick='qaBoardListButton()'> 목록 </button></span>
								</div>
	       					</c:otherwise>
						</c:choose>
       				</form>
       				<br>
       				</div>
     				<hr>
   					<%-- End DetailReplyForm --%>
   				</div>
   			</div>
   		</div>
	</body>
</html>