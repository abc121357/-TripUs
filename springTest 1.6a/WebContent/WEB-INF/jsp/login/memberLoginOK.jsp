<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>          
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>로그인확인</title>
	</head>
	<body>
		<div>
			<table border="1">
				<colgroup>
					<col width="120px"/>
					<col width="220px"/>
					<col width="120px"/>
					<col width="110px"/>
				</colgroup>
				<thead>
					<tr>
						<th>학과코드</th>
						<th>학과명  </th>
						<th>전화번호</th>
						<th>상세보기</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty loginList}">
						<tr>
							<td colspan="5" align="center">
							입력하신 아이디나 비밀번호가 일치하지 않습니다.</td>
						</tr>
					</c:if>
					<c:forEach items="${loginList}" var="login">
						<tr>
							<td align="center">${login.mid}</td>
							<td align="left">${login.mpw}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
	</body>
</html>