<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript" src="/lol/resources/js/jquery-3.5.1.js"></script>
<script src="/lol/resources/dist/circle-progress.js"></script>
<style type="text/css">
#ChampList{
position:relative;
left:70px;
background-color: 	#D2D2FF; 
width: 1200px;
height: 770px;
}
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
#pickben{
background-color:	#FFF0F0;
position: absolute;
border: 3px solid black;
width: 300px;
height:400px;
top:5px;
left: 74%;
}
#story{
position: absolute;
border: 3px solid black;
width: 300px;
height: 100px;
top:405px;
text-overflow: ellipsis;
overflow: hidden;
white-space: nowrap;
background-color: 	#FFA500;
}
#gametip{
position: absolute;
border: 3px solid black;
width: 300px;
height: 100px;
top:525px;
background-color:	#54BD54;
text-overflow: ellipsis;
overflow: hidden;
white-space: nowrap;
}
#story2{
	position: absolute;
	border:3px solid #69A8AA;
	background-color: 		#FFA500;
	top:413px;
	left:891px;
	width: 300px;
	display: none;
	color:	black;
}
#gametip2{
	position: absolute;
	border:3px solid #69A8AA;
	background-color: 		#54BD54;
	top:413px;
	left:891px;
	width: 300px;
	display: none;
	color:	black;
}
.buttonCol{
	width: 98px;
}
.sic{
padding-left: 50px;
}
#whichi{
display:inline-block;
position: absolute;
right: 90px;
top:198px;
}
#whichi h1{
padding-left: 80px;
}
#pickben div h1{
padding-left: 70px;
display: inline-block;
}
#pickben div h2{
color:	#5EC75E;
padding-left: 70px;
display: inline-block;
}
#pickben div h4{
color:red;
padding-left: 30px;
display: inline-block;
}
</style>
</head>

<body>
<script type="text/javascript">

