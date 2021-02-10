<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>community/update.jsp</title>
<script type="text/javascript">
	function beforePage(){
		history.go(-1);
		return;
	}
</script>

<style type="text/css">
	a{ text-decoration:none }
	.update{margin-top: 5%}
</style>
</head>
<body><br>
<form:form method="post" action="${pageContext.request.contextPath }/community/update">
	<div align="center" class="update">
		<h2>게시글 수정하기</h2>
		<hr size="2" width="600" color="black" id=line>
		<input type="hidden" name="pNum" value="${vo.pNum }">
		작성자 <input type="text" name="username" value="abcd" style="width:87px; text-align: center;" readonly="readonly">
		<!-- DB에 cNum의 임의의 값 넣음 (추후 회원가입 후 진행) -->
		카테고리 <input type="text" name="cNum" value="1" style="width:87px; text-align: center;" readonly="readonly">
		등록일 <input type="text" value="${vo.regdate }" style="width:87px; text-align: center;" readonly="readonly">
		조회수 <input type="text" value="${vo.viewCount}" style="width:87px; text-align: center;" readonly="readonly"><br><br>
		<textarea rows="1" cols="80" name="title">${vo.title }</textarea><br>
		<textarea rows="25" cols="80" name="content">${vo.content }</textarea><br>
		<input type="button" value="수정취소" onclick="beforePage()">
		<input type="submit" value="수정완료" onclick="update()">
	</div>
</form:form><br>
	<script type="text/javascript">	
	function update(pNum) {
		console.log("===========================");
		var ask = confirm("정말로 수정하시겠습니까?");
		if(ask == true){
		$.ajax({
			url:"/lol/update/"+pNum,
			success: function(data) {
				var code=$(data).find("code").text();
				if(code=='success'){
					getList();
				}else{
					alert('수정 실패!');
				}
			}
		});
		}
	}
</script>
</body>
</html>