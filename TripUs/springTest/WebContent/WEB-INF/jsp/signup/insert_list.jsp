 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
					  "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>회원가입 목록</title>
		<script type="text/javascript"
			src="http://code.jquery.com/jquery-1.6.4.js"></script>
		<script type="text/javascript">
		</script>
	</head>
	<body>
		<div>
			<table border="0" cellpadding="1" cellspacing="1">
				<tr>
					<th width="650"><h4>회원가입[Spring]</h4></th>
				</tr>
			</table>
		</div>
		<form method="POST">
			<table border="1">
				<thead>
					<tr>
						<td>회원번호</td>
						<td>아이디</td>
						<td>비밀번호</td>
						<td>이름</td>
						<td>별명</td>
						<td>성별</td>
						<td>전화번호</td>
						<td>이메일</td>
						<td>생년월일</td>
						<td>회원삭제여부</td>
						<td>회원등록일</td>
						<td>프로필사진</td>
						<td>구분코드</td>
						<td>레코드생성일</td>
						<td>레코드수정일</td>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty memberList}">
						<tr>
							<td colspan="5" align="center">회원가입 데이터가 존재하지 않습니다.</td>
						</tr>
					</c:if>
					<c:forEach items="${memberList}" var="row">
						<tr align="center">
							<td>${row.mno}</td>
							<td>${row.mid}</td>
							<td>${row.mpw}</td>
							<td>${row.mname}</td>
							<td>${row.mnick}</td>
							<td>${row.mgender}</td>
							<td>${row.mhp}</td>
							<td>${row.memail}</td>
							<td>${row.mbirth}</td>
							<td>${row.mdeleteyn}</td>
							<td>${row.minsertdate}</td>
							<td>${row.mprofile}</td>
							<td>${row.mgrade}</td>
							<td>${row.mrecordinsertdate}</td>
							<td>${row.mrecordupdatedate}</td>
						</tr>
					</c:forEach>
	
				</tbody>
			</table>
		</form>
	
	</body>
</html>