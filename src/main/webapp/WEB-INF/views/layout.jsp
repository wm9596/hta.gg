<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/mainHome.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/matchMore.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/login.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
﻿<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<!-- <link rel="stylesheet" href="/style.css"> -->
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.user-dropdown .dropdown-menu {
	  left: 0;
	  transform: translateX(-50%) !important;
	  top: 100% !important;
	}
	
	.arrow-up {
	  width: 0px;
	  height: 0px;
	  border-left: 10px solid transparent;
	  border-right: 10px solid transparent;
	  border-bottom: 10px solid #FFFFFF;
	  margin: 0 0 15px 0;
	  position: absolute;
	  top: -9px;
	  right: 0;
	}
</style>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<tiles:insertAttribute name="header"/>
		</div>
		<div id="content">
			<tiles:insertAttribute name="content"/>
		</div>
		<div id="footer">
			<tiles:insertAttribute name="footer"/>
		</div>
	</div>
</body>
<script type="text/javascript">


$( ".star_rating a" ).click(function() {
    $(this).parent().children("a").removeClass("on");
    $(this).addClass("on").prevAll("a").addClass("on");
    return false;
});

$(".star_rating_1").click(function(e) {
	$(".ratingValue").val("1")
})

$(".star_rating_2").click(function(e) {
	$(".ratingValue").val("2")
})

$(".star_rating_3").click(function(e) {
	$(".ratingValue").val("3")
})

$(".star_rating_4").click(function(e) {
	$(".ratingValue").val("4")
})

$(".star_rating_5").click(function(e) {
	$(".ratingValue").val("5")
})

$("#ratingSubmit").click(function(e) {
	let value = $(".star_rating input").val();
	if (value == '') {
		alert("평점을 선택해주세요.");
		return;
	}
	postRating(value);
})

function postRating(rate) {
	var nickdiv  = $("#mm_smNicknameDiv");
	if(nickdiv==null){
		return;
	}
	
	let nickname = nickdiv.find("h2").text();
	$.ajax({
		type: "GET",
		url: "/lol/insertRating?rate=" + rate+"&nickname="+nickname,
		dataType: "text",
		success: function(result) {
			let value = $(result).find("ratingAvg").text();
			value = Math.round(value * 10)/10;
			let cnt = $(result).find("ratingCnt").text();
			$("#rate").text(value);
			$("#rateCnt").text("(" + cnt + ")");
			
			if ($(result).find("msg").text() == "err") {
				alert("이미 평가를 완료하였습니다.")
			} else {
				alert("평가가 완료되었습니다.");	
			}
		}
	})
}
</script>
</html>