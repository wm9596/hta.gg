<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/join.jsp</title>
</head>
<body>
<h1>회원가입</h1>
<form method="post" action="<%=request.getContextPath()%>/member/join">
	아이디<br>
	<input type="text" name="username"><br>
	비밀번호<br>
	<input type="password" name="password"><br>
	이메일<br>
	<input type="text" name="email">&nbsp;&nbsp;<button>이메일인증</button><br>
	커뮤니티 닉네임<br>
	<input type="text" name="nickname"><br>
	<input type="submit" value="등록">
</form>
</body>
</html>