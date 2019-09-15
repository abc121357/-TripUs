<%--
���ϸ� : myfavorite.jsp
���� : ���ã�� ��Ϻ���
�ۼ��� : 2019.9.1
�ۼ��� : LHJ
 --%>
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
	���������� - ���ã�� �Դϴ�.
	<div class="container">

		<div class="btn-group">
		<form>
			<a class="btn btn-info" href="/mypage/myfavorite.do?" id="all" name="all" >��ü</a>
			<a class="btn btn-info" href="/mypage/myfavorite.do" id="trip" name="trip">������</a>
			<a class="btn btn-info" href="/mypage/myfavorite.do" id="res" name="res">����</a>
			<a class="btn btn-info" href="/mypage/myfavorite.do" id="fes" name="fes">����</a>
		</form>
		</div>
	</div>
	<p>���ã��� �ִ� 10������ ��ϰ����մϴ�.</p>
		<c:if test="${empty myFavorite}">
		<td colspan="5" align="center">������ ���ã�Ⱑ �����ϴ�.</td>
		</c:if>
		<c:forEach items="${myFavorite}" var="fav" varStatus="i">
				<hr>		
				<h3>���� : ${fav.mytitle}</h3>
				<p>��ġ : ${fav.mylocation}</p>
				<p>��ũ : ${fav.mylink}</p>
				<a href="/mypage/deleteMyFavorite.do?=${fav.myno}">����</a></td>
		
		</c:forEach>
	
	
	
	</body>
</html>