$(function(){
	var list=${championid}
	
	
	$.ajax({
		url:"/lol/champ/count",
		data:{
			championid:list
		},
		dataType:'json',
		success:function(data){
			
			console.log(data)
			$("<input type='button' value='픽률' id='pickbtn'>").appendTo("#pickben").addClass('buttonCol')
			$("<input type='button' value='승률' id='winbtn'>").appendTo("#pickben").addClass('buttonCol')
			$("<input type='button' value='벤률' id='banbtn'>").appendTo("#pickben").addClass('buttonCol')
			$("#pickbtn").css({
					border: "3px solid red",
				})
			$("#pickben").append("<div id='pickben2'><h2>"+data.maxCount.RANK+"위&nbsp&nbsp&nbsp/</h2><h4>"+data.allCount.MAXCOUNT+"</h4><h1>"+data.maxCount.NAME+"</h1></div><div class='sic'><strong></strong></div>")
			  $('.sic').circleProgress({
				  value: data.matchcount/100,
				    startAngle:300,
				    size:200,
				    fill:{
				      gradient:["#46BEFF","#F4FFFF"],
				      gradientAngle: Math.PI / 2
				    },
				    animation:{
				      duration:2200,
				      easing:"swing"
				    },
				    lineCap : "butt",
				    reverse:true,
				    thickness:10,
				          
				  }).on('circle-animation-progress', function(event, progress) {
			          $(this).find('strong').html("<h1 id='whichi'>"+Math.round(data.matchcount * progress) + '%</h1><br<br><br><span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp'+data.matchcount+"번의 게임플레이</span>");
				    });
			$("#banbtn").click(function(){
				$(this).css({
					border: "3px solid red",
				})
					$("#winbtn").css({
					border: "none",
				})
					$("#pickbtn").css({
					border: "none",
				})
				$("#pickben2").empty();
				$(".sic").empty();	
				$("#pickben2").append("<div><h2>"+data.banrank.BANRANK
						+"위&nbsp&nbsp&nbsp/</h2><h4>"+data.allCount.MAXCOUNT+"</h4><h1>"+data.maxCount.NAME+"</h1></div><div class='sic'><strong></strong></div>")
				 $('.sic').circleProgress({
					  value: data.banrank.PER/100,
					    startAngle:300,
					    size:200,
					    fill:{
					      gradient:["#46BEFF","#F4FFFF"],
					      gradientAngle: Math.PI / 2
					    },
					    animation:{
					      duration:2200,
					      easing:"swing"
					    },
					    lineCap : "butt",
					    reverse:true,
					    thickness:10,
					          
					  }).on('circle-animation-progress', function(event, progress) {
						  $(this).find('strong').html("<h1 id='whichi'>"+Math.round(data.banrank.PER * progress) + '%</h1><br<br><br><span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp'+data.matchcount+"번의 게임플레이</span>");
					    });
			})	
			$("#pickbtn").click(function(){
				$(this).css({
					border: "3px solid red",
				})
					$("#banbtn").css({
					border: "none",
				})
					$("#winbtn").css({
					border: "none",
				})
				console.log($("#pickben2").parent().children()[7]);
				$("#pickben2").empty();
				$(".sic").empty();	
				$("#pickben2").append("<div><h2>"+data.maxCount.RANK
						+"위&nbsp&nbsp&nbsp/</h2><h4>"+data.allCount.MAXCOUNT+"</h4><h1>"+data.winrank.NAME+"</h1></div><div class='sic'><strong></strong></div>")
				 $('.sic').circleProgress({
					  value: data.matchcount/100,
					    startAngle:300,
					    size:200,
					    fill:{
					      gradient:["#46BEFF","#F4FFFF"],
					      gradientAngle: Math.PI / 2
					    },
					    animation:{
					      duration:2200,
					      easing:"swing"
					    },
					    lineCap : "butt",
					    reverse:true,
					    thickness:10,
					          
					  }).on('circle-animation-progress', function(event, progress) {
						  $(this).find('strong').html("<h1 id='whichi'>"+Math.round(data.matchcount * progress) + '%</h1><br<br><br><span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp'+data.matchcount+"번의 게임플레이</span>");
					    });
			})
			$("#winbtn").click(function(){
				$(this).css({
					border: "3px solid red",
				})
				$("#pickbtn").css({
					border: "none",
				})
					$("#pickbtn").css({
					border: "none",
				})
				
				$("#pickben2").empty();
				$(".sic").empty();	
				$("#pickben2").append("<div><h2>"+data.winrank.RANK
						+"위&nbsp&nbsp&nbsp/</h2><h4>"+data.allCount.MAXCOUNT+"</h4><h1>"+data.banrank.NAME+"</h1></div><div class='sic'><strong></strong></div>")
				 $('.sic').circleProgress({
					  value: data.winrank.WINRANK/100,
					    startAngle:300,
					    size:200,
					    fill:{
					      gradient:["#46BEFF","#F4FFFF"],
					      gradientAngle: Math.PI / 2
					    },
					    animation:{
					      duration:2200,
					      easing:"swing"
					    },
					    lineCap : "butt",
					    reverse:true,
					    thickness:10,
					          
					  }).on('circle-animation-progress', function(event, progress) {
						  $(this).find('strong').html("<h1 id='whichi'>"+Math.round(data.winrank.WINRANK * progress) + '%</h1><br<br><br><span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp'+data.matchcount+"번의 게임플레이</span>");
						 
					    });
			})
		}
		
	})	

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
						$("<div><h3 style='color:black;'>스토리</h3><a style='color:black' id='storyboard' href='#'>"+data.story+"</a></div>").appendTo("#story")
						$("<div><h3 style='color:black;'>게임팁</h3><a style='color:black' id='storyboard' href='#'>"+data.tip+"</a></div>").appendTo("#gametip")
						$("#story").hover(function(){
							
							
							$("#story2").append("<span>"+data.story+"</span>");
							$("#story2").css({
								display: "inline"
							})
							
						},function(){
							$("#story2").css({
								display: "none"
							})
							$("#story2").empty();
							
						})
						$("#gametip").hover(function(){
							
							
							$("#gametip2").append("<span>"+data.tip+"</span>");
							$("#gametip2").css({
								display: "inline"
							})
							
						},function(){
							$("#gametip2").css({
								display: "none"
							})
							$("#gametip2").empty();
							
						})
						
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
						$.ajax({
								url : "/lol/champ/itemtree",
								dataType : 'json',
								data:{
										championid:list
									},
									success : function(data) {
											console.log(data);
											console.log(data.itemlist[0].ITEM1);	
											var spell1num=data.itemlist[0].SPELL1
											var spell2num=data.itemlist[0].SPELL2
											var spell1_img="";
											var spell2_img="";
											var spellinfo="";
											var spellinfo2="";
											if(data.itemlist[0]){
											$("#simte").append("<img src='https://ddragon.leagueoflegends.com/cdn/11.4.1/img/item/"+data.itemlist[0].ITEM1+".png'>");
											$("#simte").append("<img src='https://ddragon.leagueoflegends.com/cdn/11.4.1/img/item/"+data.itemlist[0].ITEM2+".png'>");
											$("#simte").append("<img src='https://ddragon.leagueoflegends.com/cdn/11.4.1/img/item/"+data.itemlist[0].ITEM3+".png'>");
											$.ajax({
												url:'http://ddragon.leagueoflegends.com/cdn/11.4.1/data/ko_KR/summoner.json',
												dataType:'json',
												success:function(data){
													console.log(data.data)
													if(data.data.SummonerBarrier.key==spell1num){
														spell1_img=data.data.SummonerBarrier.image.full;
														spellinfo=data.data.SummonerBarrier.description
													}else if(data.data.SummonerBoost.key==spell1num){
														spell1_img=data.data.SummonerBoost.image.full
														
														spellinfo=data.data.SummonerBoost.description
													}else if(data.data.SummonerDot.key==spell1num){
														spell1_img=data.data.SummonerDot.image.full
														
														spellinfo=data.data.SummonerDot.description
													}else if(data.data.SummonerExhaust.key==spell1num){
														spell1_img=data.data.SummonerExhaust.image.full
														
														spellinfo=data.data.SummonerExhaust.description
													}else if(data.data.SummonerFlash.key==spell1num){
														spell1_img=data.data.SummonerFlash.image.full
														
														spellinfo=data.data.SummonerFlash.description
													}else if(data.data.SummonerHaste.key==spell1num){
														spell1_img=data.data.SummonerHaste.image.full
														
														spellinfo=data.data.SummonerHaste.description
													}else if(data.data.SummonerHeal.key==spell1num){
														spell1_img=data.data.SummonerHeal.image.full
														
														spellinfo=data.data.SummonerHeal.description
													}else if(data.data.SummonerMana.key==spell1num){
														spell1_img=data.data.SummonerMana.image.full
														
														spellinfo=data.data.SummonerMana.description
													}else if(data.data.SummonerPoroRecall.key==spell1num){
														spell1_img=data.data.SummonerPoroRecall.image.full
														
														spellinfo=data.data.SummonerPoroRecall.description
													}else if(data.data.SummonerPoroThrow.key==spell1num){
														spell1_img=data.data.SummonerPoroThrow.image.full
														
														spellinfo=data.data.SummonerPoroThrow.description
													}else if(data.data.SummonerSmite.key==spell1num){
														spell1_img=data.data.SummonerSmite.image.full
														
														spellinfo=data.data.SummonerSmite.description
													}
													else if(data.data.SummonerSnowURFSnowball_Mark.key==spell1num){
														spell1_img=data.data.SummonerSnowURFSnowball_Mark.image.full
														
														spellinfo=data.data.SummonerSnowURFSnowball_Mark.description
													}
													else if(data.data.SummonerSnowball.key==spell1num){
														spell1_img=data.data.SummonerSnowball.image.full
														
														spellinfo=data.data.SummonerSnowball.description
													}
													else if(data.data.SummonerTeleport.key==spell1num){
														spell1_img=data.data.SummonerTeleport.image.full
														
														spellinfo=data.data.SummonerTeleport.description
													}
													
													
													if(data.data.SummonerBarrier.key==spell2num){
														spell2_img=data.data.SummonerBarrier.image.full
														
														spellinfo2=data.data.SummonerBarrier.description
													}else if(data.data.SummonerBoost.key==spell2num){
														spell2_img=data.data.SummonerBoost.image.full
														
														spellinfo2=data.data.SummonerBoost.description
													}else if(data.data.SummonerDot.key==spell2num){
														spell2_img=data.data.SummonerDot.image.full
														
														spellinfo2=data.data.SummonerDot.description
													}else if(data.data.SummonerExhaust.key==spell2num){
														spell2_img=data.data.SummonerExhaust.image.full
														
														
														spellinfo2=data.data.SummonerExhaust.description
													}else if(data.data.SummonerFlash.key==spell2num){
														spell2_img=data.data.SummonerFlash.image.full
														
														
														spellinfo2=data.data.SummonerFlash.description
													}else if(data.data.SummonerHaste.key==spell2num){
														spell2_img=data.data.SummonerHaste.image.full
														
														spellinfo2=data.data.SummonerHaste.description
													}else if(data.data.SummonerHeal.key==spell2num){
														spell2_img=data.data.SummonerHeal.image.full
														
														spellinfo2=data.data.SummonerHeal.description
													}else if(data.data.SummonerMana.key==spell2num){
														spell2_img=data.data.SummonerMana.image.full
														
														spellinfo2=data.data.SummonerMana.description
														
													}else if(data.data.SummonerPoroRecall.key==spell2num){
														spell2_img=data.data.SummonerPoroRecall.image.full
														
														spellinfo2=data.data.SummonerPoroRecall.description
														
													}else if(data.data.SummonerPoroThrow.key==spell2num){
														spell2_img=data.data.SummonerPoroThrow.image.full
														
														spellinfo2=data.data.SummonerPoroThrow.description
														
													}else if(data.data.SummonerSmite.key==spell2num){
														spell2_img=data.data.SummonerSmite.image.full
														
														spellinfo2=data.data.SummonerSmite.description
													}
													else if(data.data.SummonerSnowURFSnowball_Mark.key==spell2num){
														spell2_img=data.data.SummonerSnowURFSnowball_Mark.image.full
														
														spellinfo2=data.data.SummonerSnowURFSnowball_Mark.description
													}
													else if(data.data.SummonerSnowball.key==spell2num){
														spell2_img=data.data.SummonerSnowball.image.full
														
														spellinfo2=data.data.SummonerSnowball.description
													}
													else if(data.data.SummonerTeleport.key==spell2num){
														spell2_img=data.data.SummonerTeleport.image.full
														
														spellinfo2=data.data.SummonerTeleport.description
													}
													
													console.log(spellinfo);
													console.log(spellinfo2)
													$("#spell").append("<img id='spell1' src='http://ddragon.leagueoflegends.com/cdn/11.4.1/img/spell/"+spell1_img+"'>");
													$("#spell").append("<img id='spell2' src='http://ddragon.leagueoflegends.com/cdn/11.4.1/img/spell/"+spell2_img+"'>");
													$("#spell1").hover(function(){
														$("<div>" + spellinfo + "</div>").appendTo(
														"#selectspell").addClass(
														"content");
													},function(){
														console.log("ddddddddd");
													})
												}
											})
											}else{
												$("#simte").append("<div>데이터부족으로 자료가 없습니다.</div>");
											}
											if(data.itemlist[1]){
												$("#hackitem").append("<img src='https://ddragon.leagueoflegends.com/cdn/11.4.1/img/item/"+data.itemlist[1].ITEM1+".png'>");
												$("#hackitem").append("<img src='https://ddragon.leagueoflegends.com/cdn/11.4.1/img/item/"+data.itemlist[1].ITEM2+".png'>");
												$("#hackitem").append("<img src='https://ddragon.leagueoflegends.com/cdn/11.4.1/img/item/"+data.itemlist[1].ITEM3+".png'>");
											}else{
												
												$("#hackitem").append("<div>데이터부족으로 자료가 없습니다.</div>");
											}
												
												
											
											
											
									
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
	
	function pickbtn(){
	
}
</script>
<div id="ChampList">
<div id="picture">
<div id="pickben">
<div id="story"></div>
<div id="gametip"></div>
</div>

</div>

<div id="name"></div>
<div id="skillIcon"></div>
<div id="spell">
<h3>추천 스펠</h3></div>
<div id='selectskill'></div>

<div id="simte">
<h3>승리팀 보유 아이템1</h3>
</div>
<div id="hackitem">
<h3>승리팀 보유 아이템2</h3>
</div>
<div id="itemcon"></div>
<div id="selectSkill"></div>
<div id="skillinfo"></div>
<div id="nn"></div>
<div id="story2"></div>
<div id="gametip2"></div>
</div>


<script>

</script>
</body>
</html>