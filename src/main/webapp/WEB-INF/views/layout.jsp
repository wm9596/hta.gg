<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
	* {
		margin: 0px;
		padding: 0px;
	}
	#header {
		width: 100%;
		height: 100px;
	}
	#content {
		margin-left: 15%;
		margin-right: 15%;
		background-color: green;
		color: ffffff;
	}
	#header_left {
		background-color: #343a40 !important;
		display: flex;
		width: 33.3%;
		height: 50px;
		float: left;
		align-items: center;
	}
	#header_center{
		background-color: #343a40 !important;
		display: flex;
		justify-content: center;
        align-items: center;
		width: 33.3%;
		height: 50px;
		float: left;
		
	}
	#header_center .menu{
		display: flex;
		width: 33.3%;
		height: 50px;
		float: left;
		justify-content: center;
        align-items: center;
	}
	
	#header_center a{
		text-decoration: none;
	}
	
	#header_center form{
		width: 80%;
		
	}

	#header_right{
		background-color: #343a40 !important;
		display: flex;
		width: 33.3%;
		height: 50px;
		float: left;
		align-items: center;
 		justify-content: space-between; 
	}
	
	#header_right #header_msg{
		display: flex;
		width: 10%;
		height: 50px;
		align-items: center;
	}
	
	#header_right #header_mypage{
		display: flex;
		width: 10%;
		height: 50px;
		align-items: center;
	}
	
	#header_right #header_none {
		width: 80%;
		height: 50px;
	}
	
	#header_right i{
		font-size: 30px;
	}
	
	#sub_header {
		display: flex;
		width: 100%;
		height: 50px;
		background-color: orange;
	}
	
	#sub_header div{
		justify-content: center;
        align-items: center;
		width: 33.3%;
		height: 50px;
		float: left;
		background-color: orange;
	}
	#sub_header_center .menu{
		display: flex;
		width: 33.3%;
		height: 50px;
		float: left;
		justify-content: center;
        align-items: center;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<tiles:insertAttribute name="header"/>
		</div>
		<div id="content">
			<tiles:insertAttribute name="content"/>
		</div>
	</div>
</body>
</html>