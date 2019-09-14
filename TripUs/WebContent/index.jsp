<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>



</head>
<body>
테스트 index입니다.
<form id="favform" name="favform" action="myfavorite/myfavorite.do">
<input type="hidden" id="myno" name="myno" value="MY201908270001">
<button type="button" id="fav" name="fav" onclick="favtest()">눌러</button>
</form>
<br><a href="restaurant/restaurantMain.do"> 맛집메인으로 이동</a>
<br><a href="mypage/myPage.do">마이페이지로 이동</a>
<br><a href="mypage/myfavorite.do">즐겨찾기로 이동</a>


</body>
</html>