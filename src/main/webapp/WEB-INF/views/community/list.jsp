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
 	a:hover { text-decoration:none; color:#EDA900;}
/* 	th, td{text-align: center; border: 1px solid black;} */
/* 	#g_menu_1{width:60px; margin-top:10px;font-weight:bold;font-size:15pt;display:inline-block; text-align:center;} */
/* 	#g_menu_2{width:60px;margin-top:10px;font-weight:bold;font-size:15pt;display:inline-block; text-align:center;} */
/* 	#g_menu_3{width:80px;margin-top:10px;margin-left:20px;font-weight:bold;font-size:15pt;display:inline-block; text-align:center;} */
/* 	#g_menu_4{width:80px;margin-top:10px;margin-left:20px;font-weight:bold;font-size:15pt;display:inline-block; text-align:center;} */
/* 	#g_menu_5{width:80px;margin-top:10px;margin-left:10px;font-weight:bold;font-size:15pt;display:inline-block; text-align:center;} */
/* 	#g_menu_6{width:80px;margin-top:10px;margin-left:10px;font-weight:bold;font-size:15pt;display:inline-block; text-align:center;} */
	#community_menu {
		table-layout:fixed;
		width: 100%;
	}
	#community_menu td{
		text-align: center;
	}
	#community_menu th{
		text-align: center;
	}
	
	#listTitle {
		color: black;
	}
	
	#sendMsg {
		color: black;
	}
	
/* 	table td{ */
/* 		border: 1px solid gray; */
/* 	} */
	
/* 	table th{ */
/* 		border: 1px solid gray; */
/* 	} */
</style>
</head>
<body>
	<h2 style=" width:200px; padding: 2%;">전체</h2>
<div align="center">
	<div style="display:inline;">
<%-- 		<form:form method="post" action="${pageContext.request.contextPath }/community/list"> --%>
		
		<table id="community_menu" class="table">
			<tr>
				<th scope="col"><a href="javascript:page(1)">공략</a> </th>
				<th scope="col"><a href="javascript:page(2)">자유</a> </th>
				<th scope="col"><a href="javascript:page(3)">팀원모집</a> </th>
				<th scope="col"><a href="javascript:page(4)">사건사고</a> </th>
				<th scope="col"><a href="javascript:page(5)">Q&A</a> </th>
				<th scope="col"><a href="javascript:page(6)">공지사항</a> </th>
				<th scope="col"><a href="/lol/match/list">경기일정</a> </th>
			</tr>
			<tr>
				<td colspan="2"><a href="javascript:array1('viewCount')">인기 (조회수)</a></td>
				<td colspan="2"><a href="javascript:array1('regdate')">최신 (등록날짜)</a></td>
				<td colspan="2"><a href="javascript:array1('hit')">TOP (추천수)</a></td>
			</tr>
		</table>
		<input type="hidden" name="cNum" value="${ cNum}">
<!-- 		<div id="g_menu"> -->
<!-- 			<div id="g_menu_1"> -->
<!-- 				<a href="javascript:page(1)">공략</a> -->
<!-- 			</div> -->
<!-- 			<div id="g_menu_2"> -->
<!-- 				<a href="javascript:page(2)">자유</a> -->
<!-- 			</div> -->
<!-- 			<div id="g_menu_3"> -->
<!-- 				<a href="javascript:page(3)">팀원모집</a> -->
<!-- 			</div> -->
<!-- 			<div id="g_menu_4"> -->
<!-- 				<a href="javascript:page(4)">사건사고</a> -->
<!-- 			</div> -->
<!-- 			<div id="g_menu_5"> -->
<!-- 				<a href="javascript:page(5)">Q&A</a> -->
<!-- 			</div> -->
<!-- 			<div id="g_menu_6"> -->
<!-- 				<a href="javascript:page(5)">경기일정</a> -->
<!-- 			</div> -->
<!-- 		<select name="field"  style="margin-left: 9%;"> -->
<%-- 			<option value="username"<c:if test="${field=='username' }">selected</c:if>>ID</option> --%>
<%-- 			<option value="title"<c:if test="${field=='title' }">selected</c:if>>제목</option> --%>
<!-- 		</select> -->
<%-- 			<input type="text" name="keyword" value="${keyword }"> --%>
<!-- 			<input type="submit" value="검색"> -->
<%-- 			<div style="float: right; margin-top:1%; margin-right: 4%; font-size: 15px;"><a href="${pageContext.request.contextPath }/community/insert?cNum=${cNum}" style="color: black;">새 글 등록</a></div><br><br> --%>
<!-- 			<div style="margin-left: -50%"> -->
<!-- 				<a href="javascript:array1('viewCount')">인기 (조회수)</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!-- 				<a href="javascript:array1('regdate')">최신 (등록날짜)</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!-- 				<a href="javascript:array1('hit')">TOP (추천수)</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!-- 			</div> -->
<!-- 		</div> -->
<%-- 		</form:form> --%>
	</div>
