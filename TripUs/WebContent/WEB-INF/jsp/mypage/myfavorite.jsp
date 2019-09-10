<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>tripUs</title>
		  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	
	<style type="text/css">
	
	table{
	
	border: 1px solid red;
	
	}
	
	tr{
	border: 1px solid red;
	}
	
	td{
	border: 1px solid red;
	}
	
	td.data{
	border: 1px solid blue;
	}
	
	</style>
	
	</head>
	<body>
	마이페이지 - 즐겨찾기 입니다.
	<div class="container">

		<div class="btn-group">
		<form>
			<a class="btn btn-info" href="/mypage/myfavorite.do" id="all" name="all" >전체</a>
			<a class="btn btn-info" href="/mypage/myfavorite.do" id="trip" name="trip">여행지</a>
			<a class="btn btn-info" href="/mypage/myfavorite.do" id="res" name="res">맛집</a>
			<a class="btn btn-info" href="/mypage/myfavorite.do" id="fes" name="fes">축제</a>
		</form>
		</div>
	</div>
	<p>즐겨찾기는 최대 10개까지 등록가능합니다.</p>
	<table>
		<c:if test="${empty myFavorite}">
		</c:if>
		<td colspan="5" align="center">저장한 즐겨찾기가 없습니다.</td>
		<c:forEach items="${myFavorite}" var="fav" varStatus="i">
			<tr>
				<td>제목 : </td><td class="data"align="center">${fav.mytitle}</td>
				<td>위치 : </td><td class="data" align="center">${fav.mylocation}</td>
				<td>링크 : </td><td class="data" align="center">${fav.mylink}</td>
				<td><a href="/mypage/deleteMyFavorite.do">삭제</a></td>
		</tr>
		</c:forEach>
		</table>
	
	
	
	</body>
</html>