<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ page import="com.mail.*"%>

<%
	String context = "인증번호";
	String num = request.getParameter("number");
	String memail = request.getParameter("memail");
	MailSend ms = new MailSend();
	String result=ms.MailSend(num,context,memail);
	System.out.println("MailSend클래스에 넘겨준 num : "+num);
	System.out.println("result : "+result);

%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript"
		src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				$("#close").click(function(){
					window.close();
				});
			});
		</script>
	</head>
	<body>
	<form name="testMailForm" method="POST">
	
		<div style="margin-left:10px; margin-top:10px"></div>
		<center>
			<div style="margin-left:10px;">
			</br></br></br></br>
			해당 이메일로 인증번호가 전송되었습니다.</br>
			인증번호란에 전송된 인증번호를 입력하세요.</br></br></br></br>
			<input type="button" value="닫기" id="close" name="close" onclick="close()"/>
			</div>
		</center>
	</form>
	</body>
</html>


