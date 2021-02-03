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
<form method="post" action="<%=request.getContextPath()%>/member/login">
	아이디<br>
	<input type="text" name="id"><br>
	비밀번호<br>
	<input type="password" name="pwd"><br>
	<input type="submit" value="로그인">
</form>
</body>
</html>