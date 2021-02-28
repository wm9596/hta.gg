<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#main{
position: relative;
}
.content {
  border: 3px solid black;
  border-radius: 25px;
  background-color: #ffffff; 
  position:absolute;
 background-color:black;
  width: 30%;
  height: auto;
  color:white;

}

img{
margin: 2px;}
h1{
color: white;}
stats{
color: #fafad2 ;}
rules{
color: #00ffff ;}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/lol/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(function() {
		$
				.ajax({
					contentType : 'application/json',
					url : "/lol/itemlist",
					type : 'get',
					dataType : 'json',

					success : function(data) {
					
						$
								.each(
										data,
										function(key, value) {

											var str2 = "<img src=http://ddragon.leagueoflegends.com/cdn/11.2.1/img/item/"+value.icon+" style='width:60px; '"+ 
											"onmouseover='iteminfoinfo("+value.inum+")' onmouseout='iteminfo2()'>";
											if(value.price<=500 && value.name!='전령의 눈' || value.tags=='SpellVamp' || value.tags=='Jungle'){
												$(str2).appendTo('#start').addClass("iteminfo");
											}else if(value.tags=='Boots' || value.tags=='MagicPenetration' || value.name=="헤르메스의 발걸음"){
												$(str2).appendTo('#boots').addClass("iteminfo");
											}
											else if(value.tags=='Active' || value.tags=='Consumable' || value.tags=='Trinket'){
												$(str2).appendTo('#actives').addClass("iteminfo");
											}else if(value.tags=='SpellDamage' || value.name=='리치베인' || value.tags=='ManaRegen'){
												$(str2).appendTo('#mana').addClass("iteminfo");
											}else if(value.tags=='AttackSpeed' || value.tags=='CriticalStrike' || value.tags=='OnHit'){
												$(str2).appendTo('#attackSpeed').addClass("iteminfo");
											}else if(value.tags=='Mana'){
												$(str2).appendTo('#mana').addClass("iteminfo");
											}else if(value.tags=='Armor' || value.tags=='Health' || value.tags=='SpellBlock' || value.tags=='HealthRegen' || value.tags=='NonbootsMovement') {
												$(str2).appendTo('#armor').addClass("iteminfo");
											}else if(value.tags=='CriticalStrike'){
												$(str2).appendTo('#critical').addClass("iteminfo");
											}else if(value.tags=='Trinket' || value.tags=='ArmorPenetration' || value.tags=='CriticalStrike' ||value.tags=='LifeSteal' || value.tags=='Damage' || value.tags=='ArmorPenetration' || value.tags=='Vision' || value.tags=='ArmorPenetration' || value.tags=='Vision' || value.tags=='SpellVamp' || value.tags=='Stealth'){
												$(str2).appendTo('#demege').addClass("iteminfo");
											}else if(value.tags=='Demage'){
												$(str2).appendTo('#demege').addClass("iteminfo");
											}else if(value.tags='null'){
												$(str2).appendTo('#actives').addClass("iteminfo");
											}
											console.log("dd");
											
										})
										
					}
				})

	});
	function iteminfoinfo(inum){
		console.log(event.clientX);
		var x=event.clientX;
		var y=event.clientY;
		$.ajax({
			contentType : 'application/json',
			url : "/lol/iteminfo?inum="+inum,
			dataType: 'json',
			success:function(data){
				
				
	
				var nameeffect="<div><h2>"+data.name+"</h2><p>가격:"+data.price+"<br><img src=http://ddragon.leagueoflegends.com/cdn/11.2.1/img/item/"+data.icon+" style='width:50px; height:50px;'><br>"+data.effect+"</div>";
				$("#effect").empty();
					$(nameeffect).appendTo("#effect").toggleClass("content")
					console.log(y)
					$(".content").css("left",x+50+"px");
					$(".content").css("top",y+"px");
					//ddd
			}
		})
	}
	function iteminfo2(){
	
		$("#effect").empty();
	}
</script>
</head>
<body>
	<div style="width:100%;height: 100%; background-color: black" id="main">
	<div id="start"><h1>스타팅추천</h1></div>
	<div id="actives"><h1>특수사용효과</h1></div>
	<div id="mana"><h1>마법공격</h1></div>
	<div id="armor" ><h1>방어특화</h1></div>
	<div id="attackSpeed"><h1>공격속도특화&&치명타</h1></div>
	<div id="boots" ><h1>이동속도</h1></div>
	<div id="demege" ><h1>물리공격</h1></div>
	<div id="iteminfo" ></div>
	<div id="effect"></div>
	
	</div>
	<c:if test="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username eq 'admin'}">
	<a href="/lol/item">업데이트</a>
	</c:if>
</body>
</html>