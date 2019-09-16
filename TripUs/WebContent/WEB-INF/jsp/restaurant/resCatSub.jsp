<%--
파일명 : resSub.jsp
설명 : api를 사용한 맛집목록을 볼 수 있는 페이지
작성일 : 2019.9.1
작성자 : LHJ
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<style>
			table, th, td {
  				border: 1px solid black;
  				border-collapse: collapse;
  				text-align: center;
			}
			
			#courseList {
				width: 100%;  
			}
			
			.boardInsertBtn1, .boardInsertBtn2 {
   				float: right;
   				color: black;
			}
			
			@media(min-width: 1200px){
			.container {
   				width: 1000px;
   				margin : 1% 10% 0% 15%;
			}
			}
			
			#searchSelectDiv {
				float: left;
				margin-right:2%;
				margin-top: 5px;
			}
			
			.input-group{
				 float: left;
				 width: 20%;
			}
			
			#boardDetailForm {
				color: black; 
				text-decoration:none;
			}
			
			
		</style>
		
		<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.11.0.min.js"></script>

<!-- bootstrap 3.4.0 -->	
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<!--Scroll to top-->
	<!--End of Scroll to top-->


	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<!-- <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js'></script>-->
	<script src="/resources/js/jquery-1.12.3.min.js"></script>

	<!--Counter UP Waypoint-->
	<script src="/resources/js/waypoints.min.js"></script>
	<!--Counter UP-->
	<script src="/resources/js/jquery.counterup.min.js"></script>
	<!--Google Maps API-->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBjxvF9oTfcziZWw--3phPVx1ztAsyhXL4"></script>


	<!--Isotope-->
	<script src="/resources/js/isotope/min/scripts-min.js"></script>
	<script src="/resources/js/isotope/cells-by-row.js"></script>
	<script src="/resources/js/isotope/isotope.pkgd.min.js"></script>
	<script src="/resources/js/isotope/packery-mode.pkgd.min.js"></script>
	<script src="/resources/js/isotope/scripts.js"></script>


	<!--Back To Top-->
	<script src="/resources/js/backtotop.js"></script>


	<!--JQuery Click to Scroll down with Menu-->
	<script src="/resources/js/jquery.localScroll.min.js"></script>
	<script src="/resources/js/jquery.scrollTo.min.js"></script>
	<!--WOW With Animation-->
	<script src="/resources/js/wow.min.js"></script>
	<!--WOW Activated-->
	<script>
		new WOW().init();
	</script>


	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="/resources/js/bootstrap.min.js"></script>
	<!-- Custom JavaScript-->
	<script src="/resources/js/main.js"></script>

 <!--Animated CSS-->
        <link rel="stylesheet" type="text/css" href="/resources/css/animate.min.css">

        <!-- Bootstrap -->
        <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
        <!--Bootstrap Carousel-->
        <link type="text/css" rel="stylesheet" href="/resources/css/carousel.css" />

        <link rel="stylesheet" href="/resources/css/isotope/style.css">

        <!--Main Stylesheet-->
        <link href="/resources/css/style.css" rel="stylesheet">
        <!--Responsive Framework-->
        <link href="/resources/css/responsive.css" rel="stylesheet">

		
		<script type="text/javascript">
			
		$(document).ready(function(){
			var foodCat="${foodCat}";
			//alert("foodCat : "+foodCat);
				$.ajax({
						url : '../PublicData.do',
						type : 'get',
						data : {foodCat:foodCat},
						dataType : 'json',
						success : function(data) {
							console.log("DATA : "+data);
							console.log(data);
							console.log(data.response.body.items.item);
							myItem = data.response.body.items.item;
							var areaCodeStr='';
							console.log(myItem[0].cat3);
							switch(myItem[0].cat3){
							case 'A05020100':
								CatStr="한식";
								break;
							case 'A05020300':
								CatStr="일식";
								break;
							case 'A05020200':
								CatStr="서양식";
								break;
							case 'A05020400':
								CatStr="중식";
								break;
							default:
							areaCodeStr="지역분류없음";
							
							}
							
							var output = '';
							output += '<h2 style="font-size:40px; font-family: 나눔고딕">'  + CatStr + '</h2>';
							for (var i = 0; i<myItem.length; i++) {
							
								console.log(myItem.length);
								
								output += '<hr>';
								output += '<h3 onclick="detail('+myItem[i].contentid+')"> 이름 : ' + myItem[i].title + '</h3>';
								output += '<br>';
								output += '<p> 주소 : ' + myItem[i].addr1 + '</p>';
								output += '<div class="row" id="resInfo">';
								output += '<div class="col-md-7">';
								output += '<p class=""> 조회수 : ' + myItem[i].readcount + '</p>';
								//if(){
								output += '<img id="offstar" align="right" onclick="onstar('+myItem[i].contentid+', &#39;'+myItem[i].title+'&#39;, &#39;'+myItem[i].addr1+'&#39;)" width="50px" height="50px" src="/resources/img/흰별.jpg" alt="이미지가 없습니다.">';
							//}
							//else{
							//	output += '<img id="offstar" align="right" onclick="onstar('+myItem[i].contentid+', &#39;'+myItem[i].title+'&#39;, &#39;'+myItem[i].addr1+'&#39;)" width="50px" height="50px" src="/resources/img/흰별.jpg" alt="이미지가 없습니다.">';	
							//}
								output += '</div>';
								output += '<div class="col-md-5">';
								output += '<img class="img-rounded" onclick="detail('+myItem[i].contentid+')" width="400px" height="400px" src="' + myItem[i].firstimage  + '"alt="이미지가 없습니다.">';
								output += '</div>';
								output += '</div>';
								
						
								//output += '<h4>' + myItem.firstimage + '</h4>';
								
								console.log(output);
							}
								$(".List").html(output);
							
								//document.body.innerHTML += output;
						},
						error : function(XMLHttpRequest, textStatus, errorThrown) {
							alert("Status: " + textStatus);
							alert("Error: " + errorThrown);
						}
					});
			});
		
			function detail(contentid) {
				//alert(contentid);
	  			location.href = "../restaurant/goBoard.do?contentid="+contentid;
			}
			
			function onstar(contentid,title,addr1){
				//alert(contentid);
				//document.getElementById("offstar").src="/resources/img/검은별.jpg";
				//document.getElementById("offstar").onclick="offstar(contentid)";
				//location.href = "../mypage/insertMyFavorite.do?contentId="+contentid+"&title="+title+"&addr1="+addr1;
			
				$.ajax({
					url : '../mypage/insertMyFavorite.do',
					type : 'get',
					data : {contentId:contentid,title:title,addr1:addr1},
					dataType : 'text',
					success : function(data) {
						document.getElementById("offstar").src="/resources/img/검은별.jpg";
						document.getElementById("offstar").onclick="offstar(contentid)";
						
						//alert("success!!");
							//document.body.innerHTML += output;
					},
					error : function(XMLHttpRequest, textStatus, errorThrown) {
						alert("Status: " + textStatus);
						alert("Error: " + errorThrown);
					}
				});
			
			}
		</script>
	</head>
	<body>
		<div class="container">
		      <br>
		      <br>
		      <br>
		      <br>
	     		
		     	<div class="List">
		      	
		      	</div>
		      <table id="resList">
		      	<thead>
		        	<tr>
		            	<th> NO </th>
		            	<th> 제목 </th>

		         	</tr>
		      	</thead>
		      	<tbody>
		      	
		      	
		      	
		     	<c:forEach var="resList" items="${resBoardList}">
		      		
	               		<tr>
	               			<td>${resList.viewno} 
	               			</td>
	               			<td id="toBoardForm" onclick="detail('${resList.viewno}')">${resList.viewname} 
	               			</td></tr>
		        </c:forEach>
		      	</tbody>   
		      </table>
	   		</div>
	   		
	   		
	</body>
</html>