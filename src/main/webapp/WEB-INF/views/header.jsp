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
				<div class="row">
					<div class="col-md pl-4 user-dropdown">
						<div class="dropdown">
					    	<a class="navbar-brand dropdown-toggle" href="#" id="bd-versions" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					        	<i class="fas fa-user"></i>
					       	</a>
				          	<div style="position: absolute; left: -35px;">
					          	<div class="dropdown-menu text-center mt-2" style="left: -10px; position: absolute;">
						            <div class="arrow-up"></div>
						            <a href="/lol/member/login">
						            	<button type="button" class="btn btn-warning text-dark">Sign-in now</button>
						            </a>
						            <div class="dropdown-divider"></div>
						            <h6>Don't have an account?</h6>
						            <a href="/lol/member/login">Sign-up here</a>
					      		</div>
					      	</div>
					 	</div>
					</div>
				</div>
			</div>
		</sec:authorize>
		<sec:authorize access="isAuthenticated()">
			<div id="header_msg">
				<span style="color:rgba(255, 255, 255, 0.5);">
					<i class="fa fa-comments" aria-hidden="true" onclick="location.href='/lol/member/member/messageList'"></i><br>
				</span>
			</div>
			<div id="header_mypage">
				<form method="post" action="/lol/member/logout" name="logout">
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
					<span style="color:rgba(255, 255, 255, 0.5);">
						<c:choose>
							<c:when test="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username == 'admin'}">
								<div class="row">
							      <div class="col-md pl-4 user-dropdown">
							        <div class="dropdown">
							        <a class="navbar-brand dropdown-toggle" href="#" id="bd-versions" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							          	<i class="fas fa-user"></i>
							          </a>
							          <div style="position: absolute; left: -35px;">
								          <div class="dropdown-menu text-center mt-2" style="left: -10px; position: absolute;">
								            <div class="arrow-up"></div>
								            <h6><sec:authentication property="principal.username"/> 님</h6>
								            <a href="/lol/member/admin/memberList">
								              <button type="button" class="btn btn-warning text-dark">AdminPage</button>
								            </a>
								            <div class="dropdown-divider"></div>
								            <a href="#" onclick="javascript:document.logout.submit();">logout</a>
								          </div>
								      </div>
							    	</div>
							      </div>
							    </div>
							</c:when>
							<c:otherwise>
							    <div class="row">
							      <div class="col-md pl-4 user-dropdown">
							        <div class="dropdown">
							          <a class="navbar-brand dropdown-toggle" href="#" id="bd-versions" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							          	<i class="fas fa-user"></i>
							          </a>
							          <div style="position: absolute; left: -35px;">
								          <div class="dropdown-menu text-center mt-2" style="left: -10px; position: absolute;">
								            <div class="arrow-up"></div>
								            <h6><sec:authentication property="principal.username"/> 님</h6>
								            <a href="/lol/member/member/info">
								              <button type="button" class="btn btn-warning text-dark">MyPage</button>
								            </a>
								            <div class="dropdown-divider"></div>
								            <a href="#" onclick="javascript:document.logout.submit();">logout</a>
								          </div>
								      </div>
							        </div>
							      </div>
							    </div>
							</c:otherwise>
						</c:choose>
					</span>
				</form>
			</div>
		</sec:authorize>
	</div>