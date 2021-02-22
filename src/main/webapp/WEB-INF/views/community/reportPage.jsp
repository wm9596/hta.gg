<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
﻿<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">
	* {
		margin: 0px;
		padding: 0px;
	}
	#report_wrap {
		width: 500px;
		height: 300px;
		text-align: center;
	}
	#report_title {
		width: 100%;
		height: 10%;
		background-color: black;
		color: white;
		text-align: center;
	}
	#reportOk{
		width: 40%;
		display: inline-block;
		margin: 0px auto;
	}
</style>
<meta charset="UTF-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
<title>Insert title here</title>
</head>
<body style="overflow-x: hidden; overflow-y: hidden;">
	<input type="hidden" id="pNum" value="${pNum }">
	<input type="hidden" id="username" value="${username }">
	<div id="report_wrap">
		<div id="report_title">
			<p>신고하기</p>
		</div>
		<div id="report_detailArea">
			<textarea rows="14" cols="50" id="detail"></textarea>
		</div>
		<input type="button" id="reportOk" value="신고하기">
	</div>
</body>
<script type="text/javascript">
	$("#reportOk").click(function() {
		var username = $("#username").val();
		var pNum = $("#pNum").val();
		var detail = $("#detail").val();
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		
		$.ajax({
			url: "/lol/report",
			type: "POST",
			data: "pNum=" + pNum + "&username=" + username + "&detail=" + detail,
			beforeSend: function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success: function(data) {
				console.log(data);
				alert('신고 접수가 완료되었습니다.')
				self.close();
				
			}
		})
	})
</script>
</html>