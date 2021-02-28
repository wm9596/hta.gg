<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<c:choose>
<c:when test="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username} eq 'admin'">
<a href="/lol/battingTeam/insert">[관리자]경기입력</a>
</c:when>
<c:when test="${empty sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}">
<h1>로그인하세여</h1>
</c:when>
<c:otherwise>
<a href="/lol/match/list">대회목록</a>
</c:otherwise>
</c:choose>



<h1>
${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}
</h1>
</body>
</html>