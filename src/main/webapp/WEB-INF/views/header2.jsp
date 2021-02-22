<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div id="header_left">
		<img alt="" src="${pageContext.request.contextPath }/resources/images/hta.PNG" width="40" height="40">
	</div>
	<div id="header_center">
		<form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
			<div class="input-group">
				<input class="form-control" type="text" placeholder="Search for..." name='sName' aria-label="Search" aria-describedby="basic-addon2" />
				<div class="input-group-append">
					<button class="btn btn-primary" type="button"><i class="fa fa-search" aria-hidden="true"></i></button>
				</div>
			</div>
        </form>		
	</div>
	<div id="header_right">
		<div id="header_none">
		</div>
		
		<sec:authorize access="isAnonymous()">
			<div id="header_msg">
				<span style="color:rgba(255, 255, 255, 0.5);">
					<i class="fa fa-comments-o" aria-hidden="true" onclick="location.href='/lol/member/login'"></i><br>
				</span>
			</div>
			<div id="header_mypage">
				<span style="color:rgba(255, 255, 255, 0.5);">
					<i class="fa fa-user-circle-o" aria-hidden="true" onclick="location.href='/lol/member/login'"></i><br>
					<a href="/lol/member/login" style="color:rgba(255, 255, 255, 0.5);">login</a>
				</span>
			</div>
		</sec:authorize>
		<sec:authorize access="isAuthenticated()">
			<div id="header_msg">
				<span style="color:rgba(255, 255, 255, 0.5);">
					<i class="fa fa-comments-o" aria-hidden="true"></i><br>
					<sec:authentication property="principal.username"/>님
				</span>
			</div>
			<div id="header_mypage">
				<form method="post" action="/lol/member/logout" name="logout">
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
					<span style="color:rgba(255, 255, 255, 0.5);">
						<c:choose>
							<c:when test="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username == 'admin'}">
								<i class="fa fa-user-circle-o" aria-hidden="true" onclick="location.href='/lol/member/admin/memberList'"></i><br>
								<a href="#" onclick="javascript:document.logout.submit();" style="color:rgba(255, 255, 255, 0.5);">logout</a>		
							</c:when>
							<c:otherwise>
								<i class="fa fa-user-circle-o" aria-hidden="true" onclick="location.href='/lol/member/member/info'"></i><br>
								<a href="#" onclick="javascript:document.logout.submit();" style="color:rgba(255, 255, 255, 0.5);">logout</a>
							</c:otherwise>
						</c:choose>
					</span>
				</form>
			</div>
		</sec:authorize>
	</div>
	<div id="sub_header">
		<div></div>
		<div id="sub_header_center">
			<div class="menu"><a href="#">챔피언</a></div>
			<div class="menu"><a href="#">아이템</a></div>
			<div class="menu"><a href="${pageContext.request.contextPath }/community/list">커뮤니티</a></div>
		</div>
		<div></div>
	</div>
	
<script type="text/javascript">

var isError = <c:out value="${not empty isError}"/>;

$(function(){
	var input = $(".form-control");
	var form = $(".form-inline");
	
	if(isError){
		alert("존재하지 않는 아이디 입니다");
	}

	input.keydown(function(e) {
		e.preventDefault();
		if(e.keyCode===13){
			search(form,input);
		}
	})
	
	var btn = $(".btn-primary");
	btn.click(function(e){
		e.preventDefault();
		search(form,input);
	});
})

function search(form,input){
	
	if(input.val().length<1 || input.val()==''){
		alert("아이디를 입력해주세요");
		return;
	}
	
	form.attr('method','get');
	form.attr('action','/lol/match/search');
	
// 	form.append($("<input>",{type:'hidden',name:'sName',value:input.val()}));
	
// 	form.appendTo('body');
	
	form.submit();
}
</script>
	
	
