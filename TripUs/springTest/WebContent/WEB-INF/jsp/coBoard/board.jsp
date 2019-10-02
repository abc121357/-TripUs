<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.api.*"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${viewname} 코스</title>
<style>
h3 {
	color: blue;
} 
</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.11.0.min.js"></script>

<script type="text/javascript">
	
	$(document).ready(function(){
		var view=document.contentForm.viewno.value;
		alert("view : "+view);
		$.ajax({
			url : '/coBoard/selectContentID.do',
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
						//console.log(data.response.body.items.item);
						myItem = data.response.body.items.item;
						console.log("myItem.length : "+myItem.length);
						
						
						output += '<h2>'  + '코스' + '</h2>';
						for (var i = 0; i< myItem.length; i++) {
							
							output += '<h4>' + myItem[i].subname + '</h4>';
							//output += '<p>' + myItem[i].subdetailalt + '</p>';
							
							output += '<p>' + myItem[i].subdetailoverview + '</p>';
							output += '<img src="' + myItem[i].subdetailimg  + '"alt="대표이미지">';
					
							//output += '<h4>' + myItem.firstimage + '</h4>';
							
						
						}
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
		
	
</script>
</head>
<body>
	
	<form  method="POST" name="contentForm">
	<c:set var="viewno" value="${viewno}"/>
		<input type="hidden" id="contentID" name="contentID"/> 
		<input type="hidden" id="viewno" name="viewno" value="${viewno}"/>
	
			
	</form>
	<div class="container">
		<div class="List"></div>
	</div>
	<div class="container">


		<!--  댓글  -->
		<div class="container">
			<label for="content">댓글</label>
			<form name="commentInsertForm">
				<div class="input-group">
					<input type="hidden" name="bno" value="${detail.bno}" /> <input
						type="text" class="form-control" id="content" name="content"
						placeholder="내용을 입력하세요."> <span class="input-group-btn">
						<button class="btn btn-default" type="button"
							name="commentInsertBtn">등록</button>
					</span>
				</div>
			</form>
		</div>

		<div class="container">
			<div class="commentList"></div>
		</div>
	</div>

<%@ include file="/commentS.jsp"%>
</body>
</html>
