<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>tripUs</title>
	
	<script type="text/javascript">
	
	function updateinfo(){
		
		submit.submit();
		
	}
	
	</script>
	
	</head>
	<body>
	마이페이지-정보수정입니다.
	
	<p align="center"> 정보수정 </p>
	<form id="updateinfo" method="post" action="/mypage/memberInfoUpdate.do">
	
	<div align="center">
	별명 : <input type="text" id="mnick" name="mnick"/>
	</div>
	
	<div align="center">
	휴대전화 : <input type="text" id="mhp" name="mhp"/>
	</div>
	
	<div align="center">
	변경할 비밀번호 : <input type="password" id="mpw" name="mpw"/>
	</div>
	
	<div align="center">
	비밀번호 확인 : <input type="password" id="checkmpw" name="checkmpw"/>
	<input type="submit" id="submit" name="submit" onclick="updateinfo()" value="입력"/>
	</div>
	
	
	</form>
	
	
	</body>
</html>