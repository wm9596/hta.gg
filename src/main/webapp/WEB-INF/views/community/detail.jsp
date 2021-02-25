<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>views/community/detail.jsp</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript">
</script>
<style type="text/css">
/* 	a{ text-decoration:none; color: black; } */
	.commWrap{margin-bottom: 20px; width: 80%; position: relative; margin-bottom: 20px; margin-left: auto; margin-right: auto;}
	.comm{width: 100%; border: 1px solid #aaa;position: relative;} 
/* 	.insert{margin-top: 5%} */
/* 	.comm{margin-bottom: 20px; margin-left: 22%; width: 600px; border: 1px solid #aaa;position: relative;} */
/* 	.commWrap1{margin-bottom: 20px; margin-left: 25%; width: 600px; position: relative;} */
</style>
</head>
<body><br>
<c:choose>
	<c:when test="${vo.cNum == 1}">
		<c:set var="categoryName" value="공략"/>
	</c:when>
	<c:when test="${vo.cNum == 2}">
		<c:set var="categoryName" value="자유"/>
	</c:when>
	<c:when test="${vo.cNum == 3}">
		<c:set var="categoryName" value="팀원모집"/>
	</c:when>
	<c:when test="${vo.cNum == 4}">
		<c:set var="categoryName" value="사건사고"/>
	</c:when>
	<c:when test="${vo.cNum == 5}">
		<c:set var="categoryName" value="사건사고"/>
	</c:when>
	<c:otherwise>
		<c:set var="categoryName" value="Q&A"/>
	</c:otherwise>
</c:choose>
<form:form method="get" action="${pageContext.request.contextPath }/community/update">
	<input type="hidden" name="title" readonly="readonly" value="${vo.title }">
	<input type="hidden" id="pNum" name="pNum" value="${vo.pNum }">
	<input type="hidden" id="username" name="username" value="${vo.username}">
	<input type="hidden" name="cNum" value="${vo.cNum }">
	<table class="table" style="width: 70%; margin: auto;">
		<tr>
			<th scope="col">
				<h3>${vo.title }</h3>
			</th>
		</tr>
		<tr>
			<td>
				<span>${vo.username }</span><input type="button" id="sendMsg" value="쪽지"> | <span>${categoryName }</span> | <span>${vo.regdate }</span>
			</td>
			<td>
				<span>조회 ${vo.viewCount+1}</span> | <span>추천 ${vo.hit }</span> | <span>반대 ${vo.nohit }</span>
			</td>
		</tr>
		<tr>
			<td>
			${vo.content }
			</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: center;">
				<button type="button" id="hit" class="btn btn-info likeBtn"	style="width: 100px; height: 50px; font-size: 25px;">추천 ${vo.hit }</button>
				<button type="button" id="nohit" class="btn btn-info likeBtn" style="width: 100px; height: 50px; font-size: 25px;">반대 ${vo.nohit }</button>
				<button type="button" id="report" class="btn btn-info likeBtn" onclick="" style="width: 100px; height: 50px; font-size: 25px;">신고</button>
			</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: center;">
<!-- 				<input type="button" value="이전 페이지로" onclick="beforePage()"> -->
				<button>게시글 수정</button>
				<input type="button" value="게시글 삭제" onclick="postDelete(${vo.pNum})">
			</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: center">
				<input type="hidden" id="rWriter" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}" readonly="readonly">
				<input type="text" id="rContent" style="width:70%">
				<input type="button" value="댓글등록" id="btn"><br><br><br>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<div id="commList"></div>
			</td>
		</tr>
		<tr>
			<td>
				<span>이전글</span> <a href='${pageContext.request.contextPath }/community/detail?pNum=${next.pNum}&cNum=${vo.cNum}'>${next.title }</a>
				<br>
				<span>다음글</span> <a href='${pageContext.request.contextPath }/community/detail?pNum=${prev.pNum}&cNum=${vo.cNum}'>${prev.title }</a>
			</td>
		</tr>
	</table>
	
	
<!-- 	<div align="center" class="insert"> -->
<!-- 		<h2>게시글 조회하기</h2> -->
<!-- 		<hr size="2" width="600" color="black" id=line> -->
<%-- 		<input type="hidden" id="pNum" name="pNum" value="${vo.pNum }"> --%>
		<!-- DB에 username의 임의의 값 넣음 (추후 회원가입 후 진행) -->
<%-- 		작성자 <input type="text" id="username" name="username" value="${vo.username}" style="width:87px; text-align: center;" readonly="readonly"> --%>
		<!-- DB에 cNum의 임의의 값 넣음 (추후 회원가입 후 진행) -->
