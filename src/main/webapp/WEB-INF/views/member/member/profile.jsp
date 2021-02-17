<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>

#profile_wrap {
	background-color: yellow;
}

div {
	border: 1px solid gray;
}

.search-bar {
	width: 500px;
}

#myProfileArea {
	width: 60%;
	height: 500px;
	margin: auto;
}

#profileIconArea {
/* 	display: flex; */
/* 	justify-content: center; */
/* 	align-items: center; */
	float: left;
	width: 20%;
	height: 100%;
}

#imageArea {
	width: 100%;
	height: 80%;
}

#nicknameArea {
	width: 100%;
	height: 20%;
}

.profileIcon {
	border-radius: 100%;
	width: 100%;
	height: 100%;
}

#profile_top {
	height: 30%;
}

#profileTierArea{
	float: left;
	width: 40%;
	height: 100%;
}

.tierArea {
	width: 50%;
	height: 100%;
	float: left;
}

.tierImageArea {
	width: 100%;
	height: 80%;
}
</style>

<div id="profile_wrap">
	<div id="myProfileArea">
		<div id="profile_top">
			<div id="profileIconArea">
				<div id="imageArea">
				</div>
				<div id="nicknameArea">
				</div>
			</div>
			<div id="profileTierArea">
				<div id="soloTier" class="tierArea">
					<div id="soloTierImageArea" class="tierImageArea">
					</div>
				</div>
				<div id="flexTier" class="tierArea">
					<div id="flexTierImageArea" class="tierImageArea">
					</div>
				</div>
			</div>
			<div id="profileMostArea">
			</div>
		</div>
	</div>
	<div class="mx-auto mt-5 search-bar input-group mb-3">
		<input id="snickname" type="text" class="form-control rounded-pill" placeholder="LOL 닉네임을 입력해주세요." aria-label="Recipient's username" aria-describedby="button-addon2" value="더덕순대국"> 
		<input type="button" id="getInfo" value="검색">
	</div>
</div>



<script>
	$("#getInfo").click(
			function() {
				var snickname = $("#snickname").val();
				console.log(snickname);
				$.ajax({
					url : '/lol/member/member/registerProfile?snickname='
							+ snickname,
					success : function(result) {
						console.log(result);
						var soloTier = $(result).find("soloVo").find("tier").text();
						soloTier = soloTier.split("_")[0];
						var soloWin = $(result).find("soloVo").find("win").text();
						var soloLose = $(result).find("soloVo").find("lose").text();
						var flexTier = $(result).find("flexVo").find("tier").text();
						var flexWin = $(result).find("flexVo").find("win").text();
						var flexLose = $(result).find("flexVo").find("lose").text();
						var icon = $(result).find("searchVo").find("icon").text();
						var level = $(result).find("searchVo").find("slevel").text();

						$("#imageArea").append("<img alt='' src='http://ddragon.leagueoflegends.com/cdn/11.3.1/img/profileicon/" + icon +".png' class='profileIcon'>")
						$("#nicknameArea").append("<span>" + snickname + "</span>")
						$("#soloTierImageArea").append("<img alt='' src='/lol/resources/images/tierEmblem/" + soloTier +".png' class='profileIcon'>")
					}
				});
			});
</script>