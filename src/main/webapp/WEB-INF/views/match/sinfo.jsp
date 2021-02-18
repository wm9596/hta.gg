<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/searchInfo.css">

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
