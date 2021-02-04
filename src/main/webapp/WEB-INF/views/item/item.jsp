<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="/lol/resources/js/jquery-3.5.1.js"></script>

</head>
<script type="text/javascript">
$(function(){
	$.ajax({
		url:"http://ddragon.leagueoflegends.com/cdn/11.2.1/data/ko_KR/item.json",
		type:'get',
		dataType:'json',
		data:{
			"api_key": "RGAPI-0b2be03b-c5bc-4cbf-a8d6-81e175cb55a3",
		},
		success:function(data){
			console.log(data);
			
			$.each(data.data,function(key,value){
				console.log(key);
				var str3="";
				var str2="<div>"+value.description+"</div><br>";
				var str4="<div>"+value.name+"</div><br>";
				var tags= value.tags[1];
				if(!tags){
					tags=value.tags[0];
				}else{
					tags=value.tags[1];
				}
			 	$.ajax({
					
					url:"iteminsert",
					type:'get',
					dataType: 'json',
					data:{iNum:key,icon:value.image.full,name:value.name,price:value.gold.total,effect:value.description,tags:tags},
					success: function(data){
						 window.location = "/lol/itemlist";
					}
					
					
				}) 
			})
		}
		
	})
})

</script>

<body>
<h1>업데이트중.............................</h1>
<h1>완료후 리스트로 돌아갑니다....</h1>
<div id="itemlist"></div>
<div id="iteminfo"></div>

</body>

</html>