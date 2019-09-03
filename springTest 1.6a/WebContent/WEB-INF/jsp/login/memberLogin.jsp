<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title> 로그인 폼 </title>
		<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
		<style type="text/css">
			.mem{ text-align: center;}
		</style>
		<script type="text/javascript">
	
			function login(){
				console.log("현재 url : "+window.location.href);
				alert("로그인 클릭");
				window.document.loginForm.submit();
			}
		</script>
		
	</head>
	<body>

			<div style="margin-left:10px; margin-top:10px"></div>
			<hr>
			<center>
				<div style="margin-left:10px;">
				<h1> 로그인  </h1>
				
					<form name="loginForm" method="POST" action="login/memberLogin.khw" >
						<table border=1>
							<tr>
								<td class="mem"> 아이디 : </td>
								<td>
										<input type="text" id="mid" name="mid" /><br />
								</td>
							</tr>
							<tr>
								<td class="mem"> 비밀번호 : </td>
								<td>
									<input type="password" id="mpw" name="mpw" /><br />
								</td>
							</tr>
							<tr>
								<td colspan=2 align="center">
									<input type="button" value="로그인" onclick="login()">
									<input type="reset" value="다시"	/>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</center>
	</body>
</html>