<%-- 		<form method="post" action="${pageContext.request.contextPath }/community/list"></form> --%>
			<div>
			<table class="table table-hover" style="table-layout:fixed;">
				<colgroup>
					<col style="width: 5%;">
					<col style="width: 15%;">
					<col style="width: 50%;">
					<col style="width: 5%;">
					<col style="width: 5%;">
					<col style="width: 10%;">
				</colgroup>
				<thead>
					<tr>
						<th scope="col" colspan="1">글번호</th>
						<th scope="col" colspan="1">ID</th>
						<th scope="col" colspan="1">제목</th>
						<th scope="col" colspan="1">조회</th>
						<th scope="col" colspan="1">추천</th>
						<th scope="col" colspan="1">등록날짜</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="vo" items="${list }">
					<tr>
						<th scope="row">${vo.pNum }</th>
						<c:choose>
							<c:when test="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username == vo.username}">
								<td>${vo.username }</td>
							</c:when>
							<c:otherwise>
								<td><a href="#" id="sendMsg">${vo.username }</a></td>
							</c:otherwise>
						</c:choose>
						<td><a id="listTitle" href="${pageContext.request.contextPath }/community/detail?pNum=${vo.pNum }&cNum=${vo.cNum }">${vo.title }</a>&nbsp;<c:if test="${vo.commentCount != 0}">[${vo.commentCount }]</c:if></td>
						<td>${vo.viewCount }</td>
						<td>${vo.hit }</td>
						<td>${vo.regdate }</td>
					</tr>
				</c:forEach>
			</table>
			</div>
			<form:form method="post" action="${pageContext.request.contextPath }/community/list">
				<select name="field">
					<option value="username"<c:if test="${field=='username' }">selected</c:if>>ID</option>
					<option value="title"<c:if test="${field=='title' }">selected</c:if>>제목</option>
				</select>
				<input type="text" name="keyword" value="${keyword }">
				<input type="submit" value="검색">
				
					<c:if test="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username != null}">
						<input type="button" onclick="location.href='${pageContext.request.contextPath }/community/insert?cNum=${cNum}'" value="글쓰기" style="float: right;">
					</c:if>
			</form:form>
			<div>
				<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
					<c:choose>
						<c:when test="${i==pu.pageNum }">
							<a href="${pageContext.request.contextPath }/community/list?pageNum=${i}&field=${field}&keyword=${keyword}&cNum=${cNum}">
							<span style='color: blue'>[${i }]</span></a>
						</c:when>
						<c:otherwise>
							<a href="${pageContext.request.contextPath }/community/list?pageNum=${i}&field=${field}&keyword=${keyword}&cNum=${cNum}">
							<span style='color: gray'>[${i }]</span></a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>
	</div>
</body>
<script type="text/javascript">
function page(n){
	console.log(n);
	location.href="${pageContext.request.contextPath }/community/list?cNum="+n;
}
		
// $("input[name='cNum']").val(n);
		
function array1(vrh){
	location.href="${pageContext.request.contextPath }/community/list?cNum=${cNum}&"+"vrh="+vrh;
}

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
		
	</script>
</html>