<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/mainHome.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/matchMore.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
﻿<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	*{margin:0px;padding:0px;}
	#myPage_wrap{width:1200px; margin:auto;}
	#myPage_Menu{width:250px;height:470px;float:left;padding:20px;border-bottom:2px solid #DDDDDD;border-right:2px solid #DDDDDD;border-radius: 10px;  padding-bottom: 100px;}
	#myPage_Menu h2{font-weight:bold; color:#555555;font-family: 'Noto Serif KR', serif;}
	#myPage_Menu a{color:black;text-decoration: none; font-weight:bold;color:#CCCCCC;font-family: 'Noto Serif KR', serif;}
	#myPage_Menu a:hover{color:#888888;}
	#myPage_section{width:960px; padding-top:20px; height:500px;}
</style>
<script type="text/javascript">
	function delchk(){
		if(confirm("회원탈퇴하시겠습니까?")){
			$.ajax({
				url:"/lol/member/member/delete",
				success: function(data){
					var result = $(data).find("result").text();
					if(result == 'success'){
						document.out.submit();
					}else{
						alert("회원탈퇴하는데 실패하였습니다.");
					}
				}
			});
			return true;
		} else{
			return false;
		}
	}	
</script>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<tiles:insertAttribute name="header"/>
		</div>
		<div id="content">
			<div id="myPage_wrap">
				<div id="myPage_Menu">
					<h2>My Page</h2><br>
					<h4><a href="${pageContext.request.contextPath }/member/member/info">내 정보</a></h4>
					<h4><a href="${pageContext.request.contextPath }/member/member/profile">프로필등록</a></h4>
					<h4><a href="">포인트 적립<br> 내역 조회</a></h4>
					<h4><a href="">내가 쓴 글,<br> 댓글 조회</a></h4>
					<h4><a href="">받은 쪽지 조회</a></h4>
					<h4><a href="">스크랩 한 게시글 모아보기</a></h4>
					<form:form method="post" name="out" action="${pageContext.request.contextPath }/member/logout">
						<h4><a href="javascript:delchk()" >회원탈퇴</a></h4>
					</form:form>
				</div>
				<div id="myPage_section">
					<tiles:insertAttribute name="content"/>
				</div>
			</div>
		</div>
		<div id="footer">
			<tiles:insertAttribute name="footer"/>
		</div>
	</div>
</body>
</html>