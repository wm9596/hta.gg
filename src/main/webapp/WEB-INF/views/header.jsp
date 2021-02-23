<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script> 

	<div id="header_left">
		<img alt="" src="${pageContext.request.contextPath }/resources/images/hta.PNG" width="40" height="40">
	</div>
	<div id="header_center">
		<div class="menu"><a href="#">챔피언</a></div>
		<div class="menu"><a href="${pageContext.request.contextPath }/itemlist">아이템</a></div>
		<div class="menu"><a href="${pageContext.request.contextPath }/community/list">커뮤니티</a></div>
	</div>
	<div id="header_right">
		<div id="header_none">
		</div>
		
		<sec:authorize access="isAnonymous()">
			<div id="header_msg">
				<span style="color:rgba(255, 255, 255, 0.5);">
					<i class="far fa-comments" aria-hidden="true" onclick="location.href='/lol/member/login'"></i><br>
				</span>
			</div>
			<div id="header_mypage">
				<span style="color:rgba(255, 255, 255, 0.5);">
					<i class="fa fa-user-circle" aria-hidden="true" onclick="location.href='/lol/member/login'"></i><br>
					<a href="/lol/member/login" style="color:rgba(255, 255, 255, 0.5);">login</a>
				</span>
			</div>
		</sec:authorize>
		<sec:authorize access="isAuthenticated()">
			<div id="header_msg">
				<span style="color:rgba(255, 255, 255, 0.5);">
					<i class="fa fa-comments" aria-hidden="true" onclick="location.href='/lol/member/member/messageList'"></i><br>
					<sec:authentication property="principal.username"/>님
				</span>
			</div>
			<div id="header_mypage">
				<form method="post" action="/lol/member/logout" name="logout">
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
					<span style="color:rgba(255, 255, 255, 0.5);">
						<c:choose>
							<c:when test="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username == 'admin'}">
								<i class="fa fa-user-circle" aria-hidden="true" onclick="location.href='/lol/member/admin/memberList'"></i><br>
								<a href="#" onclick="javascript:document.logout.submit();" style="color:rgba(255, 255, 255, 0.5);">logout</a>		
							</c:when>
							<c:otherwise>
								<i class="fa fa-user-circle" aria-hidden="true" onclick="location.href='/lol/member/member/info'"></i><br>
								<a href="#" onclick="javascript:document.logout.submit();" style="color:rgba(255, 255, 255, 0.5);">logout</a>
							</c:otherwise>
						</c:choose>
					</span>
				</form>
			</div>
		</sec:authorize>
	</div>