<%@page import="com.mail.MailSend"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mail.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String context = "회원가입 메일 > 인증 번호";
	String num = request.getParameter("number");
	String memail = request.getParameter("memail");
	MailSend ms = new MailSend();
	String result=ms.MailSend(num, context, memail);
	System.out.println("MailSend클래스에 넘겨준 num : "+num);
	System.out.println("MailSend클래스에 넘겨준 memail : "+memail);
	System.out.println("result : "+result);
	
%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>이메일 테스트</title>
		<script type="text/javascript">
		// 수정.. [닫기] 클릭시 
		$(document).on('click','#closeB',function(){
			alert("닫기 눌러용 >>> ");
			self.opener = self;

			window.close();
		});
		</script>
	</head>
	<body>
		<form name="testMailForm" method="POST">
			
			<div style="margin-left:10px; margin-top:10px"></div>
			<center>
				<div style="margin-left:10px;"></div>
				<br><br><br><br>
				해당 이메일로 인증번호가 전송되었습니다.<br>
				인증번호란에 전송된 인증번호를 입력하세요.<br><br><br><br>
				<input type="button" value="확인" id="closeB"/>
			</center>
		</form>
	</body>
</html>