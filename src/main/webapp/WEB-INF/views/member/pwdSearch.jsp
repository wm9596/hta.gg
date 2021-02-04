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
<h1>비밀번호 찾기</h1>
아이디<br>
<input type="text" name="id" id="id" style="width: 300px;"><br>
이메일<br>
<input type="email" name="email" id="email" style="width: 300px;"><br>
<input type="button" id="emailOk" onclick="emailOk()" value="이메일인증" style="width: 308px;"><br>
인증번호<br>
<input type="text" name="confirm" id="confirm" style="width: 300px;"><br>
<input type="button" id="searchId" onclick="searchPwd()" value="임시 비밀번호 전송" style="width: 308px;"><br>
<span id="confirmPwd"></span><br>
<input type="button" value="뒤로가기" onclick="backPage()" style="width: 308px;">
</body>
</html>