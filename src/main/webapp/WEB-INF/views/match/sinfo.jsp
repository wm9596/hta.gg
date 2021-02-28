<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/searchInfo.css">

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<c:set var="nickname" value="${svo.snickname }"/>
<div id="mm_smCard">
		<div id="mm_smLeft">
			<div id="mm_smIconDiv">
				<img alt="" src="http://ddragon.leagueoflegends.com/cdn/11.4.1/img/profileicon/${svo.icon }.png" id="smIcon">
			</div>
			<div id="mm_smNicknameDiv">
				<h2>${svo.snickname }</h2>
				<p>레벨 : ${svo.slevel } </p>
			</div>
		</div>
		<div id="mm_smRight">
			<div id="mm_smSoloDiv">
				<h5>솔로랭크</h5>
				<c:set var="soloTierFull" value="${svo.solo.tier }"/>
				<c:choose>
					<c:when test="${soloTierFull ne null}">
						<c:set var="soloTierName" value="${fn:split(soloTierFull, '_')[0] }"/>
						<c:set var="soloWin" value="${svo.solo.win }"/>
						<c:set var="soloLose" value="${svo.solo.lose }"/>
						<c:set var="soloWinLate" value="${(soloWin / (soloWin + soloLose))*100 }"/>
					</c:when>
					<c:otherwise>
						<c:set var="soloTierName" value="unranked"/>
						<c:set var="soloWin" value="0"/>
						<c:set var="soloLose" value="0"/>
						<c:set var="soloWinLate" value="0"/>
					</c:otherwise>
				</c:choose>
				<img alt="" src="${pageContext.request.contextPath }/resources/images/tierEmblem/${fn:trim(soloTierName)}.png" id="soloTierIcon" width="70" height="70"> <br>
				<span><fmt:formatNumber value="${soloWinLate }" pattern="0"/>% ${svo.solo.leaguePoints } LP</span> <br>
				<span>${soloWin }승 ${soloLose }패</span>
			</div>
			<div id="mm_smFlexDiv">
				<h5>자유랭크</h5>
				<c:set var="flexTierFull" value="${svo.flex.tier }"/>
				<c:choose>
					<c:when test="${flexTierFull ne null}">
						<c:set var="flexTierName" value="${fn:split(flexTierFull, '_')[0] }"/>
						<c:set var="flexWin" value="${svo.flex.win }"/>
						<c:set var="flexLose" value="${svo.flex.lose }"/>
						<c:set var="flexWinLate" value="${(flexWin / (flexWin + flexLose))*100 }"/>
					</c:when>
					<c:otherwise>
						<c:set var="flexTierName" value="unranked"/>
						<c:set var="flexWin" value="0"/>
						<c:set var="flexLose" value="0"/>
						<c:set var="flexWinLate" value="0"/>
					</c:otherwise>
				</c:choose>
				<img alt="" src="${pageContext.request.contextPath }/resources/images/tierEmblem/${fn:trim(flexTierName)}.png" id="flexTierIcon" width="70" height="70"> <br>
				<span><fmt:formatNumber value="${flexWinLate }" pattern="0"/>% ${svo.flex.leaguePoints } LP</span> <br>
				<span>${flexWin }승 ${flexLose }패</span>
			</div>
			<div id="mm_smRatingDiv">
				<h5>소환사평가</h5>
				<span id="rate"><fmt:formatNumber value="${rt }" pattern=".0"/></span>
				<span id="rateCnt">(<fmt:formatNumber value="${rating }" pattern=".0"/>)</span>
				<p class="star_rating">
				    <a href="#" class="star_rating_1">★</a>
				    <a href="#" class="star_rating_2">★</a>
				    <a href="#" class="star_rating_3">★</a>
				    <a href="#" class="star_rating_4">★</a>
				    <a href="#" class="star_rating_5">★</a>
				    <input type="hidden" class='ratingValue'>
				</p>
				<input type="button" id="ratingSubmit" value="평가하기">
			</div>
		</div>
</div>

