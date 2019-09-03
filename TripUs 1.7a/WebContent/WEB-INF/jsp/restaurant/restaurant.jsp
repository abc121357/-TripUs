<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>tripUs</title>
</head>
<body>
맛집 홈페이지입니다.
<a href="insertResBoard.do">맛집게시글 작성</a>

<table style="border: 1px solid red">
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

<table style="border: 1px solid red">
		<c:if test="${empty hitlist}">
		<td colspan="5" align="center">데이터가 없습니다.</td>
		</c:if>
		<c:forEach items="${hitlist}" var="hit" varStatus="i">
			<tr >
				<td align="center" style="border: 1px solid black">${hit.rbtitle}</td>
				<td align="center" style="border: 1px solid black">${hit.rbhit}</td>
				<td align="center" style="border: 1px solid black">${hit.rbimage}</td>
		</tr>
		</c:forEach>
		</table>

</body>
</html>