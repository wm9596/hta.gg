<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
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
function checkPwd(){
	var pwd = document.getElementById("pwd").value;
	if(pwd.trim()==""){
		document.getElementById("pwdcheck").innerHTML="동일한 비밀번호 사용시 원래 비밀번호 입력해주세요.";
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

$(document).ready(function(){
	$("#infoChange").click(function (e) {
		if(document.getElementById("nicknamecheck").textContent != ""){
			alert("닉네임 설정 조건에 맞게 다시 입력해 주세요.(4~12자리)");
			e.preventDefault();
		}else if(document.getElementById("pwdcheck").textContent != ""){
			alert("비밀번호 설정 조건에 맞게 다시 입력해 주세요.(영문/숫자 4~10자리)");
			e.preventDefault();
		}else{
			alert("회원정보가 변경 되었습니다.");
		}
	});
});
</script>
<h3 style="text-align: center; padding-top: 70px;">내 정보</h3><br>
<form method="post" action="${pageContext.request.contextPath}/member/update" style="text-align: center;">
	<label style="width: 100px;">닉네임</label>
	<input type="text" name="nickname" id="nickname" value="${vo.nickname}" style="width: 300px; padding: 0px; display: inline-block;" class="form-control" required autofocus="" onkeyup="checkNick()"><br>
	<span id="nicknamecheck"></span><br>
	<label style="width: 100px;">비밀번호 </label>
	<input type="password" name="password" id="pwd" style="width: 300px; padding: 0px; display: inline-block;" class="form-control" onkeyup="checkPwd()" placeholder="비밀번호" required autofocus=""><br>
	<span id="pwdcheck" style="color: red;">동일한 비밀번호 사용시 원래 비밀번호 입력해주세요.</span><br>
	<label style="width: 100px;">이메일 </label>
	<input type="email" name="email" value="${vo.email}" style="width: 300px; padding: 0px; display: inline-block;" class="form-control"><br><br>
	<label style="width: 100px;">누적 포인트</label>
	<input type="text" style="width: 300px; padding: 0px; display: inline-block;" value="${vo.point }" disabled="disabled" class="form-control">
	<input type="hidden" name="username" value="${vo.username}">
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"><br><br>
	<input type="submit" value="수정" style="width: 300px;" class="btn btn-primary btn-lg active" id="infoChange">
</form>