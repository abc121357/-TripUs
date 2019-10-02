<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8");%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
					  "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title> ntResult.jsp </title>
		
		<script type="text/javascript">
		<% 
			System.out.println("qaResult.jsp SUCCESS >>> : ");
		%>
			alert('${result}');
			
			if('${result}'.indexOf('failed') > -1) {
				history.go(-1);
			} else {
				location.href='/qna/qaBoardList.qa'
			}
		</script>
	</head>
	
	<body>
	</body>
</html>