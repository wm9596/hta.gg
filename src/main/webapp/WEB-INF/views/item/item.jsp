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
			"api_key": "RGAPI-444b7590-2dfd-46af-87c8-f3db9942b2eb",
		},
		success:function(data){
			console.log(data);
			console.log(data.data)
			$.each(data.data,function(key,value){
				console.log("//////////////////////////")
		
				var str="<img src=http://ddragon.leagueoflegends.com/cdn/11.2.1/img/item/"+value.image.full+" style='width:64px; height:64px;'>";
				$(str).appendTo("#itemlist")
				$.ajax({
					url:"iteminsert",
					type:'get',
					data:{iNum:key,icon:value.image.full,name:value.name,price:value.gold.base,effect:value.plaintext},
					
				})
			})
		}
	})
})
</script>

<body>
<h1>ㅎㅇ</h1>
<div id="itemlist"></div>
</body>
</html>