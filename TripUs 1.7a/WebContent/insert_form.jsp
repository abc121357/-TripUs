<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.6.4.js"></script>
<script type="text/javascript">
	
	//[인증번호 전송] 클릭시
	function emailCheck(){
		alert("[인증번호 전송] >>> ");
		var memail = $('#memail').val();
		console.log(" insert_form.jsp memail >>> " + memail);
		$.ajax({
			url:"/signup/emailCheck.do",
			type:"GET",
			data: {memail:memail},
			dataType : "text",
			success:function(data){
				console.log("data : " + data);
				if(data=="false"){
					alert("중복이메일입니다. 이메일을 다시 입력하세요");
					document.signupform.memail.value="";
					document.signupform.memail.focus();
				}else{
					alert("사용가능한 이메일입니다. 인증절차를 완료해주세요");
					//document.signupform.memail.ck.value="인증번호 재전송";
					document.signupform.number.value=data;
					window.open('',"_blank","width=370,height=360, resizable=no, scrollbars=no, status=no");
					document.signupform.action="/signup/goTestMail.do";
					document.signupform.target="_blank";
					document.signupform.submit();
				}
			},
			error:function(data){
				console.log("에러발생");	
				
			}
		});
	}// end of emailCheck() function
	
	function numCheck(){ // [인증번호 확인] 클릭시
		var num = document.
		signupform.number.value;
		console.log("인증번호 확인 버튼 클릭 > number >>> " + num);
		var input = document.signupform.num.value;
		console.log("입력한 인증번호 >>> " + input);
		if(num===input){
			console.log("인증 성공  !! ");
			alert("이메일 인증에 성공하였습니다 !");
			document.signupform.nextOK.value="인증 성공";
			return;			
		}else{
			console.log("인증 실패 >>>");
			alert("인증번호가 일치하지 않습니다.");
			return;
		}
	}// end of numCheck() function
	
	function formCheckFun() {
		// 성별
		var checked_radio = $('input:radio[name=mgender]:checked').val();
		if(checked_radio === undefined && ""){
			alert('성별을 선택 해주세요');
			document.getElementById("mgender").focus();
			return false;
		}else{
			alert("선택된 성별은 >>> " + checked_radio);	
			document.signupform.mgender.value = checked_radio;
		};
		
		alert("회원가입 insert합니다.");
		
		$('#signupform').attr("action", "/signup/insertMember.do");
		$('#signupform').submit();
	};
</script>
</head>
<body>
	<p></p>
	<div>
		<form id="signupform" name="signupform" method="post">
			<%--<input type="hidden" id="mno" name="mno" value="${memberVO.mno}" />--%>
			<table border="1">
				<thead>
					<tr>
						<td colspan="2" align="center">
							<h4>회원가입</h4>
						</td>
					</tr>
				</thead>
				<tbody>
					<%-- 회원번호 채번으로 받아서 해당 <tr>은 없어질 예정 --%>
					<tr>
						<th>회원번호</th>
						<td><input type="text" id="mno" name="mno"
							value="${memberVO.mno}" /></td>
					</tr>
					<tr>
						<th><span class="required">*</span>아이디</th>
						<td>
							<input type="text" id="mid" name="mid" value="${memberVO.mid}" />
							<input type="button" id="idcheck" name="idcheck" value="중복확인" onclick="idCheckFun()"/>
						</td>
					</tr>
					<tr>
						<th><span class="required">*</span>비밀번호</th>
						<td>
							<input type="password" id="mpw" name="mpw" value="${memberVO.mpw}" /><br>
						</td>
					</tr>
					<tr>
						<th><span class="required">*</span>비밀번호 확인</th>
						<td>
							<input type="password" id="mpw_r" name="mpw_r" />
							<input type="button" id="pwcheck" name="pwcheck" value="재확인" onclick="pwCheckFun()"/>
						</td>
					</tr>
					<tr>
						<th><span class="required">*</span>이름</th>
						<td><input type="text" id="mname" name="mname"
							value="${memberVO.mname}" /></td>
					</tr>
					<tr>
						<th><span class="required">*</span>별명</th>
						<td><input type="text" id="mnick" name="mnick"
							value="${memberVO.mnick}" /></td>
					</tr>
					<tr>
						<th><span class="required">*</span>성별</th>
						<td>
							<%--<input type="text" id="mgender" name="mgender" value="${memberVO.mgender}" />--%>
							<input type="radio" id="mgender" name="mgender" value="F"> 여성 <input type="radio" id="mgender" name="mgender" value="M"> 남성
						</td>
					</tr>
					<tr>
						<th><span class="required">*</span>전화번호</th>
						<td><input type="text" id="mhp" name="mhp"
							value="${memberVO.mhp}" /></td>
					</tr>
					<tr>
						<th><span class="required">*</span>이메일</th>
						<td>
							<input type="text" id="memail" name="memail" value="${memberVO.memail}" />
							<input type="hidden" id="number" name="number"/>
							<%--<input type="text" id="email1" name="email1" />&nbsp;@
							<input type="text" id="email2" name="email2" />--%>	
							<button type="button" id="send_email" onclick="emailCheck()" id="ck">인증번호 전송</button>					
						</td>
					</tr>
					<tr>
						<th><span class="required"></span>인증번호</th>
						<td>
							<input type="text" id="num" name="num" />
							<input type="button" value="인증번호 확인" onclick="numCheck()" />
						</td>
					</tr>
					<tr>
						<th><span class="required">*</span>생년월일</th>
						<td>
							<input type="text" id="mbirth" name="mbirth" value="${memberVO.mbirth}" />
									
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<div>
		<p></p>
		<table border="0">
			<tr align="center">
				<td>
					<input type="button" id="formcheck" value="등록" onclick="formCheckFun()" />
					<input type="hidden" id="nextOK"/>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>