<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<h1 style="text-align: center; margin-top: 30px;">신고 접수 내역</h1>
<div style="margin: 70px;">
	<table style="width: 1000px;" class="table table-hover">
		<thead>
			<tr>
				<th scope="col">신고 번호</th>
				<th scope="col">신고한 게시글 번호</th>
				<th scope="col">신고한 아이디</th>
				<th scope="col">신고 내용</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${list }">
				<tr>
					<th scope="row">${vo.RNum }</th>
					<td><a href="${pageContext.request.contextPath }/community/detailMy?pNum=${vo.PNum }">${vo.PNum }</a></td>
					<td>${vo.username }</td>
					<td>${vo.detail }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div>
		<c:if test="${pu.startPageNum>5 }">
		<a href="/lol/member/admin/report?pageNum=${pu.pageNum-1}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${pu.startPageNum}" end="${pu.endPageNum }">
			<c:choose>
				<c:when test="${i==pu.pageNum }">
					<a href="/lol/member/admin/report?pageNum=${i}"><span style='color:blue'>[${i }]</span></a>
				</c:when>
				<c:otherwise>
					<a href="/lol/member/admin/report?pageNum=${i}"><span style='color:gray'>[${i }]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${pu.endPageNum<pu.totalPageCount }">
			<a href="/lol/member/admin/report?pageNum=${pu.pageNum+1}">[다음]</a>
		</c:if>
	</div>
</div>