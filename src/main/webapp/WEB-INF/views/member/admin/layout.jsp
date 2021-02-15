<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/mainHome.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/matchMore.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
﻿<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	*{margin:0px;padding:0px;}
	#adminPage_wrap{width:1200px; margin:auto;}
	#adminPage_Menu{width:250px;height:400px;float:left;padding:20px;border-bottom:2px solid #DDDDDD;border-right:2px solid #DDDDDD;border-radius: 10px;  padding-bottom: 100px;}
	#adminPage_Menu h2{font-weight:bold; color:#555555;font-family: 'Noto Serif KR', serif;}
	#adminPage_Menu a{color:black;text-decoration: none; font-weight:bold;color:#CCCCCC;font-family: 'Noto Serif KR', serif;}
	#adminPage_Menu a:hover{color:#888888;}
	#adminPage_section{width:960px; padding-top:20px; height:500px;}
</style>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<tiles:insertAttribute name="header"/>
		</div>
		<div id="content">
			<div id="adminPage_wrap">
				<div id="adminPage_Menu">
					<h2>Admin Page</h2><br>
					<h4><a href="${pageContext.request.contextPath }/member/admin/memberList">회원 관리</a></h4>
					<h4><a href="">신고 접수 내역</a></h4>
					<h4><a href="">경기일정 등록,<br> 결과 처리</a></h4>
					<h4><a href="">공지사항 등록</a></h4>
					<h4><a href="">게시글 관리</a></h4>
					<h4><a href="">기간별 접속자 수 통계 조회</a></h4>
				</div>
				<div id="adminPage_section">
					<tiles:insertAttribute name="content"/>
				</div>
			</div>
		</div>
		<div id="footer">
			<tiles:insertAttribute name="footer"/>
		</div>
	</div>
</body>
</html>