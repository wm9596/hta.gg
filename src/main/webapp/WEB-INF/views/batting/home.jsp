<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="/lol/battingTeam/insert">[관리자]경기입력</a>
<a href="/lol/match/list">대회목록</a>
<h1>
${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username};
</h1>
</body>
</html>