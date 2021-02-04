<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="mm_wrap">
	<div id="mm_smCard">
		<div id="mm_smLeft">
			<div id="mm_smIconDiv">
				<img alt="" src="http://ddragon.leagueoflegends.com/cdn/10.11.1/img/profileicon/${sm.icon }.png" id="smIcon">
			</div>
			<div id="mm_smNicknameDiv">
				<h2>${sm.snickname }</h2>
				</br>
				<br>
				<br>
				<p>레벨 : ${sm.slevel } </p>
			</div>
		</div>
		<div id="mm_smRight">
			<div id="mm_smSoloDiv">
				<h5>솔로랭크</h5>
				<c:set var="soloTierFull" value="${qi[1].tier }"/>
				<c:set var="soloTierName" value="${fn:split(soloTierFull, '_')[0] }"/>
				<img alt="" src="${pageContext.request.contextPath }/resources/images/tierEmblem/${fn:trim(soloTierName)}.png" id="soloTierIcon" width="100" height="100">
			</div>
			<div id="mm_smFlexDiv">
				<span>자유랭크</span>
				<c:set var="flexTierFull" value="${qi[0].tier }"/>
				<c:set var="flexTierName" value="${fn:split(flexTierFull, '_')[0] }"/>
				<span>${flexTierName }</span>
				<img alt="" src="${pageContext.request.contextPath }/resources/images/tierEmblem/${fn:trim(flexTierName)}.png" id="flexTierIcon" width="100" height="100">
			</div>
			<div id="mm_smRatingDiv">
				<span>소환사평가</span>
			</div>
		</div>
	</div>
	<div id="mm_home">asdfadf</div>
	<div id="mm_away">qwerwqr</div>
</div>