<div id="listWrapper">
	<div id="mostList">
		<c:forEach items="${most }" var="item">
			<c:choose>
				<c:when test="${item.death==0}">
					<c:set var="kda" value="${(item.kill+item.assist)* 1.2}"/>
				</c:when>
				<c:otherwise>
					<c:set var="kda" value="${(item.kill+item.assist)/item.death}"/>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${kda lt 3}">
					<c:set var="kdaColor" value="gray"/>
				</c:when>
				<c:when test="${kda lt 4}">
					<c:set var="kdaColor" value="green"/>
				</c:when>
				<c:when test="${kda lt 5}">
					<c:set var="kdaColor" value="blue"/>
				</c:when>
				<c:otherwise>
					<c:set var="kdaColor" value="#FACC2E"/>
				</c:otherwise>
			</c:choose>
			<div class="mostItem">
				<div class="mostFace">
					<a href="/lol/champ/selectList?championid=${item.championid }">
						<img src="https://ddragon.leagueoflegends.com/cdn/11.4.1/img/champion/${item.picture }">
					</a>
				</div>
				<div class="mostName">
					<b>${item.name }</b><br>
					<div class="smallTxt">CS:${item.cs }</div>
				</div>
				<div class="mostKda">
					<span class="kdaSpan" style="color: ${kdaColor}">KDA:<fmt:formatNumber value="${kda } " pattern=".0"/></span><br>
					<div class="smallTxt">${item.kill }/${item.death }/${item.assist }</div>
				</div>
				<div class="mostRate">
					<span ${item.rate >= 60? "style='color: red'":"" }>${item.rate }%</span><br>
					<div class="smallTxt">${item.cnt }게임</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<div id="matchList">
		<div id="gameType"><a href="" class="selectedType">전체 보기</a><a href="RANKED_SOLO_5x5">솔로 랭크</a><a href="RANKED_FLEX_SR">자유 랭크</a></div>
		<div id="summary">
			<div id="record">
				<div id="chart">
				</div>
				<div  id="avg">
					기록 평균
					<div id="avgStats"></div>
					<div id=avgCS></div>
					<div id=avgKDA></div>
				</div>
			</div>
			<div id="most3">
				<ul id="most3List">
				</ul>	
			</div>
		</div>
		<div id="listHolder">
		</div>
		
	</div>
</div>
<div id="effect"></div>
<script type="text/javascript">
var isRunning = false;

google.charts.load("current", {packages:["corechart"]});
google.charts.setOnLoadCallback(getMatchList);

$(function(){
	var gameTypes = $("#gameType a");
	$("#gameType a").click(function(e){
		e.preventDefault();
		
		for(types of gameTypes){
			types.className = "";
			console.log(types);
		}
		
		e.target.className='selectedType';
		
		let type = e.target.getAttribute('href');

		if(!isRunning){
			getMatchList(type);
		}
	})
})

function getMatchList(args) {
	
	if(args==null){
		args = "";
	}
	
	isRunning = true;
	$.ajax({
		url:'/lol/match/getList/${svo.snickname }/'+args,
		dataType:'json',
		success: function(data){
			addMatchList(data.matchList);
			addMost3(data.mostList);
			isRunning = false;
		}
		
	});
}

function drawChart(tot,win,lose){
	  var data = google.visualization.arrayToDataTable([
		    ['winlose', 'cnt'],
		    ["승",    win],
		    ["패",      lose]
		  ]);

		  var options = {
		    title: tot+'전 '+ win + '승 '+lose+'패',
		    pieHole: 0.4,
		    legend : 'none',
		    chartArea:{width:'80%',height:'80%'},
		    fontSize : '12'
		  };

		  var chart = new google.visualization.PieChart(document.getElementById('chart'));
		  chart.draw(data, options);
}

