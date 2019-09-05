<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

function favtest(){
	
	document.getElementById("favform").action();
	
}

</script>


</head>
<body>
index입니다.
<form id="favform" name="favform" action="myfavorite/myfavorite.do">
<input type="hidden" id="myno" name="myno" value="MY201908270001">
<button type="button" id="fav" name="fav" onclick="favtest()">눌러</button>
</form>
<br><a href="restaurant/restaurant.do"> 맛집메인으로 이동</a>
<br><a href="restaurant/listresBoard.do">맛집 후기 게시판으로 이동</a>
<br><a href="restaurant/resBoard.do"> 맛집후기게시글작성으로 이동</a>
<br><a href="login/memberLogin.do"> 멤버로그인으로이동</a>
<br><a href="mypage/myPage.do">마이페이지로 이동</a>
<br><a href="myfavorite/myfavorite.do">즐겨찾기로 이동</a>
<br><a href="myfavorite/insertmyfavorite.do">즐겨찾기추가로 이동</a>



</body>
</html>