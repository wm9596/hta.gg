<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="mm_wrap">
	<div id="mm_smCard">
		<div id="mm_smLeft">
			<div id="mm_smIconDiv">
				<img alt="" src="http://ddragon.leagueoflegends.com/cdn/${cdn }/img/profileicon/${sm.icon }.png" id="smIcon">
			</div>
			<div id="mm_smNicknameDiv">
				<h2 style="line-height: 100px;">${sm.snickname }</h2>
				<span>레벨 : ${sm.slevel } </span>
			</div>
		</div>
		<div id="mm_smRight">
			<div id="mm_smSoloDiv">
				<h5>솔로랭크</h5>
				<c:set var="soloTierFull" value="${solo.tier }"/>
				<c:choose>
					<c:when test="${soloTierFull ne null}">
						<c:set var="soloTierName" value="${fn:split(soloTierFull, '_')[0] }"/>
						<c:set var="soloWin" value="${solo.win }"/>
						<c:set var="soloLose" value="${solo.lose }"/>
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
				<span><fmt:formatNumber value="${soloWinLate }" pattern="0"/>% ${solo.leaguePoints } LP</span> <br>
				<span>${soloWin }승 ${soloLose }패</span>
			</div>
			<div id="mm_smFlexDiv">
				<h5>자유랭크</h5>
				<c:set var="flexTierFull" value="${flex.tier }"/>
				<c:choose>
					<c:when test="${flexTierFull ne null}">
						<c:set var="flexTierName" value="${fn:split(flexTierFull, '_')[0] }"/>
						<c:set var="flexWin" value="${flex.win }"/>
						<c:set var="flexLose" value="${flex.lose }"/>
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
				<span><fmt:formatNumber value="${flexWinLate }" pattern="0"/>% ${flex.leaguePoints } LP</span> <br>
				<span>${flexWin }승 ${flexLose }패</span>
			</div>
			<div id="mm_smRatingDiv">
				<h5>소환사평가</h5>
