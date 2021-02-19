<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/searchInfo.css">

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<div id="mm_smCard">
		<div id="mm_smLeft">
			<div id="mm_smIconDiv">
				<img alt="" src="http://ddragon.leagueoflegends.com/cdn/10.11.1/img/profileicon/${svo.icon }.png" id="smIcon">
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
				<fmt:formatNumber value="${rt }" pattern=".0"/>
				<p class="star_rating">
				    <a href="#" class="star_rating_1">★</a>
				    <a href="#" class="star_rating_2">★</a>
				    <a href="#" class="star_rating_3">★</a>
				    <a href="#" class="star_rating_4">★</a>
				    <a href="#" class="star_rating_5">★</a>
				</p>
			</div>
		</div>
</div>

<div id="listWrapper">
	<div id="mostList">
		<c:forEach items="${most }" var="item">
			<div class="mostItem">
				<div class="mostFace">
					<img src="https://ddragon.leagueoflegends.com/cdn/11.2.1/img/champion/${item.picture }">
				</div>
				<div class="mostName">
					<b>${item.name }</b><br>
					<div class="smallTxt">CS:${item.cs }</div>
				</div>
				<div class="mostKda">
					<b>KDA:<fmt:formatNumber value="${(item.kill+item.assist)/item.death } " pattern=".0"/><br></b>
					<div class="smallTxt">${item.kill }/${item.death }/${item.assist }</div>
				</div>
				<div class="mostRate">
					<b>${item.rate }%</b><br>
					<div class="smallTxt">${item.cnt }게임</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<div id="matchList">
		<div id="gameType"><a href="#">전체 보기</a><a href="#">솔로 랭크</a><a href="#">자유 랭크</a></div>
		<div id="summary">
			<div id="record">
				<div id="chart">
				</div>
				<div  id="avg">
					기록 평균
					<div id="avgStats">7.8/4.3/5.5</div>
					<div id=avgCS>cs 150</div>
					<div id=avgKDA>3.1</div>
				</div>
			</div>
			<div id="most3">
			</div>
		</div>
		<div class="matchItem">
			<div class="matchinfo">
			
				<div class="gameMode">
					솔랭
				</div>
				<div class="date">
					2일전
				</div>
				<div class="during">
					22분
				</div>
				
			</div>
			
			<div class="face">
				<img src="https://ddragon.leagueoflegends.com/cdn/11.3.1/img/champion/Urgot.png">
			</div>
			
			<div class="spells">
				<img src="http://ddragon.leagueoflegends.com/cdn/11.3.1/img/spell/SummonerFlash.png"><br>
				<img src="http://ddragon.leagueoflegends.com/cdn/11.3.1/img/spell/SummonerFlash.png">
			</div>
			<div class="rune">
				<img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/7200_Domination.png"><br>
				<img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/7200_Domination.png">
			</div>
			<div class="kda">
				<div>KDA:4.5</div>
				<div>15.0/1.0/10.0</div>
			</div>
			<div class="stats">
				<div>레벨</div>
				<div>cs</div>
				<div>킬관여율</div>
			</div>
			<div class="items">
				<table>
					<tr>
						<td><img src="http://ddragon.leagueoflegends.com/cdn/11.3.1/img/item/1001.png"></td>
						<td><img src="http://ddragon.leagueoflegends.com/cdn/11.3.1/img/item/1001.png"></td>
						<td><img src="http://ddragon.leagueoflegends.com/cdn/11.3.1/img/item/1001.png"></td>
					</tr>
					<tr>
						<td><img src="http://ddragon.leagueoflegends.com/cdn/11.3.1/img/item/1001.png"></td>
						<td><img src="http://ddragon.leagueoflegends.com/cdn/11.3.1/img/item/1001.png"></td>
						<td><img src="http://ddragon.leagueoflegends.com/cdn/11.3.1/img/item/1001.png"></td>
					</tr>
				</table>
			</div>
			<div class="accessory">
				<img src="http://ddragon.leagueoflegends.com/cdn/11.3.1/img/item/2055.png">
			</div>
			
			<div class="team">
				<div class="friendly">
					<div class="summoner">
						<img  src="https://ddragon.leagueoflegends.com/cdn/11.3.1/img/champion/Urgot.png">
						<a>소환사이름</a>
					</div>
					<div class="summoner">
						<img  src="https://ddragon.leagueoflegends.com/cdn/11.3.1/img/champion/Urgot.png">
						<a>소환사이름</a>
					</div>
					<div class="summoner">
						<img  src="https://ddragon.leagueoflegends.com/cdn/11.3.1/img/champion/Urgot.png">
						<a>소환사이름</a>
					</div>
					<div class="summoner">
						<img  src="https://ddragon.leagueoflegends.com/cdn/11.3.1/img/champion/Urgot.png">
						<a>소환사이름</a>
					</div>
					<div class="summoner">
						<img  src="https://ddragon.leagueoflegends.com/cdn/11.3.1/img/champion/Urgot.png">
						<a>소환사이름</a>
					</div>
				</div>
				
				<div class="enemy">
					<div class="summoner">
						<img  src="https://ddragon.leagueoflegends.com/cdn/11.3.1/img/champion/Urgot.png">
						<a>소환사이름</a>
					</div>
					<div class="summoner">
						<img  src="https://ddragon.leagueoflegends.com/cdn/11.3.1/img/champion/Urgot.png">
						<a>소환사이름</a>
					</div>
					<div class="summoner">
						<img  src="https://ddragon.leagueoflegends.com/cdn/11.3.1/img/champion/Urgot.png">
						<a>소환사이름</a>
					</div>
					<div class="summoner">
						<img  src="https://ddragon.leagueoflegends.com/cdn/11.3.1/img/champion/Urgot.png">
						<a>소환사이름</a>
					</div>
					<div class="summoner">
						<img  src="https://ddragon.leagueoflegends.com/cdn/11.3.1/img/champion/Urgot.png">
						<a>소환사이름</a>
					</div>
				</div>
			</div>
			
			<div class="showMore">
				<input type="image" src="${pageContext.request.contextPath }/resources/images/bar-chart.png">
			</div>
			
		</div>
	</div>
