<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript" src="/lol/resources/js/jquery-3.5.1.js"></script>
	<script type="text/javascript">
$(function(){
	$.ajax({
		url:'http://ddragon.leagueoflegends.com/cdn/11.3.1/data/ko_KR/champion.json',
		dataType: 'json',
		success:function(data){
			$.ajax({
				url:"/lol/champ/ChampDelete",
				success:function(){
					$.each(data.data,function(key,value){
						
						$.ajax({
							url:"http://ddragon.leagueoflegends.com/cdn/11.3.1/data/ko_KR/champion/"+key+".json",
							dataType:'json',
							success:function(data){
								
								$.each(data.data,function(key,value){
									console.log(data.data)
									console.log(value);
									console.log(value);
									var name={'id':key,'name':value.name};
									let name1=JSON.stringify(name);
									console.log(name1+"ddddddddddd")
									let p_info=JSON.stringify(value.passive)
									let q_info=JSON.stringify(value.spells[0])
									let w_info=JSON.stringify(value.spells[1])
									let e_info=JSON.stringify(value.spells[2])
									let r_info=JSON.stringify(value.spells[3])
									let tip=JSON.stringify(value.allytips);
									console.log(tip)
									$.ajax({
										url:"/lol/champ/ChampInsert2",
										type: "post",
										dataType: "json",
										
										data:{
											
											name:value.name, skillP_info:p_info,skillQ_info:q_info,skillW_info:w_info,skillE_info:e_info,skillR_info:r_info,picture:value.image.full,
											skillP_icon:value.passive.image.full,skillQ_icon:value.spells[0].image.full,skillW_icon:value.spells[1].image.full,skillE_icon:value.spells[2].image.full,
											skillR_icon:value.spells[3].image.full,
											championid:value.key,story:value.blurb
										},        
					                      
										success:function(data){
											console.log(data);
										}
										
									})
									
									
								})
							
							}
						})
						
					})
				}
			})


		}
	})
	
})
</script>
</body>
</html>