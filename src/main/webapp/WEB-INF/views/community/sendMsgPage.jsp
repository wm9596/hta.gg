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
	#sendMsgOk{
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
	<input type="hidden" id="sender" value="${sender }">
	<input type="hidden" id="receiver" value="${receiver }">
	<div id="report_wrap">
		<div id="report_title">
			<p>${receiver} 님께 쪽지보내기</p>
		</div>
		<div id="report_detailArea">
			<textarea rows="14" cols="50" id="msg"></textarea>
		</div>
		<input type="button" id="sendMsgOk" value="쪽지 전송">
	</div>
</body>
<script type="text/javascript">
	$("#sendMsgOk").click(function() {
		var sender = $("#sender").val();
		var receiver = $("#receiver").val();
		var msg = $("#msg").val();
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		
		$.ajax({
			url: "/lol/sendMsg",
			type: "POST",
			data: "sender=" + sender + "&receiver=" + receiver + "&msg=" + msg,
			beforeSend: function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success: function(data) {
				console.log(data);
				if (data == true) {
					alert('쪽지 전송을 완료했습니다.')	
				} else {
					alert('오류로 인한 쪽지 전송 실패..')
				}
				
				self.close();
				
			}
		})
	})
</script>
</html>