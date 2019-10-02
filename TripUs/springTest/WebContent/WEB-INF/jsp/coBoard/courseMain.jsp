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
			
			function detail(viewno) {
				alert("클릭");
	  			location.href = "../coBoard/goBoard.do?viewno="+viewno;
			}
		</script>
	</head>
	<body>
		<div class="container">
		      <br>
		      <br>
		      <br>
		      <br>
	      
		      <table id="courseList">
		      	<thead>
		        	<tr>
		            	<th> NO </th>
		            	<th> 제목 </th>

		         	</tr>
		      	</thead>
		      	<tbody> 
		     	<c:forEach var="coList" items="${coBoardList}">
		      		
	               		<tr>
	               			<td>${coList.viewno} 
	               			</td>
	               			<td id="coBoardForm" onclick="detail('${coList.viewno}')">${coList.viewname} 
	               			</td></tr>
		        </c:forEach>
		      	</tbody>   
		      </table>
	   		</div>	
	</body>
</html>