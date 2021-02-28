<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<h1 style="text-align: center; margin-top: 30px;">신고 접수 내역</h1>
<div style="margin: 70px;">
	<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col">신고 번호</th>
				<th scope="col">신고한 게시글 번호</th>
				<th scope="col">신고한 아이디</th>
				<th scope="col" style="width: 600px;">신고 내용</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${list }">
				<tr>
					<th scope="row">${vo.RNum }</th>
					<td><a href="${pageContext.request.contextPath }/community/detailMy?pNum=${vo.PNum }">${vo.PNum }</a></td>
					<td>${vo.username }</td>
					<td style="word-break:break-all;">${vo.detail }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<nav aria-label="Page navigation example">
		<ul class="pagination">
			<c:if test="${pu.startPageNum>5 }">
				<li class="page-item">
					<a class="page-link" href="/lol/member/admin/report?pageNum=${pu.pageNum-1}" aria-label="Previous">
						<span aria-hidden="true" style="font-size: 25px;">&laquo;</span>
	        			<span class="sr-only" style="font-size: 25px;">Previous</span>
	      			</a>
				</li>
			</c:if>
			<c:forEach var="i" begin="${pu.startPageNum}" end="${pu.endPageNum }">
				<c:choose>
					<c:when test="${i==pu.pageNum }">
						<li class="page-item"><a class="page-link" href="/lol/member/admin/report?pageNum=${i}"><span style='color:blue; font-size: 25px;'>[${i }]</span></a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="/lol/member/admin/report?pageNum=${i}"><span style='color:gray; font-size: 25px;'>[${i }]</span></a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${pu.endPageNum<pu.totalPageCount }">
				<li class="page-item">
      				<a class="page-link" href="/lol/member/admin/report?pageNum=${pu.pageNum+1}" aria-label="Next">
        				<span aria-hidden="true" style="font-size: 25px;">&raquo;</span>
        				<span class="sr-only" style="font-size: 25px;">Next</span>
      				</a>
    			</li>
			</c:if>
		</ul>
	</nav>
</div>