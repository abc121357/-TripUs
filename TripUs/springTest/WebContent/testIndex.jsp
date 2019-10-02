
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%! String mid=""; %>
<%! HttpSession hs =null; %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title> 메인 헤더 </title>
		<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
	</head>
	<body>
		<a href="/coBoard/goCourseMain.do">[ 코스 ]</a>
		<a href="/toBoard/goTourMain.do">[ 여행지 ]</a>
	
		<div>
			<a href="signup/newFile.do">[test]</a><br>
		
			<a href="signup/listMember.do">[회원 목록]</a><br>
			<a href="signup/insertForm.do">[회원 가입]</a><br>

			<a href="fsBoard/goFestivalMain.do">[ 축제 ]</a>
		</div>
		
		<%
		hs = request.getSession(true);
		mid =(String)hs.getAttribute("mid");
		if(mid!=null){
	%>
	<div align="right">
		<a href="login/logout.do">[ 로그아웃 ]</a>
		<a href="login/goDeleteNotice.do">[ 회원탈퇴 ]</a>
		<a href="coBoard/goCourseMain.do">[ 코스 ]</a>
	</div>
	<%
		}else{
	%>
	<div align="right">
		<a href="login/loginPage.do">[ 로그인 ]</a><p>
	</div>
	<%
		}
	%>
	${result}
	
	</body>
</html>
