<%--
파일명 : infoupdate.jsp
설명 : 내 정보수정
작성일 : 2019.9.1
작성자 : LHJ
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>tripUs</title>
	
	<!-- bootstrap 3.4.0 -->	
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	
	
	
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
	
	<script type="text/javascript">
	
	
	
	
	function nickCheck(){
		
		
		var mnick=document.getElementById("mnick").value;
		
		alert("mnick : "+ mnick);

		$.ajax({
			url:"/mypage/infoNickCheck.do",
			type:"GET",
			data:{mnick:mnick},
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			dataType : "text",
			success:function(resultStr){
				console.log("resultStr : " + resultStr);
				if(resultStr=="nicktrue"){
					alert("별명을 사용할수 있습니다.");
				}
				else if(resultStr=="nickfail"){
					alert("해당 별명을 사용할 수 없습니다.");
				}
				else{
					console.log("data : " + resultStr);
					alert("data에 잘못된 값 들어감");
				}
			},
			error:function(resultStr){
				console.log("data : " + resultStr);
				alert("예기치못한 오류발생");
			}
		});


		
	}
	
	function pwCheck(){
		var mpw = document.getElementById("mpw");
		var checkmpw = document.getElementById("checkmpw");
		if(mpw.value.length>7&&mpw.value.length<15){
			if(mpw.value == checkmpw.value) {
				
				return true;
			} else {
				alert("비밀번호가 다릅니다.");
				checkmpw.value = "";
				checkmpw.focus();
				
				return false;
			}
		}else{
			alert("비밀번호를 8자 이상 14자 이하로 입력하세요.");
			document.getElementById("mpw").focus();
			return false;
		}
	}
	
	function updateInfo(){
		
		var mprofile=$("#mprofile").val();
		var mpw=$("#mpw").val();
		var mhp=$("#mhp").val();
		var mnick=$("#mnick").val();
		
		if( !$("#mprofile").val() )   
		{
			 alert( "수정할 [이미지]을 넣어주세요." ); 
			 document.getElementById("mprofile").focus();   
			 return;
		}
		if( !$("#mnick").val() )   
		{
			 alert( " 수정할 [별명]을 적어주세요" ); 
			 document.getElementById("mnick").focus();   
			 return;
		}
		if( !$("#mhp").val() )   
		{
			 alert( "수정할 [휴대전화]를 적어주세요" ); 
			 document.getElementById("mhp").focus();   
			 return;
		}else{
			
			var mhpcheck= /[0-9]/g;
			var mhplang = /^(010)\d{4}\d{4}$/;
			
			if(!mhpcheck.test(document.getElementById("mhp").value)){
				alert("핸드폰 번호 오류 - 숫자를 입력하세요.");
				document.getElementById("mhp").focus();
				return false;
			}
			
			if(!mhplang.test(document.getElementById("mhp").value)){
				alert("핸드폰 번호를 잘못 입력했습니다. 입력양식 : 01000000000");
				document.getElementById("mhp").focus();
				return false;
			}
		}
		
		if( !$("#mpw").val())   
		{
			 alert( "수정할 [비밀번호]를 적어주세요" ); 
			 document.getElementById("mpw").focus();   
			 return false;
		}
		
		if(pwCheck()==false){
		return false;	
		}
		
		alert("mprofile : " + mprofile);
		alert("mpw : " + mpw);
		alert("mhp : " + mhp);
		alert("mnick : " + mnick);
		$.ajax({
			url:"/mypage/memberInfoUpdate.do",
			type:"GET",
			data:{mpw:mpw,
				 mhp:mhp,
				 mprofile:mprofile,
				 mnick:mnick},
			dataType : "text",
			success:function(data){
				console.log("data : " + data);
				if(data=="infocomple"){
					alert("정보 수정을 완료하였습니다.");
					document.updateinfo.action="/mypage/myPage.do";
					document.updateinfo.submit();
				}
				else if(data=="infofail"){
				alert("잘못 입력했습니다. 다시입력하세요.");
				}
				else{
					console.log("data : " + data);
					alert("이상한 오류");
				}
			},
			error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       }
		});
		
	}
	</script>

	<style type="text/css">
		td{
			border: deepskyblue 1.5px solid;
		}
	</style>



	</head>
	<body>
	
		<div class="container">	
		<div style="margn-left:130px">
		
		<h2 align="center"> 정보수정 </h2>
		
		<form name="updateinfo" method="POST" action="/mypage/myPage.do">
		
			<div class="signup-form" id="infoform" align="center">
				<!--
				<div id="img">
				<label class="control-label" style="margin:30px;">이미지 :  </label>
				 
				<img class="img-fluid rounded mb-4 mb-lg-0" src="${mprofile}" width="200px" height="200px" alt="">
				
				 <input class="btn btn-info btn-sm" style="width: 80px; height: 30px; margin:30px" type="button" id="mprofile" name="mprofile"  value="사진 변경"/>
			
				</div>
				 -->
				<br>
				<br>
				<br>
				<br>
				<div class="signup-form" id="nick">
				<label class="control-label">별명 : </label>
				<input type="text" class="form-control" id="mnick" name="mnick" style="width:300px" placeholder="* 한글 10자" value="${memberVO.mnick}"/>
				<input type="button" class="btn btn-info btn-sm" style="width: 80px; height: 30px; margin:10px" id="checknick" name="checknick" value="중복확인" onclick="nickCheck()"/>
				</div>
				<br>
				<br>
				<div class="signup-form" id="hp">
				<label class="control-label">전화번호 : </label>
					<input type="text" class="form-control" id="mhp" name="mhp"  style="width:300px" placeholder="* 예) 01077771111" value="${memberVO.mhp}"/>
				</div>
				<div class="signup-form" id="pw" style="margin:30px;">
				<label class="control-label">변경할 비밀번호 : </label>
					<input type="password" class="form-control" id="mpw" name="mpw" style="width:300px" placeholder="* 소문자 + 특수문자 + 숫자 / 8 ~15자" value="${memberVO.mpw}"/>
				</div>
				<div class="signup-form" id="cpw" style="margin:30px;">
				<label class="control-label">비밀번호 확인 : </label>
					<input type="password" class="form-control" id="checkmpw" name="checkmpw" placeholder="비밀번호와 동일하게 작성하세요." style="width:300px" value=""/> <br>
				</div>
				<div class="signup-form" style="margin:30px;">
					<input type="button" class="btn btn-info btn-sm" style="width: 60px; height: 30px" id="mupdate" name="mupdate" onclick="updateInfo()" value="수정"/>
				</div>
			</div>	
			</form>
			</div>
		</div>
	</body>
</html>