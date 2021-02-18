<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<h1 style="text-align: center; margin-top: 30px;">내가 작성한 글 목록</h1>
<div style="margin: 70px;">
	<table style="width: 1000px;">
		<tr>
			<th>카테고리</th>
			<th>글제목</th>
			<th>추천수</th>
			<th>반대수</th>
			<th>조회수</th>
			<th>댓글수</th>
			<th>작성일</th>
		</tr>
		<c:forEach var="vo" items="${list }">
			<tr>
				<c:choose>
					<c:when test="${vo.cNum }=='1'">
						<td>공략 게시판</td>
					</c:when>
					<c:when test="${vo.cNum }=='2'">
						<td>자유 게시판</td>
					</c:when>
					<c:when test="${vo.cNum }=='3'">
						<td>팀원모집 게시판</td>
					</c:when>
					<c:when test="${vo.cNum }=='4'">
						<td>사건사고 게시판</td>
					</c:when>
					<c:when test="${vo.cNum }=='5'">
						<td>Q&A 게시판</td>
					</c:when>
					<c:otherwise>
						<td>경기일정 게시판</td>
					</c:otherwise>
				</c:choose>
				<td><a href="${pageContext.request.contextPath }/community/detail?pNum=${vo.pNum }&cNum=${vo.cNum }">${vo.title }</a></td>
				<td>${vo.hit }</td>
				<td>${vo.nohit }</td>
				<td>${vo.viewCount }</td>
				<td>${vo.commentCount }</td>
				<td>${vo.regdate }</td>
			</tr>
		</c:forEach>
	</table>
	<div>
		<c:if test="${pu.startPageNum>5 }">
		<a href="/lol/member/member/boardList?pageNum=${pu.pageNum-1}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${pu.startPageNum}" end="${pu.endPageNum }">
			<c:choose>
				<c:when test="${i==pu.pageNum }">
					<a href="/lol/member/member/boardList?pageNum=${i}"><span style='color:blue'>[${i }]</span></a>
				</c:when>
				<c:otherwise>
					<a href="/lol/member/member/boardList?pageNum=${i}"><span style='color:gray'>[${i }]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${pu.endPageNum<pu.totalPageCount }">
			<a href="/lol/member/member/boardList?pageNum=${pu.pageNum+1}">[다음]</a>
		</c:if>
	</div>
</div>