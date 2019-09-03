<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>tripUs</title>
	</head>
	<body>
		입력된 게시판결과입니다.
		
		<table>
		<c:if test="${empty restaurantlist}">
		<td colspan="5" align="center">데이터가 없습니다.</td>
		</c:if>
		<c:forEach items="${restaurantlist}" var="res" varStatus="i">
			<tr>
				<td align="center">${res.rtno}</td>
				<td align="center">${res.rtid}</td>
				<td align="center">${res.rtnick}</td>
				<td align="center">${res.rtcontent}</td>
				<td align="center">${res.rtinsertdate}</td>
		</tr>
		</c:forEach>
		</table>
	</body>
</html>