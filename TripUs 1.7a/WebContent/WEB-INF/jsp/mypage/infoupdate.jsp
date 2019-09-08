<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>tripUs</title>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
		
	<script type="text/javascript">
	


	function pwCheck(){
		alert(" pwCheck 함수 진입");
		var mpw = document.getElementById("mpw");
		var checkmpw = document.getElementById("checkmpw");
		if(mpw.value.length>7&&mpw.value.length<15){
			if(mpw.value == checkmpw.value) {
				alert("비밀번호가 같습니다.");
				
				document.getElementById("checkmpw").focus();
				
				return true;
			} else {
				alert("비밀번호가 다릅니다.");
				mpw.value = "";
				checkmpw.value = "";
				mpw.focus();
				
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
			
			var mhpcheck= /[^0-9]/g;
			var mhplang = /^\d{3}\\d{4}\\d{4}$/;
			
			if(!mhpcheck.test(document.getElementById("mhp").value)){
				alert("핸드폰 번호 오류 - 숫자를 입력하세요.");
				document.getElementById("mhp").focus();
				return false;
			}
			
			if(!mhplang.test(document.getElementById("mhp").value)){
				alert("핸드폰 번호 오류 - 01000000000");
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
				if(data=="내 정보 수정 완료"){
					alert("수정 성공. 메인페이지로 이동");
					document.updateinfo.action="/mypage/myPage.do";
					document.updateinfo.submit();
				}
				else if(data=="내 정보 수정 실패"){
				alert("잘못 입력했습니다. 다시입력하세요.");
				}
				else{
					console.log("data : " + data);
					alert("이상한 오류");
				}
			},
			error:function(data){
				console.log("data : " + data);
				alert("오류발생");
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
	<form name="updateinfo" method="POST" action="/mypage/myPage.do">
	<table align="center">
	<tr>
	<td colspan="2">
	<p align="center" style="font-style: oblique;"> 정보수정 </p>
	</td>
	</tr>
	<tr>
		<td>
			이미지 :
		</td>
		<td>
			<input type="text" id="mprofile" name="mprofile"  value="${memberVO.mprofile}"/>
		</td>
	</tr>
	<tr>
		
		<td>
			별명 :
		</td>
		<td>
		<input type="text" id="mnick" name="mnick" value="${memberVO.mnick}"/>
		</td>
	</tr>
	<tr>
		<td>
			휴대전화 :
		</td>
		<td class="member">
			<input type="text" id="mhp" name="mhp" value="${memberVO.mhp}"/>
		</td>
	</tr>
		<tr>
		<td>
			변경할 비밀번호 :
		</td>
		<td>
			<input type="password" id="mpw" name="mpw" value="${memberVO.mpw}"/>
		</td>
	</tr>
	<tr>
		<td>
		비밀번호 확인 :
		</td>
		<td>
			<input type="password" id="checkmpw" name="checkmpw" value=""/>
			<input type="button" value="비밀번호확인" onclick="pwCheck()"/><br/>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="right">
			<input type="button" id="mupdate" name="mupdate" onclick="updateInfo()" value="입력"/>
		</td>
	</tr>

	
	</table>
	</form>
	
	</body>
</html>