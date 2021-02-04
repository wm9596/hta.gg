<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/community/list.jsp</title>
<style type="text/css">
	a{ text-decoration:none }
</style>
</head>
<body>
	<a href="../">홈으로</a><!-- 이미지 클릭시 이동되도록 수정하기 -->
	<h2 style="margin-left: 20%;">전체</h2>
	<div style="padding-left: 78%"><a href="${pageContext.request.contextPath }/community/insert">새 글 등록</a></div><br>
<div align="center">
	<div>
		<div style="display: inline-block; font-size: 20px;"><a href="#">인기</a></div>&nbsp;
		<div style="display: inline-block; font-size: 20px; margin-left: 7%;"><a href="#">최신</a></div>&nbsp;
		<div style="display: inline-block; font-size: 20px; margin-left: 7%;"><a href="#">TOP</a></div>&nbsp;
		<div style="display: inline-block; font-size: 20px; margin-left: 7%;"><a href="#">10주</a></div>&nbsp;
			<select name="field"  style="margin-left: 9%;">
				<option value="username"<c:if test="${field=='username' }">selected</c:if>>ID</option>
				<option value="title"<c:if test="${field=='title' }">selected</c:if>>제목</option>
			</select>
			<input type="text" name="keyword" value="${keyword }">
			<input type="submit" value="검색">
	</div>
	<div>
		<form method="post"
			action="${pageContext.request.contextPath }/community/list"></form>
	</div><br>
	<div>
	<table border="3" width="1000">
		<tr>
			<th>글번호</th>
			<th>ID</th>
			<th>제목</th>
			<th>등록날짜</th>
			<th>조회수</th>
			<th>추천수</th>
		</tr>
		<c:forEach var="vo" items="${list }">
			<tr>
				<td>${vo.pNum }</td>
				<td>${vo.username }</td>
				<td>${vo.title }<a href="${pageContext.request.contextPath }/community/detail?pNum=${vo.pNum }">읽기</a></td>
				<td>${vo.regdate }</td>
				<td>${vo.viewCount }</td>
				<td>${vo.hit }</td>
			</tr>
		</c:forEach>
	</table>
	</div>
	<div>
		<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
			<c:choose>
				<c:when test="${i==pu.pageNum }">
					<a href="${pageContext.request.contextPath }/community/list?pageNum=${i}&field=${field}&keyword=${keyword}">
					<span style='color: blue'>[${i }]</span></a>
				</c:when>
				<c:otherwise>
					<a href="${pageContext.request.contextPath }/community/list?pageNum=${i}&field=${field}&keyword=${keyword}">
					<span style='color: gray'>[${i }]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>
</div>
</body>
</html>