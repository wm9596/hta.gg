<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/lol/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/scrap.js"></script>
	<script src="${pageContext.request.contextPath }/resources/dist/circle-progress.js"></script>
<style type="text/css">
#content{
background-color: white;
margin-left: 0px;
}
#ChampList {

	margin-top:10px;
	position: relative;
	left: 70px;
	width: 1200px;
	height: 1200px;
}

#headingOne{
position: 
}
.skill_info {
	position:absolute;
	border: 3px solid black;
	border-radius: 25px;
	background-color: #ffffff;
	top:35px;
	left:500px;
	background-color: black;
	width: 30%;
	height: auto;
	color: white;
	
}
#picture{
display: inline-block;
}
#skillIcon{
position: absolute;
top:54px;
left:122px;
}
#skillIcon img {
	padding-left: 2px;

}

status {
	color: #50B4FF;
}

#selectSkill p {
	color: #50B4FF;
}

#name {
	font-size: 30px;
	color: black;
}

.content {
	border: 3px solid black;
	border-radius: 25px;
	background-color: #ffffff;
	position: absolute;
	background-color: black;
	width: 30%;
	height: auto;
	color: white;
}



#story {
	position: absolute;
	border: 3px solid black;
	width: 300px;
	height: 100px;
	top: 405px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	background-color: #FFA500;
}

#gametip {
	position: absolute;
	border: 3px solid black;
	width: 300px;
	height: 100px;
	top: 525px;
	background-color: #54BD54;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}


#gametip2 {
	position: absolute;
	border: 3px solid #69A8AA;
	background-color: #54BD54;
	top: 413px;
	left: 891px;
	width: 300px;
	display: none;
	color: black;
}

.buttonCol {
	width: 98px;
}

.sic {
	padding-left: 50px;
}

#whichi {
	display: inline-block;
	position: absolute;
	right: 90px;
	top: 198px;
}

#whichi h1 {
	padding-left: 80px;
}

.table {
  
  
    margin-bottom: 1rem;
    background-color: transparent;
}


#picture{
display: inline-block;
}
#name{
display: inline-block;
}
#simte img{
width: 50px;
}

#headingOne{
position: absolute;
left:122px;
top:2px;
}
#headingTwo{
position: absolute;
left:122px;
top:20px;

}
.collapse.show {
    display: inline-table;
    position: inherit;
}
#table1 img{
width: 70px;
}
</style>
</head>

<body>
	<div id="ChampList">
	<div id="pictureSkill">
		<div id="picture"></div>
		<div id="skillIcon"></div>
		<div class='circleAll'>
		<div style='display:inline' id="circle1"></div>
		<div style='display:inline' id="circle2"></div>
		<div style='display:inline' id="circle3"></div>
		</div>
		<div class="panel-heading" role="tab" id="headingOne">
	<h5 class="pa">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
        스토리 바로보기
        </a>
      </h5>
    </div>
    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
      <div class="panel-body 1">
 
      </div>
      </div>
      
   		 <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingTwo">
      <h5 class="panel-title">
        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          챔피언 공략 바로보기
        </a>
      </h5>
    </div>
    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
      <div class="panel-body 2">
      
      </div>
    </div>
  </div>
		</div>
		

		

		
			<table class="table table-striped winlist" id='table1'>


						</table>
						
			<table class="table table-striped loselist" id='table2'>


						</table>

		<div id='selectskill'></div>

		<div id="simte">
			
		</div>

		<div id="itemcon"></div>
		<div id="selectSkill"></div>
		<div id="skillinfo"></div>
		<div id="nn"></div>
		<div id="story2"></div>
		<div id="gametip2"></div>
	
	</div>

	
	
	
	<script type="text/javascript">

