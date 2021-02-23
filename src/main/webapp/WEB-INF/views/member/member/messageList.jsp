<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<h1 style="text-align: center; margin-top: 30px;">내가 받은 쪽지 목록</h1>
<div style="margin: 70px;">
	<table style="width: 1000px;">
		<tr>
			<th>쪽지 번호</th>
			<th>보낸 아이디</th>
			<th>쪽지 내용</th>
			<th>쪽지 전송 날짜</th>
			<th>쪽지 읽은 여부</th>
		</tr>
		<c:forEach var="vo" items="${list }" varStatus="status">
			<tr>
				<td><c:out value="${(pu.pageNum-1)*10 + status.count }"/></td>
				<td>${vo.sender }</td>
				<td>${vo.msg }</td>
				<td>${vo.sendTime }</td>
				<c:if test="${vo.open == '0' }">
					<td>안읽음</td>
				</c:if>
				<c:if test="${vo.open == '1' }">
					<td>읽음</td>
				</c:if>
			</tr>
		</c:forEach>
	</table>
	<div>
		<c:if test="${pu.startPageNum>5 }">
		<a href="/lol/member/member/messageList?pageNum=${pu.pageNum-1}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${pu.startPageNum}" end="${pu.endPageNum }">
			<c:choose>
				<c:when test="${i==pu.pageNum }">
					<a href="/lol/member/member/messageList?pageNum=${i}"><span style='color:blue'>[${i }]</span></a>
				</c:when>
				<c:otherwise>
					<a href="/lol/member/member/messageList?pageNum=${i}"><span style='color:gray'>[${i }]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${pu.endPageNum<pu.totalPageCount }">
			<a href="/lol/member/member/messageList?pageNum=${pu.pageNum+1}">[다음]</a>
		</c:if>
	</div>
</div>