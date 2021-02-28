<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<h1 style="text-align: center; margin-top: 30px;">내가 받은 쪽지 목록</h1>
<div style="margin: 70px;">
	<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col">쪽지 번호</th>
				<th scope="col">보낸 아이디</th>
				<th scope="col">쪽지 내용</th>
				<th scope="col">쪽지 전송 날짜</th>
				<th scope="col">쪽지 읽은 여부</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${list }" varStatus="status">
				<tr>
					<th scope="row"><c:out value="${(pu.pageNum-1)*10 + status.count }"/></th>
					<td>${vo.sender }</td>
					<c:choose>
						<c:when test="${vo.open == '0' }">
							<td style="word-break:break-all; width: 400px;"><a href="${pageContext.request.contextPath }/updateMsg?msgNum=${vo.msgNum }">${vo.msg }</a></td>
						</c:when>
						<c:otherwise>
							<td style="word-break:break-all; width: 400px;">${vo.msg }</td>
						</c:otherwise>
					</c:choose>
					<td>${vo.sendTime }</td>
					<c:if test="${vo.open == '0' }">
						<td>안읽음</td>
					</c:if>
					<c:if test="${vo.open == '1' }">
						<td>읽음</td>
					</c:if>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<nav aria-label="Page navigation example">
		<ul class="pagination">
			<c:if test="${pu.startPageNum>5 }">
				<li class="page-item">
					<a class="page-link" href="/lol/member/member/messageList?pageNum=${pu.pageNum-1}" aria-label="Previous">
						<span aria-hidden="true" style="font-size: 25px;">&laquo;</span>
	        			<span class="sr-only" style="font-size: 25px;">Previous</span>
	      			</a>
				</li>
			</c:if>
			<c:forEach var="i" begin="${pu.startPageNum}" end="${pu.endPageNum }">
				<c:choose>
					<c:when test="${i==pu.pageNum }">
						<li class="page-item"><a class="page-link" href="/lol/member/member/messageList?pageNum=${i}"><span style='color:blue; font-size: 25px;'>[${i }]</span></a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="/lol/member/member/messageList?pageNum=${i}"><span style='color:gray; font-size: 25px;'>[${i }]</span></a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${pu.endPageNum<pu.totalPageCount }">
				<li class="page-item">
      				<a class="page-link" href="/lol/member/member/messageList?pageNum=${pu.pageNum+1}" aria-label="Next">
        				<span aria-hidden="true" style="font-size: 25px;">&raquo;</span>
        				<span class="sr-only" style="font-size: 25px;">Next</span>
      				</a>
    			</li>
			</c:if>
		</ul>
	</nav>
</div>