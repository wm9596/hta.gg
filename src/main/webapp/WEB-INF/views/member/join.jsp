<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/join.jsp</title>
<script type="text/javascript" src="/lol/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var span = document.getElementById("idcheck");
	$("#emailOk").click(function(){
		var id = document.getElementById("id").value;
		var email = document.getElementById("email").value;
		email = email.substr(0,email.lastIndexOf("."));
		//console.log(email);
		if(document.getElementById("idcheck").textContent != "사용 가능 한 아이디입니다."){
			alert("아이디 중복 확인을 완료해주세요.");
		}else{
			$.ajax({
				url:"/lol/member/email/"+id+"/"+email,
				success: function(data){
					var result = $(data).find("result").text();
					console.log(result);
					if(result == 'success'){
						document.getElementById("emailcheck").innerHTML="인증번호 전송이 완료되었습니다.";
					}else{
						document.getElementById("emailcheck").innerHTML="인증번호 전송이 실패되었습니다.";
					}
				}
			});
		}
	});
	
	$("#confirmOk").click(function(){
		var id = document.getElementById("id").value;
		var email = document.getElementById("email").value;
		email = email.substr(0,email.lastIndexOf("."));
		//console.log(email);
		if(document.getElementById("emailcheck").textContent != "인증번호 전송이 완료되었습니다."){
			alert("이메일 입력 후 이메일 인증 버튼을 클릭해 주세요!!!");
		}else{
			$.ajax({
				url:"/lol/member/code/"+id,
				dataType:'xml',
				success: function(data){
					var code = $(data).find("code").text();
					if(code == document.getElementById("confirm").value){
						document.getElementById("confirmcheck").innerHTML="이메일 인증 완료!!!";
					}else{
						document.getElementById("confirmcheck").innerHTML="이메일 인증 실패!!!";
					}
				}
			});
		}
	});
	
	$("#idOk").click(function(){
		var id = document.getElementById("id").value;
		$.ajax({
			url:"/lol/member/idCheck/"+id,
			success: function(data){
				var using = $(data).find("using").text();
				if(eval(using)==true){
					span.innerHTML="이미 사용중인 아이디입니다.";
					document.getElementById("emailOk").disabled = 'true';
				}else if(using=='false'){
					span.innerHTML="사용 가능 한 아이디입니다.";
					document.getElementById("emailOk").disabled = false;
				}
			}
		});
	});
});

function checkId(){
	var id = document.getElementById("id").value;
	var span = document.getElementById("idcheck");
	if(id.trim()==""){
		span.innerHTML="아이디를 입력하세요.";
		document.getElementById("idOk").disabled = 'true';
		return;
	}
	
	if(id.length<4 || id.length>10){
		span.innerHTML="아이디는 4~10자리로 설정해주세요.";
		document.getElementById("idOk").disabled = 'true';
		return;
	}else if(id.length>=4 && id.length<=10){
		span.innerHTML="";
		document.getElementById("idOk").disabled = false;
	}
	
	for(let i=0; i<id.length; i++){
		if(!(('0'<=id.charAt(i) && id.charAt(i)<='9') || ('a'<=id.charAt(i) && id.charAt(i)<='z') || ('A'<=id.charAt(i) && id.charAt(i)<='Z'))){
			span.innerHTML="아이디는 영문과 숫자로만 입력해주세요...";
			document.getElementById("idOk").disabled = 'true';
			return;
		}
	}
}	

function checkPwd(){
	var pwd = document.getElementById("pwd").value;
	if(pwd.trim()==""){
		document.getElementById("pwdcheck").innerHTML="비밀번호를 입력하세요.";
		return;
	}
	
	if(pwd.length<4 || pwd.length>10){
		document.getElementById("pwdcheck").innerHTML="비밀번호는 4~10자리로 설정해주세요.";
		return;
	}else if(pwd.length>=4 && pwd.length<=10){
		document.getElementById("pwdcheck").innerHTML="";
	}
	
	for(let i=0; i<pwd.length; i++){
		if(!(('0'<=pwd.charAt(i) && pwd.charAt(i)<='9') || ('a'<=pwd.charAt(i) && pwd.charAt(i)<='z') || ('A'<=pwd.charAt(i) && pwd.charAt(i)<='Z'))){
			document.getElementById("pwdcheck").innerHTML="아이디는 영문과 숫자로만 입력해주세요...";
			return;
		}
	}
}

function checkPwdOk(){
	var pwd1 = document.getElementById("pwd").value;
	var pwd2 = document.getElementById("pwdOk").value;
	if(pwd1!=pwd2){
		document.getElementById("pwdOkcheck").innerHTML="비밀번호가 일치 하지않아요..."
		return;
	}else{
		document.getElementById("pwdOkcheck").innerHTML="비밀번호가 일치해요"
			return;
	}
}

function checkNick(){
	var nickname = document.getElementById("nickname").value;
	if(nickname.trim()==""){
		document.getElementById("nicknamecheck").innerHTML="닉네임을 입력하세요.";
		return;
	}
	
	if(nickname.length<4 || nickname.length>12){
		document.getElementById("nicknamecheck").innerHTML="닉네임은 4~12자리로 설정해주세요.";
		return;
	}else if(nickname.length>=4 && nickname.length<=12){
		document.getElementById("nicknamecheck").innerHTML="";
	}
}

function backPage(){
	history.go(-1);
}
</script>
</head>
<body>
<div id="main">
	<h1 style="text-align: center;">회원가입</h1>
	<div style="padding-left: 300px;">
		<form:form method="post" action="/lol/member/join">
			<label style="width: 130px;">아이디</label>
			<input type="text" name="username" id="id" onkeyup="checkId()">&nbsp;&nbsp;
			<input type="button" id="idOk" value="중복확인" disabled="disabled">
			<span id="idcheck">아이디를 입력하세요.</span><br>
			<label style="width: 130px;">비밀번호</label>
			<input type="password" name="password" id="pwd" onkeyup="checkPwd()">&nbsp;&nbsp;
			<span id="pwdcheck"></span><br>
			<label style="width: 130px;">비밀번호확인</label>
			<input type="password" id="pwdOk" onkeyup="checkPwdOk()">&nbsp;&nbsp;
			<span id="pwdOkcheck"></span><br>
			<label style="width: 130px;">이메일</label>
			<input type="email" name="email" id="email">&nbsp;&nbsp;
			<input type="button" id="emailOk" value="이메일인증" disabled="disabled">&nbsp;&nbsp;
			<span id="emailcheck"></span><br>
			<label style="width: 130px;">이메일 인증번호</label>
			<input type="text" name="confirm" id="confirm">&nbsp;&nbsp;
			<input type="button" id="confirmOk" value="확인">&nbsp;&nbsp;
			<span id="confirmcheck"></span><br>
			<label style="width: 130px;">커뮤니티 닉네임</label>
			<input type="text" name="nickname" id="nickname" onkeyup="checkNick()">&nbsp;&nbsp;
			<span id="nicknamecheck">닉네임을 입력하세요</span><br>
			<input type="submit" value="등록" style="width: 200px; margin-left: 25px;">
			<input type="button" value="뒤로가기" onclick="backPage()" style="width: 200px;">
		</form:form>
	</div>
</div>
</body>
</html>