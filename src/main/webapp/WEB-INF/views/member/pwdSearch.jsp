<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript" src="/lol/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript">
$(function(){ 
	$("#emailOk").click(function () {
		var id = document.getElementById("id").value;
		var email = document.getElementById("email").value;
		email = email.substr(0,email.lastIndexOf("."));
		$.ajax({
			url:"/lol/member/emailCheck/"+id+"/"+email,
			success: function(data){
				var using = $(data).find("using").text();
				if(eval(using)==true){
					$.ajax({
						url:"/lol/member/pwdSearch/"+id+"/"+email,
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
				}else if(using=='false'){
					document.getElementById("emailcheck").innerHTML="등록되지 않은 이메일입니다. 회원가입 해주세요."
				}
			}
		});
	});
	
	$("#searchPwd").click(function(){
		var id = document.getElementById("id").value;
		if(document.getElementById("emailcheck").textContent != "인증번호 전송이 완료되었습니다."){
			alert("이메일 입력 후 이메일 인증 버튼을 클릭해 주세요!!!");
		}else{
			$.ajax({
				url:"/lol/member/code/"+id,
				dataType:'xml',
				success: function(data){
					var code = $(data).find("code").text();
					if(code == document.getElementById("confirm").value){
						document.getElementById("confirmPwd").innerHTML="이메일 인증 완료!!!";
						document.getElementById("pwdChange").disabled = false;
					}else{
						document.getElementById("confirmPwd").innerHTML="이메일 인증 실패!!! 인증번호를 확인해주세요.";
					}
				}
			});
		}
	});
});

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

function backPage(){
	history.go(-1);
}
</script>

<div id="main_home">
	<h1>비밀번호 찾기/변경</h1>
	<form:form method="post" action="/lol/member/pwdChange" style="line-height: 200%">
		아이디<br>
		<input type="text" name="username" id="id" style="width: 300px;"><br>
		이메일<br>
		<input type="email" id="email" style="width: 300px;"><br>
		<input type="button" id="emailOk" value="이메일인증" style="width: 300px;"><br>
		<span id="emailcheck"></span><br>
		인증번호<br>
		<input type="text" id="confirm" style="width: 300px;"><br>
		<input type="button" id="searchPwd" value="인증번호 확인" style="width: 300px;"><br>
		<span id="confirmPwd"></span><br>
		변경할 비밀번호<br>
		<input type="password" name="password" id="pwd" onkeyup="checkPwd()" style="width: 300px;"><br>
		<span id="pwdcheck"></span><br>
		<input type="submit" id="pwdChange" value="비밀번호 변경" style="width: 150px;" disabled="disabled">
		<input type="button" value="뒤로가기" onclick="backPage()" style="width: 150px;">
	</form:form>
</div>
