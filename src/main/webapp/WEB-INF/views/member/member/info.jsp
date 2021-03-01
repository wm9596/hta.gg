<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h3 style="text-align: center; padding-top: 70px;">내 정보</h3><br>
<form method="post" action="${pageContext.request.contextPath}/member/update" style="text-align: center;">
	<label style="width: 100px;">닉네임</label>
	<input type="text" name="nickname" value="${vo.nickname}" style="width: 300px; padding: 0px; display: inline-block;" class="form-control"><br><br>
	<label style="width: 100px;">비밀번호 </label>
	<input type="password" name="password" style="width: 300px; padding: 0px; display: inline-block;" class="form-control"><br><br>
	<label style="width: 100px;">이메일 </label>
	<input type="email" name="email" value="${vo.email}" style="width: 300px; padding: 0px; display: inline-block;" class="form-control"><br><br>
	<label style="width: 100px;">누적 포인트</label>
	<input type="text" style="width: 300px; padding: 0px; display: inline-block;" value="${vo.point }" disabled="disabled" class="form-control">
	<input type="hidden" name="username" value="${vo.username}">
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"><br><br>
	<input type="submit" value="수정" style="width: 300px;" class="btn btn-primary btn-lg active">
</form>