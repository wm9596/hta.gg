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
			$("<input type='button' value='픽률'>").appendTo("#pickben").addClass('buttonCol')
			$("<input type='button' value='승률'>").appendTo("#pickben").addClass('buttonCol')
			$("<input type='button' value='벤률'>").appendTo("#pickben").addClass('buttonCol')
			$("#pickben").append("<div><h2>"+data.maxCount.RANK+"위&nbsp&nbsp&nbsp/</h2><h4>"+data.allCount.MAXCOUNT+"</h4><h1>"+data.maxCount.NAME+"</h1></div><div class='sic'><strong></strong></div>")
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
				    thickness:100,
				          
				  }).on('circle-animation-progress', function(event, progress) {
			          $(this).find('strong').html("<h1 id='whichi'>"+Math.round(data.matchcount * progress) + '%<p></h1> <p>픽률 기록중</p>');
				    });
				  
			
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
<div id="ChampList">
<div id="picture">
<div id="pickben">
<div id="story"></div>
<div id="gametip"></div>
</div>

</div>

<div id="name"></div>
<div id="skillIcon"></div>
<div id="simte">
<h3>스타팅 추천아이템</h3>
</div>
<div id="hackitem">
<h3>라이엇 추천아이템</h3>
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