<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript" src="/lol/resources/js/jquery-3.5.1.js"></script>
<style type="text/css">
.skill_info {
  border: 3px solid black;
  border-radius: 25px;
  background-color: #ffffff; 
  position:absolute;
 background-color:black;
  width: 30%;
  height: auto;
  color:white;
}
#skillIcon img{
padding-left: 10px;
}
status{
	color:#50B4FF;
}
#selectSkill p{
color:#50B4FF;
}
#name{
	font-size: 50px;
	color:	#8B4F1D	;
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
</style>
</head>

<body>
<script type="text/javascript">

$(function(){
	var list=${championid}
	console.log(list)
	$.ajax({
		url:"/lol/champ/selectList1", 
		data:{
			championid:list
			},
		dataType: 'json',
		success: function(data){
		console.log(data);
		 


			let Q=JSON.parse(data.skillQ_info);
			let W=JSON.parse(data.skillW_info);
			let E=JSON.parse(data.skillE_info);
			let R=JSON.parse(data.skillR_info);
		console.log(Q.name)
						let skillp = JSON.parse(data.skillP_info);
						let SkillP = skillp.description;
						
		
		
	
		
	let q_ = Q.tooltip.split("{");
						console.log(q_[2].indexOf('}}'));
						var q_sum = "";
						for (var kk = 0; kk <= q_.length; kk += 2) {
							console.log(kk);
							q_sum += "?"
									+ q_[kk].substring(
											q_[kk].indexOf('}}') + 2,
											q_[kk].length);

						}
						let SkillQ = "<p>"+Q.name+"</p><br>"+q_[0] + q_sum;
						
						
	
	let w_ = W.tooltip.split("{");
						console.log(w_[2].indexOf('}}'));
						var w_sum = "";
						for (var kk = 0; kk <= w_.length; kk += 2) {
							console.log(kk);
							w_sum += "?"
									+ w_[kk].substring(
											w_[kk].indexOf('}}') + 2,
											w_[kk].length);

						}
						let SkillW = "<p>"+W.name+"</p><br>"+w_[0] + w_sum;

						let e_ = E.tooltip.split("{");
						console.log(e_[2].indexOf('}}'));
						var e_sum = "";
						for (var kk = 0; kk <= e_.length; kk += 2) {
							console.log(kk);
							e_sum += "?"
									+ e_[kk].substring(
											e_[kk].indexOf('}}') + 2,
											e_[kk].length);

						}
						let SkillE = "<p>"+E.name+"</p><br>"+e_[0] + e_sum;

						let r_ = R.tooltip.split("{");
						console.log(r_[2].indexOf('}}'));
						var r_sum = "";
						for (var kk = 0; kk <= r_.length; kk += 2) {
							console.log(kk);
							r_sum += "?"
									+ r_[kk].substring(
											r_[kk].indexOf('}}') + 2,
											r_[kk].length);

						}
						let SkillR = "<p>"+R.name+"</p><br>"+r_[0] + r_sum;

						$("#picture")
								.append(
										"<img src='http://ddragon.leagueoflegends.com/cdn/11.4.1/img/champion/"+data.picture+"'>");
						$("#name").append(data.name);
						$("#story").append(data.story);
				
						$("#skillIcon")
								.append(
										"<img  id='sp' src='http://ddragon.leagueoflegends.com/cdn/11.4.1/img/passive/"+data.skillP_icon+"'>");
						$("#skillIcon")
								.append(
										"<img  id='sq' src='http://ddragon.leagueoflegends.com/cdn/11.4.1/img/spell/"+data.skillQ_icon+"'>");
						$("#skillIcon")
								.append(
										"<img  id='sw' src='http://ddragon.leagueoflegends.com/cdn/11.4.1/img/spell/"+data.skillW_icon+"'>");
						$("#skillIcon")
								.append(
										"<img  id='se' src='http://ddragon.leagueoflegends.com/cdn/11.4.1/img/spell/"+data.skillE_icon+"'>");
						$("#skillIcon")
								.append(
										"<img  id='sr' src='http://ddragon.leagueoflegends.com/cdn/11.4.1/img/spell/"+data.skillR_icon+"'>");
						$("#story").append("<p>" + data.story + "</p>")

						$("#sp").hover(
								function() {
									$("<div><status>"+skillp.name+"</status><br><br><br>"+ SkillP + "</div>").appendTo(
											"#selectSkill").addClass(
											"skill_info");
								}, function() {
									$("#selectSkill").empty();
								})

						$("#sq").hover(
								function() {
									$("<div>" + SkillQ + "</div>").appendTo(
											"#selectSkill").addClass(
											"skill_info");
								}, function() {
									$("#selectSkill").empty();
								})

						$("#sw").hover(
								function() {
									$("<div>" + SkillW + "</div>").appendTo(
											"#selectSkill").addClass(
											"skill_info");
								}, function() {
									$("#selectSkill").empty();
								})

						$("#se").hover(
								function() {
									$("<div>" + SkillE + "</div>").appendTo(
											"#selectSkill").addClass(
											"skill_info");
								}, function() {
									$("#selectSkill").empty();
								})

						$("#sr").hover(
								function() {
									$("<div>" + SkillR + "</div>").appendTo(
											"#selectSkill").addClass(
											"skill_info");
								}, function() {
									$("#selectSkill").empty();
								})
						var name = data.picture;
						var name1 = name.substring(0, name.length - 4);

						console.log(name1);
						$
								.ajax({
									url : "http://ddragon.leagueoflegends.com/cdn/11.4.1/data/ko_KR/champion/"
											+ name1 + ".json",
									dataType : 'json',
									success : function(data) {
										
								let num5=		data.data[""+name1+""].recommended.length-1;
								
											console.log(name1);
											console.log(data);
											console.log(data.data[""+name1+""].recommended[num5].blocks[0].items[1]);
									
											$("#simte").append("<img src='https://ddragon.leagueoflegends.com/cdn/11.4.1/img/item/"+data.data[""+name1+""].recommended[num5].blocks[0].items[0].id+".png'>");
											$("#simte").append("<img src='https://ddragon.leagueoflegends.com/cdn/11.4.1/img/item/"+data.data[""+name1+""].recommended[num5].blocks[0].items[1].id+".png'>");
											$("#simte").append("<img src='https://ddragon.leagueoflegends.com/cdn/11.4.1/img/item/"+data.data[""+name1+""].recommended[num5].blocks[0].items[2].id+".png'>");
											$("#hackitem").append("<img src='https://ddragon.leagueoflegends.com/cdn/11.4.1/img/item/"+data.data[""+name1+""].recommended[num5].blocks[2].items[0].id+".png'>");
											$("#hackitem").append("<img src='https://ddragon.leagueoflegends.com/cdn/11.4.1/img/item/"+data.data[""+name1+""].recommended[num5].blocks[2].items[1].id+".png'>");
											$("#hackitem").append("<img src='https://ddragon.leagueoflegends.com/cdn/11.4.1/img/item/"+data.data[""+name1+""].recommended[num5].blocks[2].items[2].id+".png'>");
											$("#hackitem").append("<img src='https://ddragon.leagueoflegends.com/cdn/11.4.1/img/item/"+data.data[""+name1+""].recommended[num5].blocks[2].items[3].id+".png'>");
											$("#hackitem").append("<img src='https://ddragon.leagueoflegends.com/cdn/11.4.1/img/item/"+data.data[""+name1+""].recommended[num5].blocks[2].items[4].id+".png'>");
											$("#hackitem").append("<img src='https://ddragon.leagueoflegends.com/cdn/11.4.1/img/item/"+data.data[""+name1+""].recommended[num5].blocks[2].items[5].id+".png'>");
									
										$("#simte img").hover(function(){
										let simteimg=$(this).attr('src');
										console.log(simteimg.substr(simteimg.length-8, 4));
										let simteimg1=simteimg.substr(simteimg.length-8, 4);
											$.ajax({
												url:'/lol/select/iteminfo',
												data:{
													inum:simteimg1
												},
												success:function(data){
													console.log(data);
													var nameeffect="<div><h2>"+data.name+"</h2><p>가격:"+data.price+"<br><img src=http://ddragon.leagueoflegends.com/cdn/11.4.1/img/item/"+data.icon+" style='width:50px; height:50px;'><br>"+data.effect+"</div>";
													$("#itemcon").append(nameeffect).addClass("content");
												}
											})
										
											},function(){
												$("#itemcon").empty();
												$("#itemcon").removeClass("content");
											})
											$("#hackitem img").hover(function(){
												let simteimg=$(this).attr('src');
												console.log(simteimg.substr(simteimg.length-8, 4));
												let simteimg1=simteimg.substr(simteimg.length-8, 4);
													$.ajax({
														url:'/lol/select/iteminfo',
														data:{
															inum:simteimg1
														},
														success:function(data){
															console.log(data);
															var nameeffect="<div><h2>"+data.name+"</h2><p>가격:"+data.price+"<br><img src=http://ddragon.leagueoflegends.com/cdn/11.4.1/img/item/"+data.icon+" style='width:50px; height:50px;'><br>"+data.effect+"</div>";
															$("#itemcon").append(nameeffect).addClass("content");
														}
													})
												
													},function(){
														$("#itemcon").empty();
														$("#itemcon").removeClass("content");
													})
								
						
										
									}
								})

					}

				})


	})
</script>
<div id="ChampList" style="background-color: 	#D2D2FF; width: 800px;">
<div id="picture"></div>
<div id="name"></div>
<div id="skillIcon"></div>
<div id="simte">
<h3>스타팅 추천아이템</h3>
</div>
<div id="hackitem">
<h3>챔피언별 추천아이템</h3>
</div>
<div id="itemcon"></div>
<div id="selectSkill"></div>
<div id="skillinfo"></div>
<div id="story"></div>
<div id="nn"></div>

</div>
</body>
</html>