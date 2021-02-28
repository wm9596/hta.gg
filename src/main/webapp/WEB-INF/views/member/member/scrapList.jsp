<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<h1 style="text-align: center; margin-top: 30px;">내가 스크랩한 글</h1>
<div style="margin: 70px;">
	<table style="width: 1000px;" class="table table-hover">
		<thead>
			<tr>
				<th scope="col">게시글 번호</th>
				<th scope="col">게시글 종류</th>
				<th scope="col">게시글 제목</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="vo" items="${list }">
			<tr>
				<th scope="row">${vo.pNum }</th>
				<c:choose>
					<c:when test="${vo.cNum == '1'}">
						<td>공략 게시판</td>
					</c:when>
					<c:when test="${vo.cNum == '2'}">
						<td>자유 게시판</td>
					</c:when>
					<c:when test="${vo.cNum == '3'}">
						<td>팀원모집 게시판</td>
					</c:when>
					<c:when test="${vo.cNum == '4'}">
						<td>사건사고 게시판</td>
					</c:when>
					<c:when test="${vo.cNum == '5'}">
						<td>Q&A 게시판</td>
					</c:when>
					<c:otherwise>
						<td>경기일정 게시판</td>
					</c:otherwise>
				</c:choose>
				<td style="word-break:break-all; width: 700px;"><a href="${pageContext.request.contextPath }/community/detailMy?pNum=${vo.pNum }">${vo.title }</a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div>
		<c:if test="${pu.startPageNum>5 }">
		<a href="/lol/member/member/scrapList?pageNum=${pu.pageNum-1}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${pu.startPageNum}" end="${pu.endPageNum }">
			<c:choose>
				<c:when test="${i==pu.pageNum }">
					<a href="/lol/member/member/scrapList?pageNum=${i}"><span style='color:blue'>[${i }]</span></a>
				</c:when>
				<c:otherwise>
					<a href="/lol/member/member/scrapList?pageNum=${i}"><span style='color:gray'>[${i }]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${pu.endPageNum<pu.totalPageCount }">
			<a href="/lol/member/member/scrapList?pageNum=${pu.pageNum+1}">[다음]</a>
		</c:if>
	</div>
</div>