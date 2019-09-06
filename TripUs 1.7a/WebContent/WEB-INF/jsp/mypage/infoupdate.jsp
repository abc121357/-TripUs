<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>tripUs</title>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
		
	<script type="text/javascript">
	
	function info(){
		
		var profile=$("#mprofile").val();
		var mpw=$("#mpw").val();
		var mhp=$("#mhp").val();
		var mnick=$("#mnick").val();
		alert("mprofile : " + profile);
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
				if(data=="ture"){
					alert("로그인 성공. 메인페이지로 이동");
					document.updateinfo.action="/mypage/myPage.do";
					document.updateinfo.submit();
				}
				else if(data=="false"){
				alert("잘못 입력했습니다. 다시입력하세요.");
				}
				else{
					alert("이상한 오류");
				}
			},
			error:function(data){
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
	마이페이지-정보수정입니다.
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
			<input type="text" id="mprofile" name="mprofile" value="${memberVO.mprofile}"/>
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
		<td>
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
		</td>
	</tr>
	<tr>
		<td colspan="2" align="right">
			<input type="button" id="mupdate" name="mupdate" onclick="info()" value="입력"/>
		</td>
	</tr>

	
	</table>
	</form>
	
	</body>
</html>