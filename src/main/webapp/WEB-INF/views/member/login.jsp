<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>views/login.jsp</title>
</head>
<body>
<h1>회원로그인</h1>
<form method="post" action="lol/member/login">
	아이디<br>
	<input type="text" name="id" style="width: 300px;"><br>
	비밀번호<br>
	<input type="password" name="pwd" style="width: 300px;"><br>
	<input type="submit" value="로그인" style="width: 308px;"><br>
	<input type="checkbox" name="remember" value="">아이디 저장&nbsp;&nbsp;&nbsp;
	<input type="checkbox" name="auto" value="">자동로그인<br>
	<input type="button" value="아이디 찾기" id="seachId" onclick="location.href =  '/lol/member/id';">&nbsp;
	<input type="button" value="비밀번호 찾기" id="seachPwd" onclick="location.href =  '/lol/member/pwd';">&nbsp;
	<input type="button" value="회원가입" id="join" onclick="location.href =  '/lol/member/join';">
</form>
</body>
</html>