<%-- 				<span id="rate"><fmt:formatNumber value="${rt }" pattern=".00"/></span> --%>
				${rt}
				<span id="rateCnt">(${ratingCnt })</span>
				<p class="star_rating">
				    <a href="#" class="star_rating_1">★</a>
				    <a href="#" class="star_rating_2">★</a>
				    <a href="#" class="star_rating_3">★</a>
				    <a href="#" class="star_rating_4">★</a>
				    <a href="#" class="star_rating_5">★</a>
				    <input type="hidden" class='ratingValue'>
				</p>
				<input type="button" id="ratingSubmit" class="btn btn-primary btn-sm" value="평가하기">
			</div>
		</div>
	</div>
	<div id="mm_homeTeam">
		<div id="mm_homeTeamInfo">
			<div class="teamMember" id="homeTeamAvg">

					<div class="mm_winLose" style="float: left;">
						<c:choose>
							<c:when test="${homeTeamWinLose == 'Win'}">
								<span>승리</span>
							</c:when>
							<c:otherwise>
								<span>패배</span>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="mm_kda" style="float: right;">
						<img alt="" src="${pageContext.request.contextPath }/resources/images/kda.png">
						<span>${homeTeamKill }/${homeTeamDeath }/${homeTeamAssist }</span>
					</div>
					<div class="mm_object" style="float: right;">
						<img alt="" src="${pageContext.request.contextPath }/resources/images/dragon.png">
						<span>${homeTeamObject.dragon }</span>
						<img alt="" src="${pageContext.request.contextPath }/resources/images/tower.png">
						<span>${homeTeamObject.tower }</span>
						<img alt="" src="${pageContext.request.contextPath }/resources/images/baron.png">
						<span>${homeTeamObject.baron }</span>
					</div>
					<div class="mm_tierAvg" style="float: right;">
						<img alt="" src="${pageContext.request.contextPath }/resources/images/tierEmblem/${homeTeamTierAvg }.png" width="25" height="25">
					</div>
				</div>
			</div>
			<div class="teamMember" id="homeTeamMinimal" style="height: 300px;">
				<c:forEach var="nickname" items="#{homeTeamNicknameList }" varStatus="status">
					<c:choose>
						<c:when test="${homeTeamMultikill[status.index] == '솔로킬' }">
							<c:set var="multikillColor" value="gray"/>
						</c:when>
						<c:when test="${homeTeamMultikill[status.index] == '더블킬' }">
							<c:set var="multikillColor" value="green"/>	
						</c:when>
						<c:when test="${homeTeamMultikill[status.index] == '트리플' }">
							<c:set var="multikillColor" value="blue"/>	
						</c:when>
						<c:when test="${homeTeamMultikill[status.index] == '쿼드라' }">
							<c:set var="multikillColor" value="#ffecaa"/>	
						</c:when>
						<c:otherwise>
							<c:set var="multikillColor" value="red"/>
						</c:otherwise>
					</c:choose>
				
					<div class="minimal">
						<div class="minimal_child" id="home_minimal_tierArea" style="width: 10%; border-right: 1px solid black;">
							<c:if test="${!empty homeTeamTierList[status.index]}">
								<span style="border: 1px solid #343a40 !important; border-radius: 12px; padding: 3px;"><em>${homeTeamTierList[status.index] }</em></span>
							</c:if>
						</div>
						<div class="minimal_child" id="home_minimal_nicknameArea" style="width: 20%; display: block;">
							<span><a href="${pageContext.request.contextPath }/match/search?sName=${nickname}" style="white-space: nowrap; text-decoration: none; color: black;">${nickname }</a></span> <br>
							<c:choose>
								<c:when test="${homeTeamMemberKda[status.index] lt 3}">
									<c:set var="kdaColor" value="gray"/>
								</c:when>
								<c:when test="${homeTeamMemberKda[status.index] lt 4}">
									<c:set var="kdaColor" value="green"/>
								</c:when>
								<c:when test="${homeTeamMemberKda[status.index] lt 5}">
									<c:set var="kdaColor" value="blue"/>
								</c:when>
								<c:otherwise>
									<c:set var="kdaColor" value="#ffecaa"/>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${homeTeamMemberDeath[status.index] == 0 }">
									PERPECT
								</c:when>
								<c:otherwise>
									<span style=" font-weight: bold; color: ${kdaColor}">KDA : ${homeTeamMemberKda[status.index] }</span>
								</c:otherwise>
							</c:choose>
							<br>
							(${homeTeamMemberKill[status.index] }/${homeTeamMemberDeath[status.index] }/${homeTeamMemberAssist[status.index] })
						</div>
						<div class="minimal_child" id="home_minimal_championPictureArea" style="width: 10%; overflow: hidden;">
							<a href="${pageContext.request.contextPath }/champ/selectList?championid=${homeTeamChampIdList[status.index] }"><img alt="" src="https://ddragon.leagueoflegends.com/cdn/${cdn }/img/champion/${homeTeamChampIconList[status.index] }" width="100%" height="100%"></a>
						</div>
						<div class="minimal_child" id="home_minimal_spellRuneArea" style="width: 10%;">
							<div class="minimal_spellRune">
								<img alt="" src="https://ddragon.leagueoflegends.com/cdn/${cdn }/img/spell/${homeTeamMemberSpellRune[status.index]['spell1'] }.png" width="100%" height="100%">
							</div>
							<div class="minimal_spellRune">
								<img alt="" src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/${homeTeamMemberSpellRune[status.index]['rune1'] }.png" width="100%" height="100%">
							</div>
							<div class="minimal_spellRune">
								<img alt="" src="https://ddragon.leagueoflegends.com/cdn/${cdn }/img/spell/${homeTeamMemberSpellRune[status.index]['spell2'] }.png" width="100%" height="100%">
							</div>
							<div class="minimal_spellRune">
								<img alt="" src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/${homeTeamMemberSpellRune[status.index]['rune2'] }.png" width="100%" height="100%">
							</div>
						</div>
						<div class="minimal_child" id="home_minimal_itemArea" style="width: 30%; border-right: 1px solid black;">
							<c:forEach var="item" items="${homeTeamItemList[status.index] }" varStatus="st">
								<div id="minimal_item" style="width: 20%; height: 50%;">
									<c:choose>
										<c:when test="${item != 0}">
											<img alt="" src="http://ddragon.leagueoflegends.com/cdn/${cdn }/img/item/${item }.png" width="100%" height="100%">
										</c:when>
										<c:otherwise>
											<img alt="" src="${pageContext.request.contextPath }/resources/images/noItem.png" width="100%" height="100%">
										</c:otherwise>
									</c:choose>
								</div>
								<br>
							</c:forEach>
						</div>
						<div class="minimal_child" id="home_minimal_scoreArea" style="width: 20%;">
							<div id="multikill" class="matchScore">
								<span style="color: ${multikillColor}">${homeTeamMultikill[status.index] }</span>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<div id="mm_awayTeam">
		<div id="mm_awayTeamInfo">
			<div class="teamMember" id="awayTeamAvg">
				<div class="mm_winLose" style="float: right;">
					<c:choose>
						<c:when test="${awayTeamWinLose == 'Win'}">
							<span>승리</span>
						</c:when>
						<c:otherwise>
							<span>패배</span>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="mm_kda" style="float: left;">
					<img alt="" src="${pageContext.request.contextPath }/resources/images/kda.png">
					<span>${awayTeamKill }/${awayTeamDeath }/${awayTeamAssist }</span>
				</div>
				<div class="mm_object" style="float: left;">
					<img alt="" src="${pageContext.request.contextPath }/resources/images/dragon.png">
					<span>${awayTeamObject.dragon }</span>
					<img alt="" src="${pageContext.request.contextPath }/resources/images/tower.png">
					<span>${awayTeamObject.tower }</span>
					<img alt="" src="${pageContext.request.contextPath }/resources/images/baron.png">
					<span>${awayTeamObject.baron }</span>
				</div>
				<div class="mm_tierAvg" style="float: left;">
					<img alt="" src="${pageContext.request.contextPath }/resources/images/tierEmblem/${awayTeamTierAvg }.png" width="25" height="25">
				</div>
			</div>
			<div class="teamMember" id="awayTeamMinimal" style="height: 300px;">
				<c:forEach var="nickname" items="#{awayTeamNicknameList }" varStatus="status">
					<c:choose>
						<c:when test="${awayTeamMultikill[status.index] == '솔로킬' }">
							<c:set var="multikillColor" value="gray"/>
						</c:when>
						<c:when test="${awayTeamMultikill[status.index] == '더블킬' }">
							<c:set var="multikillColor" value="green"/>	
						</c:when>
						<c:when test="${awayTeamMultikill[status.index] == '트리플' }">
							<c:set var="multikillColor" value="blue"/>	
						</c:when>
						<c:when test="${awayTeamMultikill[status.index] == '쿼드라' }">
							<c:set var="multikillColor" value="#ffecaa"/>	
						</c:when>
						<c:otherwise>
							<c:set var="multikillColor" value="red"/>
						</c:otherwise>
					</c:choose>
					<div class="minimal">
						<div class="minimal_child" id="away_minimal_tierArea" style="width: 10%; border-right: 1px solid black">
							<c:if test="${!empty awayTeamTierList[status.index]}">
								<span style="border: 1px solid #343a40 !important; borer-radius: 12px; padding: 3px;"><em>${awayTeamTierList[status.index] }</em></span>
							</c:if>
						</div>
						<div class="minimal_child" id="away_minimal_nicknameArea" style="width: 20%; display: block;">
							<span><a href="${pageContext.request.contextPath }/match/search?sName=${nickname}" style="white-space: nowrap; text-decoration: none; color: black;">${nickname }</a></span> <br>
							<c:choose>
								<c:when test="${awayTeamMemberKda[status.index] lt 3}">
									<c:set var="kdaColor" value="gray"/>
								</c:when>
								<c:when test="${awayTeamMemberKda[status.index] lt 4}">
									<c:set var="kdaColor" value="green"/>
								</c:when>
								<c:when test="${awayTeamMemberKda[status.index] lt 5}">
									<c:set var="kdaColor" value="blue"/>
								</c:when>
								<c:otherwise>
									<c:set var="kdaColor" value="#ffecaa"/>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${awayTeamMemberDeath[status.index] == 0 }">
									PERPECT
								</c:when>
								<c:otherwise>
									<span style="font-weight: bold; color: ${kdaColor}">KDA : ${awayTeamMemberKda[status.index] }</span>
								</c:otherwise>
							</c:choose>
							<br>
							(${awayTeamMemberKill[status.index] }/${awayTeamMemberDeath[status.index] }/${awayTeamMemberAssist[status.index] })
						</div>
						<div class="minimal_child" id="away_minimal_championPictureArea" style="width: 10%; overflow: hidden;">
							<a href="${pageContext.request.contextPath }/champ/selectList?championid=${awayTeamChampIdList[status.index] }"><img alt="" src="https://ddragon.leagueoflegends.com/cdn/${cdn }/img/champion/${awayTeamChampIconList[status.index] }" width="100%" height="100%"></a>
						</div>
						<div class="minimal_child" id="away_minimal_spellRuneArea" style="width: 10%;">
							<div class="minimal_spellRune">
								<img alt="" src="https://ddragon.leagueoflegends.com/cdn/${cdn }/img/spell/${awayTeamMemberSpellRune[status.index]['spell1'] }.png" width="100%" height="100%">
							</div>
							<div class="minimal_spellRune">
								<img alt="" src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/${awayTeamMemberSpellRune[status.index]['rune1'] }.png" width="100%" height="100%">
							</div>
							<div class="minimal_spellRune">
								<img alt="" src="https://ddragon.leagueoflegends.com/cdn/${cdn }/img/spell/${awayTeamMemberSpellRune[status.index]['spell2'] }.png" width="100%" height="100%">
							</div>
							<div class="minimal_spellRune">
								<img alt="" src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/${awayTeamMemberSpellRune[status.index]['rune2'] }.png" width="100%" height="100%">
							</div>
						</div>
						<div class="minimal_child" id="away_minimal_itemArea" style="width: 30%; border-right: 1px solid black;">
							<c:forEach var="item" items="${awayTeamItemList[status.index] }" varStatus="st">
								<div id="minimal_item" style="width: 20%; height: 50%;">
									<c:choose>
										<c:when test="${item != 0}">
											<img alt="" src="http://ddragon.leagueoflegends.com/cdn/${cdn }/img/item/${item }.png" width="100%" height="100%">
										</c:when>
										<c:otherwise>
											<img alt="" src="${pageContext.request.contextPath }/resources/images/noItem.png" width="100%" height="100%">
										</c:otherwise>
									</c:choose>
								</div>
								<br>
							</c:forEach>
						</div>
						<div class="minimal_child" id="away_minimal_scoreArea" style="width: 20%;">
							<div id="multikill" class="matchScore">
								<span style="color: ${multikillColor}">${awayTeamMultikill[status.index] }</span>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<c:forEach var="i" begin="0" end="7">
		<c:choose>
			<c:when test="${i == 0 }">
				<c:set var="compare_title" value="킬 관여"/>
			</c:when>
			<c:when test="${i == 1 }">
				<c:set var="compare_title" value="CS"/>
			</c:when>
			<c:when test="${i == 2 }">
				<c:set var="compare_title" value="준 피해"/>
			</c:when>
			<c:when test="${i == 3 }">
				<c:set var="compare_title" value="받은 피해"/>
			</c:when>
			<c:when test="${i == 4 }">
				<c:set var="compare_title" value="골드 획득"/>
			</c:when>
			<c:when test="${i == 5 }">
				<c:set var="compare_title" value="레벨"/>
			</c:when>
			<c:when test="${i == 6 }">
				<c:set var="compare_title" value="와드 설치"/>
			</c:when>
			<c:otherwise>
				<c:set var="compare_title" value="와드 제거"/>
			</c:otherwise>
		</c:choose>
		<div class="compareArea" >
			<c:forEach var="icon" begin="0" end="4">
				<c:choose>
					<c:when test="${i == 0 }">
						<c:set var="homeTeamValue" value="${homeTeamMemberKill[icon] }"/>
						<c:set var="awayTeamValue" value="${awayTeamMemberKill[icon] }"/>
						<c:set var="homeTeamRageValue" value="${((homeTeamMemberKill[icon] + homeTeamMemberAssist[icon]) / (homeTeamKill + homeTeamAssist)) * 100 }"/>
						<c:set var="awayTeamRageValue" value="${((awayTeamMemberKill[icon] + awayTeamMemberAssist[icon]) / (awayTeamKill + awayTeamAssist)) * 100 }"/>
					</c:when>
					<c:when test="${i == 1 }">
						<c:set var="homeTeamValue" value="${homeTeamMemberCs[icon] }"/>
						<c:set var="awayTeamValue" value="${awayTeamMemberCs[icon] }"/>
						<c:set var="homeTeamRageValue" value="${(homeTeamMemberCs[icon] / homeTeamCs ) * 100}"/>
						<c:set var="awayTeamRageValue" value="${(awayTeamMemberCs[icon] / awayTeamCs ) * 100}"/>
					</c:when>
					<c:when test="${i == 2 }">
						<c:set var="homeTeamValue" value="${homeTeamMemberDoDmg[icon] }"/>
						<c:set var="awayTeamValue" value="${awayTeamMemberDoDmg[icon] }"/>
						<c:set var="homeTeamRageValue" value="${(homeTeamMemberDoDmg[icon] / homeTeamDoDmg ) * 100}"/>
						<c:set var="awayTeamRageValue" value="${(awayTeamMemberDoDmg[icon] / awayTeamDoDmg ) * 100}"/>
					</c:when>
					<c:when test="${i == 3 }">
						<c:set var="homeTeamValue" value="${homeTeamMemberTakenDmg[icon] }"/>
						<c:set var="awayTeamValue" value="${awayTeamMemberTakenDmg[icon] }"/>
						<c:set var="homeTeamRageValue" value="${(homeTeamMemberTakenDmg[icon] / homeTeamTakenDmg ) * 100}"/>
						<c:set var="awayTeamRageValue" value="${(awayTeamMemberTakenDmg[icon] / awayTeamTakenDmg ) * 100}"/>
					</c:when>
					<c:when test="${i == 4 }">
						<c:set var="homeTeamValue" value="${homeTeamMemberGold[icon] }"/>
						<c:set var="awayTeamValue" value="${awayTeamMemberGold[icon] }"/>
						<c:set var="homeTeamRageValue" value="${(homeTeamMemberGold[icon] / homeTeamGold ) * 100}"/>
						<c:set var="awayTeamRageValue" value="${(awayTeamMemberGold[icon] / awayTeamGold ) * 100}"/>
					</c:when>
					<c:when test="${i == 5 }">
						<c:set var="homeTeamValue" value="${homeTeamMemberLevel[icon] }"/>
						<c:set var="awayTeamValue" value="${awayTeamMemberLevel[icon] }"/>
						<c:set var="homeTeamRageValue" value="${(homeTeamMemberLevel[icon] / 18 ) * 100}"/>
						<c:set var="awayTeamRageValue" value="${(awayTeamMemberLevel[icon] / 18 ) * 100}"/>
					</c:when>
					<c:when test="${i == 6 }">
						<c:set var="homeTeamValue" value="${homeTeamMemberWardInstall[icon] }"/>
						<c:set var="awayTeamValue" value="${awayTeamMemberWardInstall[icon] }"/>
						<c:set var="homeTeamRageValue" value="${(homeTeamMemberWardInstall[icon] / homeTeamWardInstall ) * 100}"/>
						<c:set var="awayTeamRageValue" value="${(awayTeamMemberWardInstall[icon] / awayTeamWardInstall ) * 100}"/>
					</c:when>
					<c:when test="${i == 7 }">
						<c:set var="homeTeamValue" value="${homeTeamMemberWardRemove[icon] }"/>
						<c:set var="awayTeamValue" value="${awayTeamMemberWardRemove[icon] }"/>
						<c:set var="homeTeamRageValue" value="${(homeTeamMemberWardRemove[icon] / homeTeamWardRemove ) * 100}"/>
						<c:set var="awayTeamRageValue" value="${(awayTeamMemberWardRemove[icon] / awayTeamWardRemove ) * 100}"/>
					</c:when>
				</c:choose>
				<c:if test="${icon == 0 }">
					<div id="compare_title" class="compare_member">
						<h3>${compare_title }</h3>
					</div>
				</c:if>
				<div class="compare_member">
					<div class="compare_barArea">
						<div class="max_rage">
							<span style="font-size: 12px; float: left; margin-left: 5px;">${homeTeamValue }</span>
							<div class="rage_value" style="width: ${homeTeamRageValue}%; height: 100%; background-color: #0088cc; float: right; border-radius: 10px;">
							</div>
						</div>
							
					</div>
					<div class="compare_champIconArea">
						<img alt="" src="https://ddragon.leagueoflegends.com/cdn/${cdn }/img/champion/${homeTeamChampIconList[icon] }" width="100%" height="100%">
					</div>
					<div class="compare_champIconArea">
						<img alt="" src="https://ddragon.leagueoflegends.com/cdn/${cdn }/img/champion/${awayTeamChampIconList[icon] }" width="100%" height="100%">
					</div>
					<div class="compare_barArea">
						<div class="max_rage">
							<span style="font-size: 12px; float: right; margin-right: 5px;">${awayTeamValue }</span>
							<div class="rage_value" style="width: ${awayTeamRageValue}%; height: 100%; background-color: #d53f3a; float: left; border-radius: 10px;">
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</c:forEach>
</div>