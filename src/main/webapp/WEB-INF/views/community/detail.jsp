<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>views/community/detail.jsp</title>
<script type="text/javascript">
	function beforePage(){
		history.go(-1);
		return;
	}
	function postDelete(){
		 if (confirm("정말 삭제하시겠습니까??") == true){
		     document.removefrm.submit();
		 }else{
		     return false;
		 }
	}
</script>
<style type="text/css">
	a{ text-decoration:none }
	.insert{margin-top: 5%}
</style>
</head>
<body>
<a href="/lol">홈으로</a><!-- 이미지 클릭시 이동되도록 수정하기 -->
<form:form method="get" action="${pageContext.request.contextPath }/community/update">
	<div align="center" class="insert">
		<h2>게시글 조회하기</h2>
		<hr size="2" width="600" color="black" id=line>
		<input type="hidden" name="pNum" value="${vo.pNum }">
		<!-- DB에 username의 임의의 값 넣음 (추후 회원가입 후 진행) -->
		작성자 : <input type="text" name="username" value="abcd" style="width:99px" readonly="readonly">
		&nbsp;&nbsp;&nbsp;&nbsp;
		<!-- DB에 cNum의 임의의 값 넣음 (추후 회원가입 후 진행) -->
		카테고리 : <input type="text" name="cNum" value="1" style="width:99px" readonly="readonly">
		&nbsp;&nbsp;&nbsp;&nbsp;
		등록일 : <input type="text" value="${vo.regdate }" style="width:99px" readonly="readonly"><br>
		<textarea rows="1" cols="80" name="title" readonly="readonly">${vo.title }</textarea><br>
		<textarea rows="25" cols="80" name="content" readonly="readonly">${vo.content }</textarea><br>
		<input type="button" value="이전 페이지로" onclick="beforePage()">
		<button>게시글 수정</button>
		<input type="button" value="게시글 삭제" onclick="postDelete()">
		<!--
		<a href="${pageContext.request.contextPath }/community/delete?pNum=${vo.pNum }" style="position: right;">게시글 삭제</a>
		-->
	</div>
</form:form>
</body>
</html>