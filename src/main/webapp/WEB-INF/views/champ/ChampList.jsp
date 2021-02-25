<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript" src="/lol/resources/js/jquery-3.5.1.js"></script>
<style type="text/css">
.charFace img{

padding-top: 40px;
padding-left: 5px;

}
#info{
display: inline-block;
padding-left: 20px;
}
#list { 
border:3px black solid;
position:absolute; 
width:450px;
height:600px;
 display:inline-block;
 right:310px; /* 창에서 오른쪽 길이 */ 
 top:19%; /* 창에서 위에서 부터의 높이 */
  background-color: transparent; 
  margin:0; }
#list input{
width: 145px;
}

</style>
</head>

<body>
<h1>챔피언데이터</h1>
<script type="text/javascript">
$(function(){
	
	
	
	$.ajax({
		url:"/lol/champ/ChampList",
		dataType: 'json',
		type: "get",
		success: function(data){
			$.each(data.map,function(key,value){
				
			
			 
			
				
				$("#charFace").append("<div id='info'><a href='/lol/champ/selectList?championid="+value.championid+"'><image id='"+key+"' src='http://ddragon.leagueoflegends.com/cdn/11.3.1/img/champion/"+value.picture+"'></a><br>"+value.name+"</div>")
			
			})
		
		}
	})


	$(window).scroll(function(){ // 스크롤하면 아래 코드 실행
    var num = $(this).scrollTop();  // 스크롤값
    if( num > -50 ){  // 스크롤을 100 이상 했을 때
      $("#list").css("position","fixed");
      $("#list").css("display","block");
    }else{
      $("#list").css("position","absolute");
      $("#list").css("display","none");
    }
  });

$("#win").click(function(){
	$(".win").css({
		display: "inline",
	})
})

	
	
})
</script>
<div id="all" style="width: 900px;">
<div id="charFace"></div>
<div id="list">
<input type='button' value='픽률순위' id='pick'>
<input type='button' value='승률순위' id='win'>
<input type='button' value='벤률순위' id='ban'>
<div class='win' style="display: none;">
<c:forEach var="list1" items="${win }">
<span>${list1.RANK }위</span><br> 
<span>${list1.NAME }</span><br> 
<span>승률: ${list1.WINRANK }</span><br>
</c:forEach>
</div>

</div>

</div>
</body>
</html>