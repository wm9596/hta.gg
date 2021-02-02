<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<%-- <link href="${pageContext.request.contextPath }/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> --%>
<%-- <link href="${pageContext.request.contextPath }/resources/css/modern-business.css" rel="stylesheet"> --%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<style type="text/css">
	* {
		margin: 0px;
		padding: 0px;
	}
	#header_wrap {
		width: 100%;
		height: 50px;
		background-color: orange;
	}
	#content {
		margin-left: 15%;
		margin-right: 15%;
		background-color: green;
	}
	#header {
		border: 1px solid gray;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="wrap" class="container">
		<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top" id="header_wrap">
			<tiles:insertAttribute name="header"/>
		</nav>
		<div id="content">
			<tiles:insertAttribute name="content"/>
		</div>
	</div>
</body>
</html>