function addMatchList(matchList){
	var MULTI_KILL = ['더블킬','트리플킬','쿼드라킬','펜타킬'];
	let toDay = new Date();
	
	let totalGame = matchList.length;
	let totalWin = 0;
    let totalLose = 0;
	let totalKill= 0;
 	let totalAssist= 0;
 	let	totalDeath= 0;
	let totalCS= 0;
  	let	totalKA = 0;
  	
  	let matchListDiv = $("#listHolder");
  	
  	matchListDiv.empty();
  	
	for(sum of matchList){
// 		console.log(sum);
		let ka = sum.kill+sum.assist;
		let kda;
		
		if(sum.death == 0){
			kda = ka*1.2;
		}else{
			kda = ka / sum.death;	
		}
	
		
		let tka = 0;
		for(fre of sum.friendly){
			tka += fre.kill;
		}
		ka = ka*100.0/tka;
		ka = ka.toFixed(0);
	
		totalKill += sum.kill;
		totalAssist += sum.assist;
		totalDeath += sum.death;
		totalCS += sum.cs;
		totalKA += parseInt(ka);
		
		if(sum.winlose=='Win'){
			totalWin++;
		}
		
		let matchItem = $("<div>",{class:'matchItem '+(sum.winlose=='Win'?'winItem' : 'loseItem')});
		let matchinfo = $("<div>",{class:'matchinfo'});
		
		let gameMode = $("<div>",{class:'gameMode',text:sum.type=='RANKED_FLEX_SR'?'5:5 자유':'솔로'});
		
		matchinfo.append(gameMode);
		let gameDate = dateDiff(new Date(sum.startTime),toDay);
		
		if(gameDate < 1){
			gameDate = gameDate  * 24;
			if(gameDate <1){
				gameDate *= 60;
				gameDate = gameDate.toFixed(0)+"분 전"
			}else{
				gameDate = gameDate.toFixed(0)+"시간 전"
			}
			
		}else{
			gameDate = gameDate.toFixed(0) +"일 전";
		}
	
		let dateDiv = $("<div>",{class:'date',text:gameDate});
		matchinfo.append(dateDiv);
		
		let during = $("<div>",{class:'during',text:sum.runtime});
		matchinfo.append(during);
		
		matchItem.append(matchinfo);
		
		let face =$("<div>",{class:'face',
			html:"<a href='/lol/champ/selectList?championid="+sum.championid+"'>"+
				  	"<img src='https://ddragon.leagueoflegends.com/cdn/11.4.1/img/champion/"+sum.picture+"'>"+
				 "</a>"
			});
		face.append("<div class='name'>"+sum.name+"</div>")
		matchItem.append(face);
		
		let spells = $("<div>",{class:'spells'});
		spells.append("<img src='http://ddragon.leagueoflegends.com/cdn/11.4.1/img/spell/"+sum.spell1+"'><br>");
		spells.append("<img src='http://ddragon.leagueoflegends.com/cdn/11.4.1/img/spell/"+sum.spell2+"'>");
		matchItem.append(spells);
		
		let rune = $("<div>",{class:'rune'});
		rune.append("<img src='https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/"+sum.rune1+"'><br>");
		rune.append("<img src='https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/"+sum.rune2+"'>");
		matchItem.append(rune);
		
		let kdaDiv = $("<div>",{class:'gameStat'});
// 		kdaDiv.append("<div>KDA:"+kda.toFixed(1)+"</div>");
		kda = kda.toFixed(1);
		let kdaColor;
		if(kda<3){
			kdaColor = 'gray';
		}else if(kda<4){
			kdaColor = 'green';
		}else if(kda<5){
			kdaColor = 'blue';
		}else {
			kdaColor = 'yellow';
		}
		
		kdaDiv.append($("<div>",{text:"KDA:"+kda,css:{color: kdaColor}}));
		kdaDiv.append("<div>"+sum.kill+"/"+sum.death+"/"+sum.assist+"</div>");
		
		let killName;
		if(sum.multiKill >=2){
			killName = MULTI_KILL[sum.multiKill-2];
			kdaDiv.append("<div class='multiKill'>"+killName+"</div>");
		}
		matchItem.append(kdaDiv);
		
		let statsDiv = $("<div>",{class:'stats'});
		statsDiv.append("<div>레벨 "+sum.championlevel+"</div>");
		statsDiv.append("<div> "+sum.cs+" CS</div>");
		statsDiv.append("<div>킬관여"+ka+"%</div>");
		matchItem.append(statsDiv);
		
		let items = $("<div>",{class:'items'});
		let table = $("<table>");
		
		let tr1 = $("<tr>");
		let tr2 = $("<tr>");
		
		if(sum.item1!=0){
			let td = $("<td>");
			
			td.append($("<img>",{
								class : sum.item1,
								src : "http://ddragon.leagueoflegends.com/cdn/11.4.1/img/item/"+sum.item1+".png",
								mouseover : function(e){showItemInfo(this,e)},
								mouseout  : function(e){emptyItemInfo()}	
								}));
			tr1.append(td);
// 			tr1.append("<td><img src='http://ddragon.leagueoflegends.com/cdn/11.4.1/img/item/"+sum.item1+".png'></td>");
		}else{
			tr1.append("<td><img src='${pageContext.request.contextPath }/resources/images/noItem.png'></td>");
		}

		if(sum.item2!=0){
			let td = $("<td>");
			
			td.append($("<img>",{
								class : sum.item2,
								src : "http://ddragon.leagueoflegends.com/cdn/11.4.1/img/item/"+sum.item2+".png",
								mouseover : function(e){showItemInfo(this,e)},
								mouseout  : function(e){emptyItemInfo()}	
								}));
			tr1.append(td);
		}else{
			tr1.append("<td><img src='${pageContext.request.contextPath }/resources/images/noItem.png'></td>");
		}
		
		if(sum.item3!=0){
			let td = $("<td>");
			
			td.append($("<img>",{
								class : sum.item3,
								src : "http://ddragon.leagueoflegends.com/cdn/11.4.1/img/item/"+sum.item3+".png",
								mouseover : function(e){showItemInfo(this,e)},
								mouseout  : function(e){emptyItemInfo()}	
								}));
			tr1.append(td);
		}else{
			tr1.append("<td><img src='${pageContext.request.contextPath }/resources/images/noItem.png'></td>");
		}
		
		if(sum.item4!=0){
			let td = $("<td>");
			
			td.append($("<img>",{
								class : sum.item4,
								src : "http://ddragon.leagueoflegends.com/cdn/11.4.1/img/item/"+sum.item4+".png",
								mouseover : function(e){showItemInfo(this,e)},
								mouseout  : function(e){emptyItemInfo()}	
								}));
			tr2.append(td);
		}else{
			tr2.append("<td><img src='${pageContext.request.contextPath }/resources/images/noItem.png'></td>");
		}
		
		if(sum.item5!=0){
			let td = $("<td>");
			
			td.append($("<img>",{
								class : sum.item5,
								src : "http://ddragon.leagueoflegends.com/cdn/11.4.1/img/item/"+sum.item5+".png",
								mouseover : function(e){showItemInfo(this,e)},
								mouseout  : function(e){emptyItemInfo()}	
								}));
			tr2.append(td);
		}else{
			tr2.append("<td><img src='${pageContext.request.contextPath }/resources/images/noItem.png'></td>");
		}
		
		if(sum.item6!=0){
			let td = $("<td>");
			
			td.append($("<img>",{
								class : sum.item6,
								src : "http://ddragon.leagueoflegends.com/cdn/11.4.1/img/item/"+sum.item6+".png",
								mouseover : function(e){showItemInfo(this,e)},
								mouseout  : function(e){emptyItemInfo()}	
								}));
			tr2.append(td);
		}else{
			tr2.append("<td><img src='${pageContext.request.contextPath }/resources/images/noItem.png'></td>");
		}
		
		table.append(tr1);
		table.append(tr2);
		items.append(table);	
		matchItem.append(items);
		
		let accessory = $("<div>",{class:'accessory'})
		
		if(sum.accessory==0){
			accessory.append("<img src='${pageContext.request.contextPath }/resources/images/noItem.png'>");
		}else{
// 			accessory.append("<img>" src='http://ddragon.leagueoflegends.com/cdn/11.4.1/img/item/"+sum.accessory+".png'>");
			accessory.append($("<img>",{
				class : sum.accessory,
				src : "http://ddragon.leagueoflegends.com/cdn/11.4.1/img/item/"+sum.accessory+".png",
				mouseover : function(e){showItemInfo(this,e)},
				mouseout  : function(e){emptyItemInfo()}	
				}));
		}
		
		matchItem.append(accessory);
		
		
		let team = $("<div>",{class:'team'});
		
		let friendly =$("<div>",{class:'friendly'});
		let enemy =$("<div>",{class:'enemy'});
		
		for(t of sum.friendly){
			let className = 'summoner';
			let player = t.snickname;
			
			if(t.snickname==sum.snickname){
				className +=' mine';
			}
			
			if(player.length >5){
				player = player.substr(0, 4);
				player +='...';
			}
			
			
			summoner=$("<div>",{class:className});
			summoner.append("<img  src='https://ddragon.leagueoflegends.com/cdn/11.4.1/img/champion/"+t.picture+"'>")
			
			let asncik = $("<a>",{
				href:'${pageContext.request.contextPath }/match/search?sName='+t.snickname,
				text:player
				});
			
			summoner.append(asncik);
			
			friendly.append(summoner);
			
		}
		
		for(t of sum.enemy){
			let className = 'summoner';
			let player = t.snickname;
			
			if(player.length >5){
				player = player.substr(0, 4);
				player +='...';
			}
			
			
			summoner=$("<div>",{class:className});
			summoner.append("<img  src='https://ddragon.leagueoflegends.com/cdn/11.4.1/img/champion/"+t.picture+"'>");
			
			let asncik = $("<a>",{
				href:'${pageContext.request.contextPath }/match/search?sName='+t.snickname,
				text:player
				});
			
			summoner.append(asncik);
			enemy.append(summoner);
			
		}
		
		team.append(friendly);
		team.append(enemy);
		
		matchItem.append(team);
		
		let showMore = $("<div>",{class:'showMore'});
		let imgBtn = $("<input>",{type:"image",src:"${pageContext.request.contextPath }/resources/images/bar-chart.png",value:sum.matchid});
		
// 		console.log(sum.matchid);
		imgBtn.click(function(e) {
			e.preventDefault();
// 			console.log(e.target.value);
			let form = $("<form>");
			form.attr("method","get");
			form.attr("action","/lol/matchMore");
			
			form.append($("<input>",{type:'hidden',name:'nickname',value:sum.snickname}));
			form.append($("<input>",{type:'hidden',name:'matchId',value:e.target.value}));
			
			form.appendTo('body');
			form.submit();
		})
		
		showMore.append(imgBtn);
		matchItem.append(showMore);
		
		matchListDiv.append(matchItem);
	}
	
	totalLose = totalGame - totalWin;
// 	console.log("승률" + totalGame +" "+totalWin +" " +totalLose);
	drawChart(totalGame,totalWin,totalLose);
	
	$("#avgStats").html((totalKill/totalGame).toFixed(1)+"/"+(totalDeath/totalGame).toFixed(1)+"/"+(totalAssist/totalGame).toFixed(1));
	$("#avgCS").html("CS : "+(totalCS/totalGame).toFixed(1));
	$("#avgKDA").html("KDA: " +((totalKill+totalAssist)/totalDeath).toFixed(1) + "<br>킬관여율: "+ (totalKA/totalGame).toFixed(0)+"%");
}

