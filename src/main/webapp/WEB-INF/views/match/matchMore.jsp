<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="mm_wrap">
	<div id="mm_smCard">
		<div id="mm_smLeft">
			<div id="mm_smIconDiv">
				<img alt="" src="http://ddragon.leagueoflegends.com/cdn/10.11.1/img/profileicon/${sm.icon }.png" id="smIcon">
			</div>
			<div id="mm_smNicknameDiv">
				<h2>${sm.snickname }</h2>
				<p>레벨 : ${sm.slevel } </p>
			</div>
		</div>
		<div id="mm_smRight">
			<div id="mm_smSoloDiv">
				<h5>솔로랭크</h5>
				<c:set var="soloTierFull" value="${solo.tier }"/>
				<c:set var="soloTierName" value="${fn:split(soloTierFull, '_')[0] }"/>
				<c:set var="soloWin" value="${solo.win }"/>
				<c:set var="soloLose" value="${solo.lose }"/>
				<c:set var="soloWinLate" value="${(soloWin / (soloWin + soloLose))*100 }"/>
				<img alt="" src="${pageContext.request.contextPath }/resources/images/tierEmblem/${fn:trim(soloTierName)}.png" id="soloTierIcon" width="70" height="70"> <br>
				<span><fmt:formatNumber value="${soloWinLate }" pattern="0"/>% ${solo.leaguePoints } LP</span> <br>
				<span>${soloWin }승 ${soloLose }패</span>
			</div>
			<div id="mm_smFlexDiv">
				<h5>자유랭크</h5>
				<c:set var="flexTierFull" value="${flex.tier }"/>
				<c:set var="flexTierName" value="${fn:split(flexTierFull, '_')[0] }"/>
				<c:set var="flexWin" value="${flex.win }"/>
				<c:set var="flexLose" value="${flex.lose }"/>
				<c:set var="flexWinLate" value="${(flexWin / (flexWin + flexLose))*100 }"/>
				<img alt="" src="${pageContext.request.contextPath }/resources/images/tierEmblem/${fn:trim(flexTierName)}.png" id="flexTierIcon" width="70" height="70"> <br>
				<span><fmt:formatNumber value="${flexWinLate }" pattern="0"/>% ${flex.leaguePoints } LP</span> <br>
				<span>${flexWin }승 ${flexLose }패</span>
			</div>
			<div id="mm_smRatingDiv">
				<h5>소환사평가</h5>
				<fmt:formatNumber value="${rt }" pattern=".0"/>
			</div>
		</div>
	</div>
	<div id="mm_homeTeam">
		<div id="mm_homeTeamInfo">
			<div class="teamMember" id="homeTeamAvg">
				<div class="teamAvg_child" id="homeTeam_tierAvg">
					<img alt="" src="${pageContext.request.contextPath }/resources/images/tierEmblem/${homeTeamTierAvg }.png" width="100" height="100">
				</div>
				<div class="teamAvg_child">
					<span>KDA : ${homeTeamKdaAvg } (${homeTeamKill }/${homeTeamDeath }/${homeTeamAssist })</span>
				</div>
				<div class="teamAvg_child">
				</div>
				<div class="teamAvg_child">
				</div>
			</div>
			<div class="teamMember" id="homeTeamMinimal" style="height: 300px;">
				<c:forEach var="nickname" items="#{homeTeamNicknameList }" varStatus="status">
					<div class="minimal">
						<div class="minimal_child" id="home_minimal_nicknameArea" style="width: 20%;">
							${nickname } <br>
						</div>
						<div class="minimal_child" id="home_minimal_championPictureArea" style="width: 10%;">
							<img alt="" src="https://ddragon.leagueoflegends.com/cdn/10.11.1/img/champion/${homeTeamChampIconList[status.index] }" width="100%" height="100%">
						</div>
						<div class="minimal_child" id="home_minimal_spellArea" style="width: 10%;">
						</div>
						<div class="minimal_child" id="home_minimal_itemArea" style="width: 30%;">
							<table border="1">
							<c:forEach var="item" items="${homeTeamItemList[status.index] }">
								<tr>
								<!-- 
								<div id="minimal_item" style="width: 20%; height: 50%; background-color: white;">
									<img alt="" src="http://ddragon.leagueoflegends.com/cdn/11.2.1/img/item/${item }.png" width="100%" height="100%">
								</div>
								-->
							</c:forEach>
							</table>
						</div>
						<div class="minimal_child" id="home_minimal_scoreArea" style="width: 30%;">
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="teamMember">
			</div>
			<div class="teamMember">
			</div>
			<div class="teamMember">
			</div>
		</div>
	</div>
	<div id="mm_awayTeam">
		<div id="mm_awayTeamInfo">
			<div class="teamMember" id="awayTeamAvg">
				<div class="teamAvg_child" id="awayTeam_tierAvg">
					<img alt="" src="${pageContext.request.contextPath }/resources/images/tierEmblem/${awayTeamTierAvg }.png" width="100" height="100">
				</div>
				<div class="teamAvg_child">
					<span>KDA : ${awayTeamKdaAvg } (${awayTeamKill }/${awayTeamDeath }/${awayTeamAssist })</span>
				</div>
				<div class="teamAvg_child">
				</div>
				<div class="teamAvg_child">
				</div>
			</div>
			<div class="teamMember" id="awayTeamMinimal" style="height: 300px;">
				<c:forEach var="nickname" items="#{awayTeamNicknameList }" varStatus="status">
					<div class="minimal">
						<div class="minimal_child" id="away_minimal_nicknameArea" style="width: 20%;">
							${nickname } <br>
						</div>
						<div class="minimal_child" id="away_minimal_championPictureArea" style="width: 10%;">
							<img alt="" src="https://ddragon.leagueoflegends.com/cdn/10.11.1/img/champion/${awayTeamChampIconList[status.index] }" width="100%" height="100%">
						</div>
						<div class="minimal_child" id="away_minimal_spellArea" style="width: 10%;">
						</div>
						<div class="minimal_child" id="away_minimal_itemArea" style="width: 30%;">
						</div>
						<div class="minimal_child" id="away_minimal_scoreArea" style="width: 30%;">
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="teamMember">
			</div>
			<div class="teamMember">
			</div>
			<div class="teamMember">
			</div>
		</div>
	</div>
</div>