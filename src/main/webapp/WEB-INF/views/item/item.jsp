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
				console.log(value.tags[0]);
				 var str="<img src=http://ddragon.leagueoflegends.com/cdn/11.2.1/img/item/"+value.image.full+" style='width:64px; height:64px;'>";
				 
				$(str).appendTo("#itemlist").addClass("iteminfo");
	
			 	$.ajax({
					
					url:"iteminsert",
					type:'get',
					dataType: 'json',
					data:{iNum:key,icon:value.image.full,name:value.name,price:value.gold.base,effect:value.description,tags:value.tags[0]},
					success: function(data){
						console.log(data)
						alert(data);
					}
					
					
				}) 
			})
		}
		
	})
})

</script>

<body>
<h1>ㅎㅇ</h1>
<div id="itemlist"></div>
<div id="iteminfo"></div>
<a href="/lol/itemlist">dd</a>
</body>

</html>