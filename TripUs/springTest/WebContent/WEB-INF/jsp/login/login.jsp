<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%! String mid=""; %>
<%! String mname=""; %>
<%! String memail=""; %>
<%! String mgrade=""; %>
<%! HttpSession hs =null; %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Insert title here</title>
	
	<style>
	    .bs-example{
	        margin: 20px;   
	    }
	     .header1{
	        font-size:2em;      
	    }
	</style>
	<script type="text/javascript">
		 
		function login(){
			alert("로그인 버튼 누름~");
			var id = $("#mid").val();
			var pw = $("#mpw").val();
			
			$.ajax({
				url:"/login/memberLogin.do",
				type:"GET",
				data: {mid:id,mpw:pw},
				dataType : "text",
				success:function(data){
					console.log("data : "+data);
					if(data=="true"){
						alert("로그인 성공. 메인페이지로 이동");
						document.loginForm.action="/login/goIndex.do";
						document.loginForm.submit();
					}
					else if(data=="false"){
						alert("잘못 입력하였습니다. 다시 입력하세요.");
						
					}
					else{console.log("? 컨트롤러 뭐함");}
				},
				error:function(data){
					console.log("에러발생");				
				}
			});
		}
	</script>
</head>
<body>
	<%
		hs = request.getSession(true);
		mid =(String)hs.getAttribute("mid");
		if(mid!=null){
	%>
		<p><h3>이미 로그인 중입니다!</h3></p><br>로그아웃 후 로그인해주세요
			<a href="/login/goIndex.do">메인페이지로</a>
	<%
		}else{
	%>
	
			<form name="loginForm" method="POST" >
			<div class="form-group">	
				<label>아이디</label>
				<input type="email" class="form-control mx-sm-2" id="mid" name="mid"/>
          		</div>
          		<div class="form-group">
				<label>비밀번호</label>
				<input type="password" class="form-control mx-sm-0" id="mpw" name="mpw" >
				<small class="text-muted">* 소문자,특수문자,숫자를 포함한 8~15자를 입력해주세요. </small>
			</div>
			
			<input type="button"  class="btn btn-primary btn-lg btn-block" value="로그인" onclick="login()">
			<input type="button"  class="btn btn-success btn-lg btn-block" value="네이버 계정으로 로그인" onclick="">
			<input type="button"  class="btn btn-info btn-lg btn-block" value="회원가입" onclick="">
			<br><br><center><p><a href="/login/goIdFind.do">아이디</a>
			<a href="/login/goSearchPW.do">/ 비밀번호 찾기</a></p></center>
			</form>
	<%
	}
	%>
</body>
</html>