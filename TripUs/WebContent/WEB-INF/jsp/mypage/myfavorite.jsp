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
	
	function deletefav(mno,mycno){
		
		$.ajax({
			url:'../mypage/deleteMyFavorite.do',
			type:'get',
			data:{mno:mno,mycno:mycno},
			dataType:'text',
			sucess:function(data){
			alert("data : "+data);
			console.log("즐겨찾기에서 삭제됫엉");
			alert("즐겨찾기에서 삭제되었습니다.");
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("Status: " + textStatus);
				alert("Error: " + errorThrown);
				alert("오류가 발생했습니다.");
			}
		});
		
	}
	
	</script>
	
	</head>
	<body>
	마이페이지 - 즐겨찾기 입니다.
	<div class="container">

		<div class="btn-group">
		<form>
			<a class="btn btn-info" href="/mypage/myfavorite.do?" id="all" name="all" >전체</a>
			<a class="btn btn-info" href="/mypage/myfavorite.do" id="trip" name="trip">여행지</a>
			<a class="btn btn-info" href="/mypage/myfavorite.do" id="res" name="res">맛집</a>
			<a class="btn btn-info" href="/mypage/myfavorite.do" id="fes" name="fes">축제</a>
		</form>
		</div>
	</div>
	<p>즐겨찾기는 최대 10개까지 등록가능합니다.</p>
		<c:if test="${empty myFavorite}">
		<td colspan="5" align="center">저장한 즐겨찾기가 없습니다.</td>
		</c:if>
		<c:forEach items="${myFavorite}" var="fav" varStatus="i">
				<hr>		
				<h3>제목 : ${fav.mytitle}</h3>
				<p>위치 : ${fav.mylocation}</p>
				<p>링크 : ${fav.mylink}</p>
				<div onclick="deletefav('${fav.mno}',${fav.mycno})">
				<a>삭제</a>
				</div>
		</c:forEach>
	
	
	
	</body>
</html>