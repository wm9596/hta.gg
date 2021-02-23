<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<h1 style="text-align: center; margin-top: 30px;">회원 정보 목록</h1>
<div style="margin: 70px;">
	<form:form method="post" action="${pageContext.request.contextPath}/member/admin/listDelete">
		<table style="width: 1100px; font-size: 18px;" class="table table-hover">
			<thead>
				<tr>
					<th scope="col"><input type="checkbox" id="allMember"></th>
					<th scope="col">아이디</th>
					<th scope="col">소환사 이름</th>
					<th scope="col">이메일</th>
					<th scope="col">커뮤니티 닉네임</th>
					<th scope="col">총 포인트</th>
					<th scope="col">가입일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="vo" items="${list }">
					<tr>
						<th scope="row"><input type="checkbox" name="mem" value="${vo.username }"></th>
						<td>${vo.username }</td>
						<td>${vo.snickname }</td>
						<td>${vo.email }</td>
						<td>${vo.nickname }</td>
						<td>${vo.point }</td>
						<td>${vo.regDate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<input type="submit" value="선택삭제" class="btn btn-secondary">
	</form:form>
	<div>
		<c:if test="${pu.startPageNum>5 }">
		<a href="/lol/member/admin/memberList?pageNum=${pu.pageNum-1}&field=${field}&keyword=${keyword}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${pu.startPageNum}" end="${pu.endPageNum }">
			<c:choose>
				<c:when test="${i==pu.pageNum }">
					<a href="/lol/member/admin/memberList?pageNum=${i}&field=${field}&keyword=${keyword}"><span style='color:blue'>[${i }]</span></a>
				</c:when>
				<c:otherwise>
					<a href="/lol/member/admin/memberList?pageNum=${i}&field=${field}&keyword=${keyword}"><span style='color:gray'>[${i }]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${pu.endPageNum<pu.totalPageCount }">
			<a href="/lol/member/admin/memberList?pageNum=${pu.pageNum+1}&field=${field}&keyword=${keyword}">[다음]</a>
		</c:if>
	</div>
	<div>
		<form:form method="post" action="/lol/member/admin/memberList">
			<select name="field">
				<option value="username" <c:if test="${field=='username' }">selected</c:if>>아이디</option>
				<option value="snickname" <c:if test="${field=='snickname' }">selected</c:if>>소환사 이름</option>
				<option value="nickname" <c:if test="${field=='nickname' }">selected</c:if>>커뮤니티 닉네임</option>
			</select>
			<input type="text" name="keyword" value="${keyword }">
			<input type="submit" value="검색">
		</form:form>
	</div>
</div>
<script type="text/javascript">
	var check = 0;
	document.getElementById("allMember").addEventListener('click', function(e) {
		var mem = document.getElementsByName("mem");
		//console.log(check); //0일때 체크박스 클릭, 1이면 체크박스 풀기
		for (let i=0; i<mem.length; i++) {
			if (check == 0) {
				mem[i].checked = true;	
			} else {
				mem[i].checked = false;
			}
		}
		if (check == 0) {
			check = 1;
		} else {
			check = 0;
		}
	}, true)
</script>