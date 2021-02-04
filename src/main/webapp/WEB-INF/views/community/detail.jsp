<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>views/community/detail.jsp</title>
<style type="text/css">
	a{ text-decoration:none }
	.insert{margin-top: 5%}
</style>
</head>
<body>
<a href="/lol">홈으로</a><!-- 이미지 클릭시 이동되도록 수정하기 -->
	<div align="center" class="insert">
		<h2>게시글</h2>
		<hr size="2" width="600" color="black" id=line>
		<!-- DB에 username의 임의의 값 넣음 (추후 회원가입 후 진행) -->
		작성자 : <input type="text" name="username" value="abcd" style="width:200px" disabled="disabled">
		&nbsp;&nbsp;&nbsp;&nbsp;
		<!-- DB에 cNum의 임의의 값 넣음 (추후 회원가입 후 진행) -->
		카테고리 : <input type="text" name="cNum" value="1" style="width:200px" disabled="disabled"><br>
		<textarea rows="1" cols="80" name="title" disabled="disabled">${vo.title }</textarea><br>
		<textarea rows="25" cols="80" name="content" disabled="disabled">${vo.content }</textarea><br>
	</div>
</body>
</html>