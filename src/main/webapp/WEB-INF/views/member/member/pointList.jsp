<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<h1 style="text-align: center; margin-top: 30px;">포인트 내역</h1>
<div style="margin: 70px;">
	<button type="button" onclick="location.href='${pageContext.request.contextPath}/member/member/pointList'" class="btn btn-primary">포인트 전체 내역</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<button type="button" onclick="location.href='${pageContext.request.contextPath}/member/member/pointList?score=1'" class="btn btn-primary">포인트 획득 내역</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<button type="button" onclick="location.href='${pageContext.request.contextPath}/member/member/pointList?score=-1'" class="btn btn-primary">포인트 소비 내역</button>
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
	<nav aria-label="Page navigation example">
		<ul class="pagination">
			<c:if test="${pu.startPageNum>5 }">
				<li class="page-item">
					<a class="page-link" href="/lol/member/member/pointList?pageNum=${pu.pageNum-1}&score=${score}" aria-label="Previous">
						<span aria-hidden="true" style="font-size: 25px;">&laquo;</span>
	        			<span class="sr-only" style="font-size: 25px;">Previous</span>
	      			</a>
				</li>
			</c:if>
			<c:forEach var="i" begin="${pu.startPageNum}" end="${pu.endPageNum }">
				<c:choose>
					<c:when test="${i==pu.pageNum }">
						<li class="page-item"><a class="page-link" href="/lol/member/member/pointList?pageNum=${i}&score=${score}"><span style='color:blue; font-size: 25px;'>[${i }]</span></a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="/lol/member/member/pointList?pageNum=${i}&score=${score}"><span style='color:gray; font-size: 25px;'>[${i }]</span></a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${pu.endPageNum<pu.totalPageCount }">
				<li class="page-item">
      				<a class="page-link" href="/lol/member/member/pointList?pageNum=${pu.pageNum+1}&score=${score}" aria-label="Next">
        				<span aria-hidden="true" style="font-size: 25px;">&raquo;</span>
        				<span class="sr-only" style="font-size: 25px;">Next</span>
      				</a>
    			</li>
			</c:if>
		</ul>
	</nav>
</div>