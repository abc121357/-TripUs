<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>tripUs</title>
		
	
	<style type="text/css">
	
	table{
	
	border: 1px solid red;
	
	}
	
	tr{
	border: 1px solid red;
	}
	
	td{
	border: 1px solid red;
	}
	
	td.data{
	border: 1px solid blue;
	}
	
	</style>
		
	</head>
	<body>
	���������� - ���ã�� �Դϴ�.
	<table>
		<c:if test="${empty myFavorite}">
		<td colspan="5" align="center">�����Ͱ� �����ϴ�.</td>
		</c:if>
		<c:forEach items="${myFavorite}" var="fav" varStatus="i">
			<tr>
				<td>��ȣ : </td><td class="data" align="center">${fav.myno}</td>
				<td>���� : </td><td class="data"align="center">${fav.mytitle}</td>
				<td>�����̵� : </td><td class="data" align="center">${fav.myid}</td>
				<td>��ġ : </td><td class="data" align="center">${fav.mylocation}</td>
				<td>��ũ : </td><td class="data" align="center">${fav.mylink}</td>
		</tr>
		</c:forEach>
		</table>
	
	</body>
</html>