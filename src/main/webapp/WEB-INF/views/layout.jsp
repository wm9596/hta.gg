<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath }/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/modern-business.css" rel="stylesheet">
<style type="text/css">
	#header_wrap {
		width: 100%;
		height: 200px;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="wrap" class="container">
		<div id="header">
			<tiles:insertAttribute name="header"/>
		</div>
	</div>
</body>
</html>