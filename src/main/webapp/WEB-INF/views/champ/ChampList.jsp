<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<script type="text/javascript" src="/lol/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/scrap.js"></script>
<style type="text/css">
.charFace img {
	padding-top: 40px;
	padding-left: 5px;
}

#info {
	display: inline-block;
	padding-left: 20px;
}

#all {
	width: 1400px;
	height: 100%;
}

#charFace {
	display: inline-block;
	width: 760px;
}

#CHAR {
	display: inline-block;
}

.list {
	border: 1px white solid;
	position: absolute;
	left: 1100px;
	width: 400px;
	position: absolute;
}

.btn-primary {
	background-color: black;
	border-color: gray;
	width: 32.5%;
}
</style>
</head>

<body>

	<div id="all">

		<div>
			<div id="charFace">
				<h1>챔피언데이터</h1>
				<div id="list" class='list'>
					<div>
						<button type="button" id="winbtn" class="btn btn-primary btn-lg">
							승률</button>
						<button type="button" class="btn btn-primary btn-lg" id="pickbtn">픽률</button>
						<button type="button" class="btn btn-primary btn-lg" id="banbtn">벤률</button>
						<table class="table table-striped winlist" id='table1'>


						</table>


						<br>
						<div></div>

					</div>

				</div>

			</div>
		</div>
	</div>




	<script type="text/javascript">
		$(function() {

			$
					.ajax({
						url : "/lol/champ/ChampList",
						dataType : 'json',
						type : "get",
						success : function(data) {
							console.log(data);
							console.log(data.winlist);
							
							$("#table1")
									.append(
											"<tbody><tr><td>순위</td><td>챔피언</td><td>승률</td></tr></tbody>");
							$
									.each(
											data.winlist,
											function(key, value) {
												console.log(key);
												console.log(value);
												$(".winlist tbody")
														.append(
																"<tr><td>"
																		+ (key + 1)
																		+ "</td>"
																		+ "<td><a href='/lol/champ/selectList?championid="+value.CHAMPIONID+"'><image style='width:45px;'  id='"+key+"' src='http://ddragon.leagueoflegends.com/cdn/11.3.1/img/champion/"+value.PICTURE+"'>"
																		+ value.NAME
																		+ "</a></td>"
																		+ "<td>"
																		+ value.WINRANK
																		+ "%</td></tr>");

											})
							$
									.each(
											data.map,
											function(key, value) {

												$("#charFace")
														.append(
																"<div id='info'><a href='/lol/champ/selectList?championid="
																		+ value.championid
																		+ "'><image id='"+key+"' src='http://ddragon.leagueoflegends.com/cdn/11.3.1/img/champion/"+value.picture+"'></a><br>"
																		+ value.name
																		+ "</div>")

											})
						$("#winbtn")
									.click(
											function() {
												$("#table1").empty();
												$("#table1")
														.append(
																"<tbody><tr><td>순위</td><td>챔피언</td><td>승률</td></tr></tbody>");
												$
														.each(
																data.winlist,
																function(key,
																		value) {
																	console
																			.log(key);
																	console
																			.log(value);
																	$(
																			".winlist tbody")
																			.append(
																					"<tr><td>"
																							+ (key + 1)
																							+ "</td>"
																							+ "<td><a href='/lol/champ/selectList?championid="+value.CHAMPIONID+"'><image style='width:45px;'  id='"+key+"' src='http://ddragon.leagueoflegends.com/cdn/11.3.1/img/champion/"+value.PICTURE+"'>"
																							+ value.NAME
																							+ "</a></td>"
																							+ "<td>"
																							+ value.WINRANK
																							+ "%</td></tr>");

																})

											})
							$("#pickbtn")
									.click(
											function() {
												$("#table1").empty();
												$("#table1")
														.append(
																"<tbody><tr><td>순위</td><td>챔피언</td><td>픽률</td></tr></tbody>");
												$
														.each(
																data.picklist,
																function(key,
																		value) {
																	console
																			.log(key);
																	console
																			.log(value);
																	$(
																			".winlist tbody")
																			.append(
																					"<tr><td>"
																							+ (key + 1)
																							+ "</td>"
																							+ "<td><a href='/lol/champ/selectList?championid="+value.CHAMPIONID+"'><image style='width:45px;'  id='"+key+"' src='http://ddragon.leagueoflegends.com/cdn/11.3.1/img/champion/"+value.PICTURE+"'>"
																							+ value.NAME
																							+ "</a></td>"
																							+ "<td>"
																							+ value.PICKPER
																							+ "%</td></tr>");

																})

											})
														$("#banbtn")
									.click(
											function() {
												$("#table1").empty();
												$("#table1")
														.append(
																"<tbody><tr><td>순위</td><td>챔피언</td><td>벤률</td></tr></tbody>");
												$
														.each(
																data.banlist,
																function(key,
																		value) {
																	console
																			.log(key);
																	console
																			.log(value);
																	$(
																			".winlist tbody")
																			.append(
																					"<tr><td>"
																							+ (key + 1)
																							+ "</td>"
																							+ "<td><a href='/lol/champ/selectList?championid="+value.CHAMPIONID+"'><image style='width:45px;'  id='"+key+"' src='http://ddragon.leagueoflegends.com/cdn/11.3.1/img/champion/"+value.PICTURE+"'>"
																							+ value.NAME
																							+ "</a></td>"
																							+ "<td>"
																							+ value.BANPER
																							+ "%</td></tr>");

																})

											})

						}
					})

		})
	</script>
</body>
</html>