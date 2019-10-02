<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.mail.*"%>
<%! String id=""; %>
<%! String num = ""; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		$("#closeB").click(function(){
			window.close();
		});
	});

<%
	String context = "임시 비밀번호";
	num = request.getParameter("number");
	id = request.getParameter("mid");
	String memail = request.getParameter("memail");
	System.out.println("MailSend클래스에 넘겨준 memail : "+memail);
	MailSend ms = new MailSend();
	String result=ms.MailSend(num,context,memail);
	System.out.println("MailSend클래스에 넘겨준 num : "+num);
	System.out.println("result : "+result);
	out.println("result : "+result);
	if(result=="true"){	
		System.out.println("메일 보내기 성공");
%>
	var num=<%=num%>;
	console.log("sendMail.jsp의 스크립트 부분에 넘어온 number : "+num);
	var id="<%=id%>";
	var memail = "<%=memail%>";
	
		$.ajax({
			url:"/login/changePW.do",
			type:"GET",
			data: {mid:id,number:num,memail:memail},
			dataType : "text",
			success:function(data){
				console.log("data : "+data);
				if(data=="Complete!"){
					opener.document.getElementById("ch").value="임시 비밀번호 재전송";
				}
			},
			error:function(data){
				console.log("에러발생");	
				alert("에러발생");
			}
		});
<%
	}
%>
</script>
</head>
<body>
	<form name="sendMailForm" method="POST">
		<input type="hidden" id="number" name="number"/>
		<input type="hidden" id="mid" name="mid"/>
		<div style="margin-left:10px; margin-top:10px"></div>
		<center>
			<div style="margin-left:10px;">
			</br></br></br></br>
			해당 이메일로 임시 비밀번호가 전송되었습니다.</br>
			전송된 임시 비밀번호로 로그인하세요.</br></br></br></br>
			<input type="button" value=" 닫기 " id="closeB" name="closeB" onclick="close()"/>
			</div>
		</center>
	</form>
</body>
</html>