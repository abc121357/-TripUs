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
	
	table>tr{
	border: 1px solid red;
	}
	
	table>tr>td{
	border: 1px solid red;
	}
	
	</style>
		
	</head>
	<body>
	마이페이지 - 즐겨찾기 입니다.
	<table>
		<c:if test="${empty myFavorite}">
		<td colspan="5" align="center">데이터가 없습니다.</td>
		</c:if>
		<c:forEach items="${myFavorite}" var="fav" varStatus="i">
			<tr>
				<td align="center">${fav.myno}</td>
				<td align="center">${fav.mytitle}</td>
				<td align="center">${fav.myid}</td>
				<td align="center">${fav.mylocation}</td>
				<td align="center">${fav.mylink}</td>
		</tr>
		</c:forEach>
		</table>
	
	</body>
</html>