<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>views/community/insert.jsp</title>
<script type="text/javascript">
	function beforePage(){
		history.go(-1);
		return;
	}
</script>
<style type="text/css">
	a{ text-decoration:none }
	.insert{margin-top: 5%}
</style>
</head>
<body><br>
<form:form method="post" action="${pageContext.request.contextPath }/community/insert">
	<div align="center" class="insert">
		<h2>커뮤니티 글쓰기</h2>
		<hr size="2" width="600" color="black" id=line>
		<!-- 작성자 : <input type="text" name="username" value="abcd" style="width:200px" readonly="readonly"> --><!-- DB에 username의 임의의 값 넣음 (추후 회원가입 후 진행) -->
		작성자 <input type="text" name="username" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}" style="width:220px" readonly="readonly">
		&nbsp;&nbsp;&nbsp;&nbsp;
		카테고리 <input type="text" name="cNum" value="${cNum }" style="width:220px" readonly="readonly"><br><br><!-- DB에 cNum의 임의의 값 넣음 (추후 회원가입 후 진행) -->
		<textarea rows="1" cols="80" placeholder="제목을 입력해 주세요." name="title" required="required"></textarea><br>
		<textarea rows="25" cols="80" placeholder="내용을 입력하세요." name="content" required="required"></textarea><br>
		<input type="button" value="이전 페이지로" onclick="beforePage()">
		<input type="submit" value="새 글 등록" onclick="insert()">
	</div><br>
</form:form>
<script type="text/javascript">
	function insert(pNum) {
		console.log("===========================");
		var ask = confirm("게시글을 등록하시겠습니까?");
		if(ask == true){
		$.ajax({
			url:"/lol/insert/"+pNum,
			success: function(data) {
				var code=$(data).find("code").text();
				if(code=='success'){
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