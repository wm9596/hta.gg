<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/join.jsp</title>
<script type="text/javascript">
	function checkId(){
		var id = document.get
	}
</script>
</head>
<body>
<h1>회원가입</h1>
<form method="post" action="<%=request.getContextPath()%>/member/join">
	아이디<br>
	<input type="text" name="username" id="id" onkeyup="checkId()">&nbsp;&nbsp;<span id="idcheck"></span><br>
	비밀번호<br>
	<input type="password" name="password" id="pwd" onkeyup="checkPwd()">&nbsp;&nbsp;<span id="pwdcheck"></span><br>
	비밀번호확인<br>
	<input type="password" id="passwordOk" onkeyup="checkPwdOk()">&nbsp;&nbsp;<span id="pwdOkcheck"></span><br>
	이메일<br>
	<input type="email" name="email" id="pwd">&nbsp;&nbsp;<button>이메일인증</button>&nbsp;&nbsp;<span id="emailcheck"></span><br>
	커뮤니티 닉네임<br>
	<input type="text" name="nickname" id="nickname">&nbsp;&nbsp;<span id="nicknamecheck"></span><br>
	<input type="submit" value="등록">
</form>
</body>
</html>