<%-- 		카테고리 <input type="text" name="cNum" value="${vo.cNum }" style="width:87px; text-align: center;" readonly="readonly" > --%>
<%-- 		등록일 <input type="text" value="${vo.regdate }" style="width:87px; text-align: center;" readonly="readonly"> --%>
<%-- 		조회수 <input type="text" value="${vo.viewCount+1}" style="width:87px; text-align: center;" readonly="readonly"><br><br> --%>
<!-- 		<input type="button" id="sendMsg" value="쪽지"> <br> -->
<%-- 		<textarea rows="1" cols="80" name="title" readonly="readonly">[제목] ${vo.title }</textarea><br> --%>
<%-- 		${vo.content } --%>
		<!--
		<a href="${pageContext.request.contextPath }/community/delete?pNum=${vo.pNum }" style="position: right;">게시글 삭제</a>
		-->
<!-- 	</div><br><br><br> -->
</form:form>
<!-- 	<div align="center"> -->
<%-- 		<button type="button" id="hit" class="btn btn-info likeBtn"	style="width: 100px; height: 50px; font-size: 25px;">추천 ${vo.hit }</button> --%>
<%-- 		<button type="button" id="nohit" class="btn btn-info likeBtn" style="width: 100px; height: 50px; font-size: 25px;">반대 ${vo.nohit }</button> --%>
<!-- 		<button type="button" id="report" class="btn btn-info likeBtn" onclick="" style="width: 100px; height: 50px; font-size: 25px;">신고</button> -->
<!-- 	</div> -->
<!-- 		<br><br><br> -->
<!-- 		<div align="center"> -->
<!-- 			<div style="display: inline-block;"> -->
<!-- 				다음 글&nbsp;&nbsp;&nbsp;<br> -->
<!-- 				이전 글&nbsp;&nbsp;&nbsp; -->
<!-- 			</div> -->
<!-- 			<div  style="display: inline-block;"> -->
<%-- 				<a href='${pageContext.request.contextPath }/community/detail?pNum=${next.pNum}&cNum=${vo.cNum}'>${next.title }</a><br> --%>
<%-- 				<a href='${pageContext.request.contextPath }/community/detail?pNum=${prev.pNum}&cNum=${vo.cNum}'>${prev.title }</a> --%>
<!-- 				태그 안에 조건문 -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<br><br><br> -->
<!-- 		<!-- 댓글 목록 --> -->
<!-- 		<h3 style="margin-left: 22%">댓글 입력</h3> -->
<!-- 		<div align="center"> -->
<!-- 			<hr size="2" width="600" color="black" id=line> -->
<!-- 		</div> -->
<!-- 		<div > -->
<!-- 			<div id="commList"></div><br> -->
<!-- <!-- 			<div id="rc" style="background-color: black"></div> -------------------------------------------------------------------------------------------- --> -->
<!-- 			<div align="center"> -->
<!-- 			<div id="commAdd" style="display: inline-block;"> -->
<%-- 				아이디 <input type="text" id="rWriter" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}" readonly="readonly"> --%>
<!-- 				댓글 <input type="text" id="rContent" style="width:250px"> -->
<!-- 				<input type="button" value="댓글등록" id="btn"><br><br><br> -->
<!-- 			</div> -->
<!-- 			</div> -->
<!-- 		</div> -->

