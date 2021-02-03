<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/join.jsp</title>
<script type="text/javascript" src="/lol/resources/js/jquery-3.5.1.js"></script>
</head>
<body>
<h1>회원가입</h1>
<form:form method="post" action="/lol/member/join">
	아이디<br>
	<input type="text" name="username" id="id" onkeyup="checkId()">&nbsp;&nbsp;<button>중복확인</button><span id="idcheck">아이디를 입력하세요.</span><br>
	비밀번호<br>
	<input type="password" name="password" id="pwd" onkeyup="checkPwd()">&nbsp;&nbsp;<span id="pwdcheck"></span><br>
	비밀번호확인<br>
	<input type="password" id="pwdOk" onkeyup="checkPwdOk()">&nbsp;&nbsp;<span id="pwdOkcheck"></span><br>
	이메일<br>
	<input type="email" name="email" id="email">&nbsp;&nbsp;<button>이메일인증</button>&nbsp;&nbsp;<span id="emailcheck"></span><br>
	커뮤니티 닉네임<br>
	<input type="text" name="nickname" id="nickname" onkeyup="checkNick()">&nbsp;&nbsp;<span id="nicknamecheck">닉네임을 입력하세요</span><br>
	<input type="submit" value="등록">
</form:form>


<script type="text/javascript">
function checkId(){
	var id = document.getElementById("id").value;
	if(id.trim()==""){
		document.getElementById("idcheck").innerHTML="아이디를 입력하세요.";
		return;
	}
	
	if(id.length<4 || id.length>10){
		document.getElementById("idcheck").innerHTML="아이디는 4~10자리로 설정해주세요.";
		return;
	}else if(id.length>=4 && id.length<=10){
		$.ajax({
			url:"/lol/member/idCheck/"+id,
			success: function(data){
				var span = document.getElementById("idcheck");
				var using = $(data).find("using").text();
				if(eval(using)==true){
					span.innerHTML="이미 사용중인 아이디입니다.";
				}else if(using=='false'){
					span.innerHTML="사용 가능 한 아이디입니다.";
				}
			}
		});
		document.getElementById("idcheck").innerHTML="";
	}
	
	for(let i=0; i<id.length; i++){
		if(!(('0'<=id.charAt(i) && id.charAt(i)<='9') || ('a'<=id.charAt(i) && id.charAt(i)<='z') || ('A'<=id.charAt(i) && id.charAt(i)<='Z'))){
			document.getElementById("idcheck").innerHTML="아이디는 영문과 숫자로만 입력해주세요...";
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
</script>
</body>
</html>