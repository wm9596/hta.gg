<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<h1>회원 메인 페이지입니다.....</h1>
<a href="/lol/">홈</a>

<sec:authorize access="isAuthenticated()">
	<li>
		<sec:authentication property="principal.username"/>
		<a href="#" onclick="javascript:document.logout.submit();">로그아웃</a>
		<form method="post" action="/lol/member/logout" name="logout">
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
			<!-- <input type="submit" value="로그아웃"> -->
		</form>
	</li>
</sec:authorize>