<script type="text/javascript">
	$(function(){
		console.log("문서 로딩");
		getList();
	})

	$("#hit").click(function(e){
		var ask=confirm("해당 게시글을 추천하시겠습니까?");
		if(ask == true){
		$.ajax({
			url:"/lol/update/" + ${vo.pNum },
			success: function(data){
				$("#hit").html('추천 '+data);
			}
		});
		}
	});
	
	$("#nohit").click(function(e){
		var ask=confirm("해당 게시글을 반대하시겠습니까?");
		if(ask == true){
		$.ajax({
			url:"/lol/update1/" + ${vo.pNum },
			success: function(data){
				$("#nohit").html('반대 '+data);
			}
		});
		}
	});
	
	$("#btn").click(function(){
		var rWriter = document.getElementById("rWriter").value;
		var rContent = document.getElementById("rContent").value;
		var ask = confirm("댓글을 등록하시겠습니까?");
		if(ask == true){
		$.ajax({
			url:"/lol/insert/${vo.pNum}/"+rWriter+"/"+rContent+"/",
			success: function(data) {
				var code=$(data).find("code").text();
				alert("댓글이 등록되었습니다.");
				if(code=='success'){
					getList();
					$("#rContent").val('');
				}else{
					alert('등록 실패!');
				}
			}
		});
		}
	});
	
	function removeComm(rNum, pNum) {
		console.log("===========================");
		var ask = confirm("정말로 삭제하시겠습니까?");
		if(ask == true){
		$.ajax({
			url:"/lol/delete/"+rNum+"/"+pNum,
			success: function(data) {
				var code=$(data).find("code").text();
				if(code=='success'){
					getList();
				}else{
					alert('삭제 실패!');
				}
			}
		});
		}
	}

	function postDelete(pNum){
		var ask = confirm("정말로 삭제하시겠습니까?");
		if(ask == true){
		$.ajax({
			url:"/lol/community/delete/"+pNum,
			success: function(data) {
				var code=$(data).find("code").text();
				alert("게시글이 삭제되었습니다.");
				if(code=='success'){
					beforePage();
				}else{
					alert('삭제 실패!');
				}
			}
		});
		}
	}
	
	function replyHit(rNum) {
		var ask = confirm("해당 댓글을 추천하시겠습니까?");
		if(ask == true){
		$.ajax({
			url:"/lol/reHitUpdate/"+rNum,
			success: function(data) {
					alert('추천 성공');
					getList();
			}
		});
		}
	}

	function replyNohit(rNum) {
		var ask = confirm("해당 댓글을 반대하시겠습니까?");
		if(ask == true){
		$.ajax({
			url:"/lol/reNohitUpdate/"+rNum,
			success: function(data) {
					alert('반대 성공');
					getList();
			}
		});
		}
	}
	
	$("#report").click(function() {
		var username = $("#rWriter").val();
		var pNum = $("#pNum").val();
		if (username == "") {
			alert("로그인이 필요한 페이지입니다.");
			location.href = "/lol/member/login";
		} else {
			$.ajax({
				url: "/lol/reportCheck?pNum=" + pNum + "&username=" + username,
				success: function(result) {
					console.log(result);
					if (result == true) {
						alert("이미 신고한 게시물입니다.")
					} else {
						window.open('/lol/reportPage?pNum=' + pNum + '&username=' + username,'신고하기','width=500px, height=300px')
					}
				}
			})
		}
	})
	
	$("#sendMsg").click(function() {
		var receiver =  $("#username").val();
		var sender = $("#rWriter").val();
		if (sender == "") {
			alert("로그인이 필요한 페이지입니다.");
			location.href = "/lol/member/login";
		}
		else {
			window.open('/lol/sendMsgPage?sender=' + sender + '&receiver=' + receiver,'쪽지 보내기','width=500px, height=300px')	
		}
	})
	
	
			function beforePage(){
		history.go(-1);
		return;
	}

	function getList() {
		console.log("호출");
		$.ajax({
			url:"/lol/reply/${vo.pNum}",
			dataType: 'xml',
			success: function(data){
				console.log(data);
				var commList = $("#commList");
				var childs = commList.childNodes;
				
				commList.empty();
				$(data).find("item").each(function(){
					var rNum = $(this).find("rNum").text();
					var pNum = $(this).find("pNum").text();
					var rWriter = $(this).find("rWriter").text(); 
					var rContent = $(this).find("rContent").text();
					var regdate = $(this).find("regdate").text();
					var rHit = $(this).find("rHit").text();
					var rNohit = $(this).find("rNohit").text();
					var wrapDiv = $("<div>",{class:'commWrap'});
					var div = $("<div>",{class:'comm'});
					div.html(
							rWriter+"&nbsp;&nbsp;&nbsp;"+rContent+"<br>"
							+regdate+"&nbsp;&nbsp;&nbsp;"
							+"<a href='javascript:replyHit("+ rNum + ")'>추천</a>[" + rHit +"]&nbsp;&nbsp;"
							+"<a href='javascript:replyNohit("+ rNum + ")'>반대</a>[" + rNohit +"]&nbsp;&nbsp;"
							+"<a href=\"javascript:rereComment("+ rNum + "," + pNum + ",'" + rWriter + "','" + rContent + "')\">답글</a>"+"&nbsp;&nbsp;"
							+"<a href='javascript:removeComm("+ rNum + "," + pNum + ")'>삭제</a>"
					);
					
					wrapDiv.append(div);
					
					getRRlist(wrapDiv,rNum);
					
					commList.append(wrapDiv);
					
				});
			}
		});
	}
	
	function getRRlist(wrapDiv,rNum){
		$.ajax({
			url:"/lol/rereply/"+rNum,
			dataType: 'json',
			success: function(data){
				if(data.length < 1 ) return;
				console.log(rNum+"번 대댓");
				for(rereply of data){
					console.log(rereply);
					var rereDiv = $("<div>",{class:'commWrap1'});
					rereDiv.text("└" + rereply.regdate + " " + rereply.rWriter + " " + rereply.rContent);
					console.log(wrapDiv);
					wrapDiv.append(rereDiv);
				}
			},
			error :function(data){
				console.log("없음");
			}
		});
	}
	
	function rereComment(rNum, pNum, rWriter, rContent){
		var rWriter = document.getElementById("rWriter").value;
		// var ask = document.getElementById("ask").value;
		var prompt_test = prompt("댓글을 입력해주세요.");
		var ask = confirm("댓글을 등록하시겠습니까?");
		if(ask == true){
		$.ajax({
			url:"/lol/rinsert/"+rNum+"/"+pNum+"/"+rWriter+"/"+prompt_test,
			success: function(data) {
				var code=$(data).find("code").text();
				if(code=='success'){
					alert("댓글이 등록되었습니다.");
					getList();
				}else{
					alert('등록 실패!');
				}
			}
		});
		}
	}

	


</script>
</body>
</html>