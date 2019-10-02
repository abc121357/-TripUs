<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
h3 {
	color: blue;
}
</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
	$.ajax({
		url : 'PublicData.do',
		type : 'get',
		dataType : 'json',
		success : function(data) {
			console.log(data);
			console.log(data.response.body.items.item);
			var myItem = data.response.body.items.item;

			//for (var i = 0; myItem.length; i++) {
			var output = '';
			//console.log(myItem.length);
			var header1 = document.getElementById('header1');
			
			output += '<h2>' + "관광지" + '</h2>';
			output += '<h4>' + myItem.title + '</h4>';
			output += '<p>' + myItem.addr1 + '</p>';

			output += '<p>' + myItem.overview + '</p>';

			output += '<img src="' + myItem.firstimage  + '"alt="대표이미지">';

			//output += '<h4>' + myItem.firstimage + '</h4>';

			console.log(output)
			header1.innerHTML += output;
			//$(".commentList").html(output);
			//document.body.innerHTML += output;
			//}
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			alert("Status: " + textStatus);
			alert("Error: " + errorThrown);
		}
	});
</script>
</head>
<body>
	<form action="PublicData.do" method="get"></form>
	<p id="header1"></p>
</body>
</html>
<%@ include file="comment2.jsp"%>
