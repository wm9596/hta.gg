<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/community/list.jsp</title>
<style type="text/css">
	a{ text-decoration:none }
	th, td{text-align: center; border: 1px solid black;}
</style>
</head>
<body>
	<h2 style="padding: 2%;">전체</h2>
<div align="center">
	<div>
		<form:form method="post" action="${pageContext.request.contextPath }/community/list">
		<div style="display: inline-block; font-size: 20px;"><a href="#" style="color: black;">공략</a></div>&nbsp;
		<div style="display: inline-block; font-size: 20px; margin-left: 3%;"><a href="#" style="color: black;">자유</a></div>&nbsp;
		<div style="display: inline-block; font-size: 20px; margin-left: 3%;"><a href="#" style="color: black;">팀원모집</a></div>&nbsp;
		<div style="display: inline-block; font-size: 20px; margin-left: 3%;"><a href="#" style="color: black;">사건사고</a></div>&nbsp;
		<div style="display: inline-block; font-size: 20px; margin-left: 3%;"><a href="#" style="color: black;">Q&A</a></div>&nbsp;
			<select name="field"  style="margin-left: 9%;">
				<option value="username"<c:if test="${field=='username' }">selected</c:if>>ID</option>
				<option value="title"<c:if test="${field=='title' }">selected</c:if>>제목</option>
			</select>
			<input type="text" name="keyword" value="${keyword }">
			<input type="submit" value="검색">
			<div style="float: right; margin-right: 4%;"><a href="${pageContext.request.contextPath }/community/insert" style="color: black;">새 글 등록</a></div><br>
		</form:form>
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
			<th>조회수</th>
			<th>추천수</th>
			<th>등록날짜</th>
		</tr>
		<c:forEach var="vo" items="${list }">
			<tr>
				<td>${vo.pNum }</td>
				<td>${vo.username }</td>
				<td><a href="${pageContext.request.contextPath }/community/detail?pNum=${vo.pNum }">${vo.title }</a></td>
				<td>${vo.viewCount }</td>
				<td>${vo.hit }</td>
				<td>${vo.regdate }</td>
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
</div><br>
</body>
</html>