</div>

<script type="text/javascript">

google.charts.load("current", {packages:["corechart"]});
google.charts.setOnLoadCallback(getMatchList);

function getMatchList() {
	
	var matchList;
	var totalGame;
	var totalWin;
	var totalLose;
	var totalKill;
	var totalAssist;
	var totalDeath;
	var totalCS;
	var totalKA ;
	
	$.ajax({
		url:'/lol/match/getList',
		data:{name:'${svo.snickname }'} ,
		dataType:'json',
		success: function(data){
// 			console.log(data.mostList);
			matchList = data.matchList;
			totalGame = matchList.length;
		    totalWin = 0;
			totalLose = 0;
		 	totalKill= 0;
		 	totalAssist= 0;
	 		totalDeath= 0;
		  	totalCS= 0;
		  	totalKA = 0;
		  	
			for(sum of matchList){
// 				console.log(sum);
				var ka = sum.kill+sum.assist;
				var tka = 0;
				for(fre of sum.friendly){
					tka += fre.kill;
				}
				ka = ka*100.0/tka;
				ka = ka.toFixed(0);
				console.log("킬관여 "+ka);
			
				totalKill += sum.kill;
				totalAssist += sum.assist;
				totalDeath += sum.death;
				totalCS += sum.cs;
				totalKA += parseInt(ka);
				
				if(sum.winlose=='Win'){
					totalWin++;
				}
			}
			
			totalLose = totalGame - totalWin;
			console.log("승률" + totalGame +" "+totalWin +" " +totalLose);
			drawChart(totalGame,totalWin,totalLose);
			
			$("#avgStats").html((totalKill/totalGame).toFixed(1)+"/"+(totalDeath/totalGame).toFixed(1)+"/"+(totalAssist/totalGame).toFixed(1));
			$("#avgCS").html("CS : "+(totalCS/totalGame).toFixed(1));
			$("#avgKDA").html("KDA: " +((totalKill+totalAssist)/totalDeath).toFixed(1) + "<br>킬관여율: "+ (totalKA/totalGame).toFixed(0)+"%");
			
			
			
			
			
			
			
			
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


</script>