function addMost3(mostList){
	var most3List =  $("#most3List");
	most3List.empty();
	//최근 모스트 챔프 3 추가
	for(most of mostList){
		let lose = most.cnt - most.wincnt;
		let kda;
		
		if(most.death==0){
			kda = (most.kill+most.assist) * 1.2;
		}else{
			kda = (most.kill+most.assist)/most.death;
		}
		
		
		kda = kda.toFixed(1);
		
		let li = $("<li>");
		
		let most3Face = $("<div>",{
					class:'most3Face',
					html:"<a href='/lol/champ/selectList?championid="+most.championid+"'>"+
						 	"<img src='https://ddragon.leagueoflegends.com/cdn/11.4.1/img/champion/"+most.picture+"'>"+
					     "</a>"
				}
		);
		
		let most3Info = $("<div>",{class:'most3Info'});
		
		let champName = $("<div>",{class:'champName',text:most.name});
		
		most3Info.append(champName);
		
		let most3stats = $("<div>",{class:'most3stats'});
		
// 		let most3Odds = $("<div>",{class:'most3Odds',text:"승률 :"+most.rate+"% ("+most.wincnt+"승 "+lose+" 패)"});
		let most3Odds = $("<div>",{class:'most3Odds',text:"승률 :"});
		
		let oddsColor;
		
		if(most.rate >=60){
			oddsColor = 'red';
		}else{
			oddsColor = 'black'
		}
		
		let most3OddsItem1 = $("<span>",{text:most.rate+"%",css:{color: oddsColor}});
		let most3OddsItem2 = $("<span>",{text:"("+most.wincnt+"승 "+lose+" 패)"});
		
		
		most3Odds.append(most3OddsItem1);
		most3Odds.append(most3OddsItem2);
		
		most3stats.append(most3Odds);
		
		let kdaColor;
		if(kda<3){
			kdaColor = 'gray';
		}else if(kda<4){
			kdaColor = 'green';
		}else if(kda<5){
			kdaColor = 'blue';
		}else {
			kdaColor = '#FACC2E';
		}
		
		let most3KDA = $("<div>",{class:'most3KDA',text:"KDA : "+kda, css:{color: kdaColor}});				
		
		most3stats.append(most3KDA);
		
		most3Info.append(most3stats);
		
		li.append(most3Face);
		li.append(most3Info);
		
		most3List.append(li);
	}
}

function dateDiff(d1,d2){
	let dif = d2 - d1;
	
	return dif/ 1000 / 60 / 60 / 24;
}

var isToolTip = false;
function showItemInfo(img,e){
// 	console.log(img);

	let inum = $(img).attr('class');
	
	if(isToolTip) return;
	
	isToolTip = true;
	$.ajax({
		contentType : 'application/json',
		url : "/lol/iteminfo?inum="+inum,
		dataType: 'json',
		success:function(data){
			var nameeffect="<div id='toolTip'><h2>"+data.name+"</h2><p>가격:"+data.price+"<br><img src=http://ddragon.leagueoflegends.com/cdn/11.4.1/img/item/"+data.icon+" style='width:50px; height:50px;'><br>"+data.effect+"</div>";
			$("#effect").empty();
			$(nameeffect).appendTo("#effect");
			$("#toolTip").css("left",e.pageX);
			$("#toolTip").css("top",e.pageY);
			$("#toolTip").css("pointer-events",'none');
		}
	})
}

function emptyItemInfo(){
 	$("#effect").empty();
 	isToolTip = false;
}

</script>