<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- Bootstrap core CSS -->
		<link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		
		<!-- Custom styles for this template -->
		<link href="/resources/css/shop-homepage.css" rel="stylesheet">
		
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<style>
			
						
		</style>
		<script type="text/javascript">
			var img = new Array();
	     	var title = new Array();
	     	var content = new Array();
	     	
			function detail(viewno) {
				alert("클릭");
	  			location.href = "../fsBoard/goBoard.do?viewno="+viewno;
			}
			
			function aa(id,i){
		         $.ajax({
		            url : '../../PublicData3.do',
		            type : 'get',
		            data : {contentID:id},
		            dataType : 'json',
		            async : false,
		            success : function(data) {
		               console.log(data.response.body.items.item);
		               myItem = data.response.body.items.item;
		               
		               img[i] = '<img src="'+myItem.firstimage+'" width="100" height="80" alt="대표이미지">';
		               title[i] ='<h1>'+myItem.title+'</h1>';
		               title[i] +='<p>'+ myItem.overview+'</p>';
		               console.log("title["+i+"] : "+title[i]);
		               //$(".commentList").html(output);
		            },
		            error : function(XMLHttpRequest, textStatus, errorThrown) {
		               //alert("Status: " + textStatus);
		               //alert("Error: " + errorThrown);
		            }
		         });
		      }
			
			$(document).ready(function(){
		         $('input').filter("#contentID").each(function(index,element){
		            var contentid =$(element).val();
		            console.log((index+1)+"번째 contentID  :" +contentid);   
		            
		            aa(contentid,index);
		            
		            //$(element).val(index+1);
		         });
		         
		         $('div').filter("#img").each(function(index,element){
		            $(element).html(img[index]);   
		         });
		         $('div').filter("#content").each(function(index,element){
		            $(element).html(title[index]);   
		         });
		         
		         
		      });
		</script>
	</head>
	<body>
	<!-- Page Content -->
		<div class="container">
		      <br>
		      <br>
		      <br>
		      <br>
	      <div class="row">
	      	<c:forEach var="fsList" items="${fsBoardList}">
		      	<div class="col-sm-4" >
		      		<div id="img"></div>
		      		<h3>${fsList.viewno}</h3>
		      		<p id="fsBoardForm" onclick="detail('${fsList.viewno}')">${fsList.viewname} </p>
		      		 <input type="hidden" id="contentID" name="contentID" value="${fsList.contentid}"/> 
                     <input type="hidden"  id="viewno" name="viewno"  value="${fsList.viewno}"/>
                     <input type="hidden" id="viewname" name="viewname" value="${fsList.viewname}"/>
		      	 	 <div id="content"></div>
		      	</div>
	      	 </c:forEach>
	      </div>  
	   	</div>	
	</body>
</html>