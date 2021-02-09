<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/pwdSearch.jsp</title>
<script type="text/javascript">
function backPage(){
	history.go(-1);
}
</script>
</head>
<body>
<div id="main_home">
	<h1>비밀번호 찾기/변경</h1>
	아이디<br>
	<input type="text" name="id" id="id" style="width: 300px;"><br>
	이메일<br>
	<input type="email" name="email" id="email" style="width: 300px;"><br>
	<input type="button" id="emailOk" onclick="emailOk()" value="이메일인증" style="width: 300px;"><br>
	인증번호<br>
	<input type="text" name="confirm" id="confirm" style="width: 300px;"><br>
	<input type="button" id="searchId" onclick="searchPwd()" value="인증번호 확인" style="width: 300px;"><br>
	<span id="confirmPwd"></span><br>
	<input type="button" value="뒤로가기" onclick="backPage()" style="width: 300px;">
</div>
</body>
</html>