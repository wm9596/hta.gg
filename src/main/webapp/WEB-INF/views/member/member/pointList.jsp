<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<h1 style="text-align: center; margin-top: 30px;">포인트 내역</h1>
<div style="margin: 70px;">
	<a href="${pageContext.request.contextPath}/member/member/pointList" style="font-size: 20px;">포인트 전체 내역</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="${pageContext.request.contextPath}/member/member/pointList?score=1" style="font-size: 20px;">포인트 획득 내역</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="${pageContext.request.contextPath}/member/member/pointList?score=-1" style="font-size: 20px;">포인트 소비 내역</a>
	<table style="width: 1000px;" class="table table-hover">
		<thead>
			<tr>
				<th scope="col">포인트 내역</th>
				<th scope="col">포인트</th>
				<th scope="col">일시</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${list }">
				<tr>
					<th scope="row">${vo.method }</th>
					<td>${vo.score }</td>
					<td>${vo.regdate }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div>
		<c:if test="${pu.startPageNum>5 }">
		<a href="/lol/member/member/pointList?pageNum=${pu.pageNum-1}&score=${score}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${pu.startPageNum}" end="${pu.endPageNum }">
			<c:choose>
				<c:when test="${i==pu.pageNum }">
					<a href="/lol/member/member/pointList?pageNum=${i}&score=${score}"><span style='color:blue'>[${i }]</span></a>
				</c:when>
				<c:otherwise>
					<a href="/lol/member/member/pointList?pageNum=${i}&score=${score}"><span style='color:gray'>[${i }]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${pu.endPageNum<pu.totalPageCount }">
			<a href="/lol/member/member/pointList?pageNum=${pu.pageNum+1}&score=${score}">[다음]</a>
		</c:if>
	</div>
</div>