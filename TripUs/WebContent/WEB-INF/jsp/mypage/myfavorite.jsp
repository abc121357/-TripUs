<%--
파일명 : myfavorite.jsp
설명 : 즐겨찾기 목록보기
작성일 : 2019.9.1
작성자 : LHJ
 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	<script type="text/javascript">
	
	function deletefav(title,mno,mycno){
		
		$.ajax({
			url:'../mypage/deleteMyFavorite.do',
			type:'get',
			data:{mno:mno,mycno:mycno},
			dataType:'text',
			success : function(data){
				console.log("즐겨찾기에서 삭제됫엉");
				alert(title + "이(가) 즐겨찾기에서 삭제되었습니다.");
				location.reload();
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("Status: " + textStatus);
				alert("Error: " + errorThrown);
				alert("오류가 발생했습니다.");
			}
			
		});
		
	}
	
	function backspace(){
		location.href="/mypage/myPage.do";
	}
	
	</script>
	
	</head>
	<body>
	
	<h1 align="center">즐겨찾기</h1>

	<div class="container" align="center">

		<div class="btn-group" align="center">
		<form>
			<a class="btn btn-info" href="/mypage/myfavorite.do?mygrade=0" id="all" name="all" >전체</a>
			<a class="btn btn-info" href="/mypage/myfavorite.do?mygrade=1" id="trip" name="trip">여행지</a>
			<a class="btn btn-info" href="/mypage/myfavorite.do?mygrade=2" id="res" name="res">맛집</a>
			<a class="btn btn-info" href="/mypage/myfavorite.do?mygrade=3" id="fes" name="fes">축제</a>
			<br>
			<p>즐겨찾기는 최대 100개까지 등록가능합니다.</p>
		</form>
		</div>
	</div>
		<div class="viewfav" id="viewfav" align="center" style="height:800px; padding: 0px, 20%, 0px, 20%">
		<c:if test="${empty myFavorite}">
		<p>저장한 즐겨찾기가 없습니다.</p>
		</c:if>
		<c:forEach items="${myFavorite}" var="fav" varStatus="i">
				<hr>		
				<h3>제목 : ${fav.mytitle}</h3>
				<p>위치 : ${fav.mylocation}</p>
				<p>링크 : ${fav.mylink}</p>
				<div id="delfav">
				<a class="btn btn-primary" onclick="deletefav('${fav.mytitle}','${fav.mno}',${fav.mycno})">삭제</a>
				</div>
		</c:forEach>
		</div>
		<div id="footer" align="center">
		
		<div class="btn btn-primary btm-sm" onclick="backspace();">
		<h6>마이페이지</h6>
		</div>
		
		</div>
	
	</body>
</html>