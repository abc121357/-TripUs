<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>tripUs</title>

	<style type="text/css">
		
		a{
		color: black;
		}
		
		table{
		
		border: 1px solid red;
		
		}
	
		td{
		
		border: 1px solid red;
		
		}
		.box{
		border: 1px solid blue;
		width: 200px;
		height: 200px;
				}
	
	</style>
	
	</head>
	<body>
	마이페이지 메인입니다.
	
	유저 정보
		<table>
		<c:forEach items="${mList}" var="mem" varStatus="i">
				<tr>
					<td>닉네임 : </td><td class="data" align="center">${mem.mnick}</td>
					<td>전화번호 : </td><td class="data"align="center">${mem.mhp}</td>
					<td>가입일 : </td><td class="data" align="center">${mem.minsertdate}</td>
			</tr>
			</c:forEach>
		</table>
	<div class="boxgroup">
	<div class="box" >
		<a href="/mypage/infoupdate.do">가입정보 수정</a>
	</div>
	<div class="box">
		<a href="/mypage/myfavorite.do">즐겨찾기 목록</a>
	
	</div>
	<div class="box">
		<a href="/xxx.do">Q&A</a>
	</div>
	<div class="box">
		<a href="/xxx.do">회원탈퇴</a>
	</div>
	</div>
	
	</body>
</html>