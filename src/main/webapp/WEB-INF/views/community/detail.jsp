<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>views/community/detail.jsp</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript">

	function beforePage(){
		history.go(-1);
		return;
	}

	function getList() {
		$.ajax({
			url:"/lol/reply/${vo.pNum}",
			dataType: 'xml',
			success: function(data){
				var commList = document.getElementById("commList");
				var childs = commList.childNodes;
				for(let i=childs.length-1; i>=0; i--){
					var child=childs.item(i);
					commList.removeChild(child);
				}
				$(data).find("content").each(function(){
					var rNum = $(this).find("rNum").text();
					var pNum = $(this).find("pNum").text();
					var rWriter = $(this).find("rWriter").text(); 
					var rContent = $(this).find("rContent").text();
					var regdate = $(this).find("regdate").text();
					var rHit = $(this).find("rHit").text();
					var rNohit = $(this).find("rNohit").text();
					var div = document.createElement("div");
					div.innerHTML=rWriter+"&nbsp;&nbsp;&nbsp;"+rContent+"<br>"
												+regdate+"&nbsp;&nbsp;&nbsp;"
												+"<a href='javascript:replyHit("+ rNum + ")'>추천</a>[" + rHit +"]&nbsp;&nbsp;"
												+"<a href='javascript:replyNohit("+ rNum + ")'>반대</a>[" + rNohit +"]&nbsp;&nbsp;"
												+"<a href='#'>답글</a>"+"&nbsp;&nbsp;"
												+"<a href='javascript:removeComm("+ rNum + "," + pNum + ")'>삭제</a>";
					div.className="comm";
					commList.append(div);
				});
			}
		});
	}
	
	getList();
	
</script>
<style type="text/css">
	a{ text-decoration:none; color: black; }
	.insert{margin-top: 5%}
	.comm{margin-bottom: 20px; margin-left: 22%; width: 600px; border: 1px solid #aaa;position: relative;}
</style>
</head>
<body><br>
<form:form method="get" action="${pageContext.request.contextPath }/community/update">
	<div align="center" class="insert">
		<h2>게시글 조회하기</h2>
		<hr size="2" width="600" color="black" id=line>
		<input type="hidden" name="pNum" value="${vo.pNum }">
		<!-- DB에 username의 임의의 값 넣음 (추후 회원가입 후 진행) -->
		작성자 <input type="text" name="username" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}" style="width:87px; text-align: center;" readonly="readonly">
		<!-- DB에 cNum의 임의의 값 넣음 (추후 회원가입 후 진행) -->
		카테고리 <input type="text" name="cNum" value="${vo.cNum }" style="width:87px; text-align: center;" readonly="readonly" >
		등록일 <input type="text" value="${vo.regdate }" style="width:87px; text-align: center;" readonly="readonly">
		조회수 <input type="text" value="${vo.viewCount+1}" style="width:87px; text-align: center;" readonly="readonly"><br><br>
		<textarea rows="1" cols="80" name="title" readonly="readonly">[제목] ${vo.title }</textarea><br>
		<textarea rows="25" cols="80" name="content" readonly="readonly">${vo.content }</textarea><br>
		<input type="button" value="이전 페이지로" onclick="beforePage()">
		<button>게시글 수정</button>
		<input type="button" value="게시글 삭제" onclick="postDelete(${vo.pNum})">
		<!--
		<a href="${pageContext.request.contextPath }/community/delete?pNum=${vo.pNum }" style="position: right;">게시글 삭제</a>
		-->
	</div><br><br><br>
</form:form>
	<div align="center">
		<button type="button" id="hit" class="btn btn-info likeBtn"	style="width: 100px; height: 50px; font-size: 25px;">추천 ${vo.hit }</button>
		<button type="button" id="nohit" class="btn btn-info likeBtn" style="width: 100px; height: 50px; font-size: 25px;">반대 ${vo.nohit }</button>
		<button type="button" id="report" class="btn btn-info likeBtn" style="width: 100px; height: 50px; font-size: 25px;" onclick="report()">신고</button>
	</div>
		<br><br><br>
		<div align="center">
			<div style="display: inline-block;">
				다음 글&nbsp;&nbsp;&nbsp;<br>
				이전 글&nbsp;&nbsp;&nbsp;
			</div>
			<div  style="display: inline-block;">
				<a href='${pageContext.request.contextPath }/community/detail?pNum=${next.pNum}&cNum=${vo.cNum}'>${next.title }</a><br>
				<a href='${pageContext.request.contextPath }/community/detail?pNum=${prev.pNum}&cNum=${vo.cNum}'>${prev.title }</a>
				<!-- 태그 안에 조건문 -->
			</div>
		</div>
		<br><br><br>
		<!-- 댓글 목록 -->
		<h3 style="margin-left: 22%">댓글 입력</h3>
		<div align="center">
			<hr size="2" width="600" color="black" id=line>
		</div>
		<div >
			<div id="commList">
		</div><br>
			<div align="center">
			<div id="commAdd" style="display: inline-block;">
				아이디 <input type="text" id="rWriter" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}" readonly="readonly">
				댓글 <input type="text" id="rContent" style="width:250px">
				<input type="button" value="댓글등록" id="btn"><br><br><br>
			</div>
			</div>
		</div>

<script type="text/javascript">

	$("#hit").click(function(e){
		var ask=confirm("해당 게시글을 추천하시겠습니까?");
		if(ask == true){
		$.ajax({
			url:"/lol/update/" + ${vo.pNum },
			success: function(data){
				$("#hit").html('추천'+data);
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
				$("#nohit").html('반대'+data);
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
			}
		});
		}
	}

</script>
</body>
</html>