$(function(){
	  $('#circle1').circleProgress({
		    value: 0.75,
		    size: 80,
		    fill: {
		      gradient: ["red", "orange"]
		    }
		  });
	  $('#circle2').circleProgress({
		    value: 0.75,
		    size: 80,
		    fill: {
		      gradient: ["red", "orange"]
		    }
		  });
	  $('#circle3').circleProgress({
		    value: 0.75,
		    size: 80,
		    fill: {
		      gradient: ["red", "orange"]
		    }
		  });
	var list=${championid}

	
	$.ajax({
		url:"/lol/champ/count",
		data:{
			championid:list
		},
		dataType:'json',
		success:function(data){
			
			console.log(data)

			$("#pickbtn").css({
					border: "3px solid red",
				})
			
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
			
				$("#pickben2").empty();
	
				
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
				
			})
			
			if(data.itemlist.length==0){
				$("#table1").append(
						"<tbody><tr><td id='tabletd'>통계가 부족하여 데이터가 없습니다.</td></tr></tbody>");
			}else{
				$("#table1").append(
				"<tbody><tr><td id='tabletd'>추천 아이템</td></tr></tbody>");
				
				var rune1="";
				var rune2="";
				var spell11="";
			$.each(data.itemlist,function(key,value){
				rune1=value.RUNE1;
				rune2=value.RUNE2;
				spell11=value.SPELL1;
			
					console.log(value.RUNE1);
					console.log(!value.ITEM6);
					let item1="";
					let item2="";
					let item3="";
					let item4="";
					let item5="";
					let item6="";
					if(value.ITEM1){
						item1="<img id='"+value.ITEM1+"' src='http://ddragon.leagueoflegends.com/cdn/11.4.1/img/item/"+value.ITEM1+".png'>"
					}else{
						item1="<img src='/lol/resources/images/noItem.png'>"
					
					}
					console.log(item1);
					if(value.ITEM2){
						item2="<img id='"+value.ITEM2+"' src='http://ddragon.leagueoflegends.com/cdn/11.4.1/img/item/"+value.ITEM2+".png'>"
						
						
					}else{
						item2="<img src='/lol/resources/images/noItem.png'>"
						
					}
					if(value.ITEM3){
						item3="<img id='"+value.ITEM3+"' src='http://ddragon.leagueoflegends.com/cdn/11.4.1/img/item/"+value.ITEM3+".png'>"
						
					}else{
						item3="<img src='/lol/resources/images/noItem.png'>"
					}
					if(value.ITEM4){
						item4="<img id='"+value.ITEM4+"' src='http://ddragon.leagueoflegends.com/cdn/11.4.1/img/item/"+value.ITEM4+".png'>"
						
					}else{
						item4="<img src='/lol/resources/images/noItem.png'>"
					}
					if(value.ITEM5){
						item5="<img id='"+value.ITEM5+"' src='http://ddragon.leagueoflegends.com/cdn/11.4.1/img/item/"+value.ITEM5+".png'>"
		
					}else{
						item5="<img src='/lol/resources/images/noItem.png'>"
					}
					if(value.ITEM6){
						item6="<img id='"+value.ITEM6+"' src='http://ddragon.leagueoflegends.com/cdn/11.4.1/img/item/"+value.ITEM6+".png'>"
						
					}else{
						item6="<img src='/lol/resources/images/noItem.png'>"
					}
					
				
					console.log(item6);
					
					var rune1=value.RUNE1;
					var rune2=value.RUNE2;
					var spell1=value.SPELL1;
					var spell2=value.SPELL2;
					console.log(spell1)
					console.log("dkddkdkdkdkdkkdkdkdkdkdkdkdkdkd")
					var cc="";
					var dd="";
					var spell_1="";
					var spell_2="";
					$.ajax({
						url:'http://ddragon.leagueoflegends.com/cdn/11.3.1/data/ko_KR/runesReforged.json',
						dataType: 'json',
						type: "get",
						success:function(data){
					
							var m1="";
							for(idx in data){
								if(data[idx].id==rune1){
									console.log("정답");
									cc="<img src='http://ddragon.leagueoflegends.com/cdn/img/"+data[idx].icon+"'>";
								
								}
								if(data[idx].id==rune2){
									console.log("정답");
									dd="<img src='http://ddragon.leagueoflegends.com/cdn/img/"+data[idx].icon+"'>";
								
								}
								console.log(value.SPELL1);
							$.ajax({
								url:'http://ddragon.leagueoflegends.com/cdn/11.4.1/data/ko_KR/summoner.json',
								dataType: 'json',
								success:function(data){
									console.log(data);
								}
							})
							}
							if(spell1==21){
								spell_1="SummonerBarrier.png";
								
							}else if(spell1==1){
								spell_1="SummonerBoost.png";
							}if(spell1==14){
								spell_1="SummonerDot.png";
								
							}else if(spell1==3){
								spell_1="SummonerExhaust.png";
							}if(spell1==4){
								spell_1="SummonerFlash.png";
								
							}else if(spell1==6){
								spell_1="SummonerHaste.png";
							}if(spell1==7){
								spell_1="SummonerHeal.png";
								
							}else if(spell1==13){
								spell_1="SummonerMana.png";
							}if(spell1==11){
								spell_1="SummonerSmite.png";
								
							}else if(spell1==12){
								spell_1="SummonerTeleport.png";
							}
							if(spell1==21){
								spell_1="SummonerBarrier.png";
								
							}else if(spell1==1){
								spell_1="SummonerBoost.png";
							}if(spell1==14){
								spell_1="SummonerDot.png";
								
							}else if(spell1==3){
								spell_1="SummonerExhaust.png";
							}if(spell1==4){
								spell_1="SummonerFlash.png";
								
							}else if(spell1==6){
								spell_1="SummonerHaste.png";
							}if(spell1==7){
								spell_1="SummonerHeal.png";
								
							}else if(spell1==13){
								spell_1="SummonerMana.png";
							}else if(spell1==11){
								spell_1="SummonerSmite.png";
								
							}else if(spell1==12){
								spell_1="SummonerTeleport.png";
							}
							
							
							if(spell2==21){
								spell_2="SummonerBarrier.png";
								
							}else if(spell2==1){
								spell_2="SummonerBoost.png";
							}if(spell2==14){
								spell_2="SummonerDot.png";
								
							}else if(spell2==3){
								spell_2="SummonerExhaust.png";
							}if(spell2==4){
								spell_2="SummonerFlash.png";
								
							}else if(spell2==6){
								spell_2="SummonerHaste.png";
							}if(spell2==7){
								spell_2="SummonerHeal.png";
								
							}else if(spell2==13){
								spell_2="SummonerMana.png";
							}if(spell2==11){
								spell_2="SummonerSmite.png";
								
							}else if(spell2==12){
								spell_2="SummonerTeleport.png";
							}
							if(spell2==21){
								spell_2="SummonerBarrier.png";
								
							}else if(spell2==1){
								spell_2="SummonerBoost.png";
							}if(spell2==14){
								spell_2="SummonerDot.png";
								
							}else if(spell2==3){
								spell_2="SummonerExhaust.png";
							}if(spell2==4){
								spell_2="SummonerFlash.png";
								
							}else if(spell2==6){
								spell_2="SummonerHaste.png";
							}if(spell2==7){
								spell_2="SummonerHeal.png";
								
							}else if(spell2==13){
								spell_2="SummonerMana.png";
							}else if(spell2==11){
								spell_2="SummonerSmite.png";
								
							}else if(spell2==12){
								spell_2="SummonerTeleport.png";
							}
							
						console.log(spell_1)
						let spell_11="<img src='http://ddragon.leagueoflegends.com/cdn/11.4.1/img/spell/"+spell_1+"'>";
						let spell_22="<img src='http://ddragon.leagueoflegends.com/cdn/11.4.1/img/spell/"+spell_2+"'>";
						console.log(spell_2)
							$("#table1 tbody").append("<tr><td>"+(key+1)+"</td><td>"+item1+"</td><td>"+item2+"</td><td>"+item3+"</td><td>"+item4+"</td><td>"+item5+"</td><td>"+cc+"</td><td>"+dd+"</td><td>"+spell_11+"</td><td>"+spell_22+"</td></tr>");
						}
					})
				
	
						
					})
				
			}
		}
		
	})	
	

	$.ajax({
		url:"/lol/champ/selectList1", 
		data:{
			championid:list
			},
		dataType: 'json',
		success: function(data){
	
		 


			let Q=JSON.parse(data.skillQ_info);
			let W=JSON.parse(data.skillW_info);
			let E=JSON.parse(data.skillE_info);
			let R=JSON.parse(data.skillR_info);
	
						let skillp = JSON.parse(data.skillP_info);
						let SkillP = skillp.description;
						
		
		
	
		
	let q_ = Q.tooltip.split("{");
						
						var q_sum = "";
						for (var kk = 0; kk <= q_.length; kk += 2) {
						
							q_sum += "?"
									+ q_[kk].substring(
											q_[kk].indexOf('}}') + 2,
											q_[kk].length);

						}
						let SkillQ = "<p>"+Q.name+"</p><br>"+q_[0] + q_sum;
						
						
	
	let w_ = W.tooltip.split("{");
						
						var w_sum = "";
						for (var kk = 0; kk <= w_.length; kk += 2) {
						
							w_sum += "?"
									+ w_[kk].substring(
											w_[kk].indexOf('}}') + 2,
											w_[kk].length);

						}
						let SkillW = "<p>"+W.name+"</p><br>"+w_[0] + w_sum;

						let e_ = E.tooltip.split("{");
					
						var e_sum = "";
						for (var kk = 0; kk <= e_.length; kk += 2) {
							
							e_sum += "?"
									+ e_[kk].substring(
											e_[kk].indexOf('}}') + 2,
											e_[kk].length);

						}
						let SkillE = "<p>"+E.name+"</p><br>"+e_[0] + e_sum;

						let r_ = R.tooltip.split("{");
						
						var r_sum = "";
						for (var kk = 0; kk <= r_.length; kk += 2) {
							
							r_sum += "?"
									+ r_[kk].substring(
											r_[kk].indexOf('}}') + 2,
											r_[kk].length);

						}
						let SkillR = "<p>"+R.name+"</p><br>"+r_[0] + r_sum;

						$("#picture")
								.append(
										"<div><img src='http://ddragon.leagueoflegends.com/cdn/11.4.1/img/champion/"+data.picture+"'><br>"+data.name+"</div>");
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
						console.log(data.tip);
						console.log(data.tip.length);
						var tip=data.tip;
						if(data.tip.length==10){
							tip="데이터가 부족해 통계가 없습니다."
							
						}
						$("<div><h3 style='color:black;'>스토리</h3><a style='color:black' id='storyboard' href='#'>"+data.story+"</a></div>").appendTo(".panel-body.1")
						$("<div><h3 style='color:black;'>게임팁</h3><a style='color:black' id='storyboard' href='#'>"+tip+"</a></div>").appendTo(".panel-body.2")
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
					

					}

				})


	})
	
	function pickbtn(){
	
}
</script>



	<script>

</script>
</body>
</html>