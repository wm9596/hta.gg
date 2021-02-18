<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript" src="/lol/resources/js/jquery-3.5.1.js"></script>
<style type="text/css">
.charFace img{
width: 82px;
height: 98px;
padding-top: 40px;
padding-left: 5px;

}

</style>
</head>

<body>
<script type="text/javascript">
$(function(){
	$.ajax({
		url:"/lol/champ/ChampList",
		dataType: 'json',
		type: "get",
		success: function(data){
			$.each(data.map,function(key,value){
				
		
			 
			
			
				$("#charFace").append("<a href='/lol/champ/selectList?championid="+value.championid+"'><image id='"+key+"' src='http://ddragon.leagueoflegends.com/cdn/11.3.1/img/champion/"+value.picture+"'></a>").addClass("charFace");
				$("#"+key).append("<br><span>dd</span>");
			})
		
		}
	})
})
</script>
<div id="all" style="width: 550px;">
<div id="charFace"></div>
</div>
</body>
</html>