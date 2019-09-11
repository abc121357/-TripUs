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
		<script type="text/javascript">
			
		$(document).ready(function(){
			var view=document.contentForm.viewno.value;
			alert("view : "+view);
			$.ajax({
				url : '/restaurant/selectContentID.do',
				type : 'get',
				data : {viewno:view},
				dataType : 'text',
				success : function(data) {
					console.log("DATA : "+data);
					alert("data : "+data);
					document.contentForm.contentID.value=data;
					var myItem=null;
					var contentID =data;
					var output = '';
					$.ajax({
						url : '../PublicData.do',
						type : 'get',
						data : {contentID:contentID},
						dataType : 'json',
						success : function(data) {
							console.log("DATA : "+data);
							console.log(data);
							console.log(data.response.body.items.item);
							myItem = data.response.body.items.item;

							//for (var i = 0; myItem.length; i++) {
							
								console.log(myItem.length);
								output += '<h2 style="font-size:40px; font-family: 나눔고딕">'  + '맛집' + '</h2>';
								output += '<hr>';
								output += '<h4>' + myItem.title + '</h4>';
								
								output += '<p>' + myItem.addr1 + '</p>';
								output += '<hr>';
								output += '<div class="row" id="resInfo">';
								output += '<div class="col-md-7">';
								output += '<p class="">' + myItem.overview + '</p>';
								output += '</div>';
								output += '<div class="col-md-5">';
								output += '<img class="img-rounded" width="400px" height="400px" src="' + myItem.firstimage  + '"alt="대표이미지">';
								output += '</div>';
								output += '</div>';
								
						
								//output += '<h4>' + myItem.firstimage + '</h4>';
								
								console.log(output);
								$(".List").html(output);
								//document.body.innerHTML += output;
						},
						error : function(XMLHttpRequest, textStatus, errorThrown) {
							alert("Status: " + textStatus);
							alert("Error: " + errorThrown);
						}
					});
				},
				error : function(message) {
					alert("Error message: " + message);
				}
			});
		});
		
			function detail(viewno) {
				alert("클릭");
	  			location.href = "../restaurant/goBoard.do?viewno="+viewno;
			}
		</script>
	</head>
	<body>
		<div class="container">
		      <br>
		      <br>
		      <br>
		      <br>
	      
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