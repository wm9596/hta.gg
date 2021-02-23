<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<h1 style="text-align: center; margin-top: 30px;">내가 작성한 글 목록</h1>
<div style="margin: 70px;">
	<table style="width: 1000px;" class="table table-hover">
		<thead>
			<tr>
				<th scope="col">카테고리</th>
				<th scope="col">글제목</th>
				<th scope="col">추천수</th>
				<th scope="col">반대수</th>
				<th scope="col">조회수</th>
				<th scope="col">댓글수</th>
				<th scope="col">작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${list }">
				<tr>
					<c:choose>
						<c:when test="${vo.cNum }=='1'">
							<th scope="row">공략 게시판</th>
						</c:when>
						<c:when test="${vo.cNum }=='2'">
							<th scope="row">자유 게시판</th>
						</c:when>
						<c:when test="${vo.cNum }=='3'">
							<th scope="row">팀원모집 게시판</th>
						</c:when>
						<c:when test="${vo.cNum }=='4'">
							<th scope="row">사건사고 게시판</th>
						</c:when>
						<c:when test="${vo.cNum }=='5'">
							<th scope="row">Q&A 게시판</th>
						</c:when>
						<c:otherwise>
							<th scope="row">경기일정 게시판</th>
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
		</tbody>
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