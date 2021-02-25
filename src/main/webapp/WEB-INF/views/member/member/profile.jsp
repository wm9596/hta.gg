<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>


#profile_wrap {
	width: 100%;
 	font-size: 12px; 
}

#profile_wrap div {
	border: 0.1px solid black;
}

.search-bar {
	width: 500px;
}

#myProfileArea {
	width: 50%;
	height: 700px;
	margin: auto;
}

#profile_top {
	width: 100%;
	height: 20%;
}

#profile_top_iconArea {
	width: 100%;
	height: 80%;
	text-align: center;
}

#profile_top_nicknameArea {
	width: 100%;
	height: 20%;
	text-align: center;
}

.profileIcon {
	width: 25%;
	height: 100%;
	border-radius: 100%;
	text-align: center;
}

#profile_middle {
	width: 100%;
	height: 25%;
}

.profile_middle_tierArea {
	width: 50%;
	height: 100%;
	float: left;
	text-align: center;
}

.profile_middle_tierArea img {
	width: 45%;
	height: 50%;
}

#profile_middle_2 {
	width: 100%;
	height: 25%;
}

#profile_middle_2_titleArea {
	width: 100%;
	height: 15%;
	text-align: center;
}

.profile_mostarea {
	width: 33.3%;
	height: 85%;
	float: left;
}

#profile_bottom {
	width: 100%;
	height: 30%;
}

#profile_bottom_titleArea {
	width: 100%;
	height: 15%;
	text-align: center;
}

.lastMatch {
	width: 33.3%;
	height: 85%;
	float: left;
}

.profile_mostarea {
	text-align: center;
}

.profile_mostarea img {
	width: 40%;
	height: 45%;
	border-radius: 100%;
}

.lastMatch {
	text-align: center;
	vertical-align: middle;
}

.lastMatch img {
	width: 40%;
	height: 40%;
	border-radius: 100%;
}

#profile_registerArea {
	width: 70px;
	height: 25px;
	margin: auto;
}


</style>

<div id="profile_wrap">
	<div id="myProfileArea">
		<div id="profile_top">
			<div id="profile_top_iconArea"></div>
			<div id="profile_top_nicknameArea"></div>
		</div>
		<div id="profile_middle">
			<div id="soloTier" class="profile_middle_tierArea">
			</div>
			<div id="flexTier" class="profile_middle_tierArea">
			</div>
		</div>
		<div id="profile_middle_2">
			<div id="profile_middle_2_titleArea">
			</div>
			<div id="mostOne" class="profile_mostarea">
			</div>
			<div id="mostTwo" class="profile_mostarea">
			</div>
			<div id="mostThree" class="profile_mostarea">
			</div>
		</div>
		<div id="profile_bottom">
			<div id="profile_bottom_titleArea">
			</div>
			<div class="lastMatch">
			</div>
			<div class="lastMatch">
			</div>
			<div class="lastMatch">
			</div>
		</div>
	</div>
	<div id="profile_registerArea">
		<input type="button" id="profile_register" value="프로필 등록">
		<input type="hidden" id="user_name" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}">
	</div>
	<div class="mx-auto mt-5 search-bar input-group mb-3">
		<input id="snickname" type="text" class="form-control rounded-pill" placeholder="LOL 닉네임을 입력해주세요." aria-label="Recipient's username" aria-describedby="button-addon2" value="더덕순대국"> 
		<input type="button" id="getInfo" value="검색">
	</div>
</div>



<script>

	function LoadingWithMask(gif) {
	    //화면의 높이와 너비를 구하기.
	    var maskHeight = $(document).height();
	    var maskWidth  = window.document.body.clientWidth;
	     
	    //화면에 출력할 마스크를 설정.
	    var mask       ="<div id='mask' style='position:absolute; z-index:9000; background-color:#000000; display:none; left:0; top:0;'></div>";
	    var loadingImg ='';
	      
	    loadingImg +=" <img src='"+ gif +"' style='position: absolute; display: block; margin: 0px auto;'/>";
	 
	    //화면에 레이어 추가
	    $('body').append(mask)
	 
	    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채우기.
	    $('#mask').css({
	            'width' : maskWidth,
	            'height': maskHeight,
	            'opacity' :'0.3'
	    });
	  
	    //마스크 표시
	    $('#mask').show();
	  
	    //로딩중 이미지 표시
	    $('#loadingImg').append(loadingImg);
	    $('#loadingImg').show();
	}

	function showProfile(snickname) {
		LoadingWithMask('/lol/resources/images/Spinner.gif');
		$.ajax({
			url : '/lol/member/member/registerProfile?snickname=' + snickname,
			success : function(result) {
				console.log(result);
				var soloTier = $(result).find("soloVo").find("tier").text();
				soloTier = soloTier.split("_")[0];
				var soloWin = parseInt($(result).find("soloVo").find("win").text());
				var soloLose = parseInt($(result).find("soloVo").find("lose").text());
				var flexTier = $(result).find("flexVo").find("tier").text();
				flexTier = flexTier.split("_")[0];
				var flexWin = parseInt($(result).find("flexVo").find("win").text());
				var flexLose = parseInt($(result).find("flexVo").find("lose").text());
				var icon = $(result).find("searchVo").find("icon").text();
				var level = $(result).find("searchVo").find("slevel").text();
				
				$("#myProfileArea div div").each(function() {
					$(this).empty();
				})

				$("#profile_top_iconArea").append("<img alt='' src='http://ddragon.leagueoflegends.com/cdn/11.3.1/img/profileicon/" + icon +".png' class='profileIcon'>")
				$("#profile_top_nicknameArea").append("<h5>" + snickname + "</h5>")
				if (soloTier != "") {
					$("#soloTier").append("<span>솔로랭크</span><br>")
					$("#soloTier").append("<img alt='' src='/lol/resources/images/tierEmblem/" + soloTier +".png'><br>")
					$("#soloTier").append("<span>" + soloWin + "W " + soloLose +"L</span><br>")
					$("#soloTier").append("<span>(" + parseInt(soloWin/(soloWin+soloLose)*100) +"%)</span>")	
				}
				if (flexTier != "") {
					$("#flexTier").append("<span>자유랭크</span><br>")
					$("#flexTier").append("<img alt='' src='/lol/resources/images/tierEmblem/" + flexTier +".png'><br>")
					$("#flexTier").append("<span>" + flexWin + "W " + flexLose +"L</span><br>")
					$("#flexTier").append("<span>(" + parseInt(flexWin/(flexWin+flexLose)*100) +"%)</span>")	
				}
				
				$("#profile_middle_2_titleArea").append("<h6>많이 플레이한 챔피언 TOP3</h6>");
				$("#profile_bottom_titleArea").append("<h6>최근 3경기 </h6>");
				
				
				var mostArea = $(".profile_mostarea").get();
				for(let i=0; i<3; i++) {
					let most = $(result).find("mlist")[i];
					
					if ($(most).find("picture").text() != ""){
						$(mostArea[i]).append(
								"<img alt='' src='https://ddragon.leagueoflegends.com/cdn/11.3.1/img/champion/" + $(most).find("picture").text() +"'><br>" +
								"<span>" + Math.round((parseFloat($(most).find("kill").text()) + parseFloat($(most).find("assist").text()))/parseFloat($(most).find("death").text()) * 100)/100 +"</span><br>" +
								"<span>(" + $(most).find("kill").text() + "/" + $(most).find("death").text() + "/" + $(most).find("assist").text() +")</span><br>" +
								"<span>" + $(most).find("wincnt").text() + "W" + (parseInt($(most).find("cnt").text()) - parseInt($(most).find("wincnt").text()))  + "L</span><br>" +
								"<span>" + $(most).find("rate").text() +"%</span>"
						)
					}
				}
				
				var lastMatchArea = $(".lastMatch").get();
				for (let i=0; i<3; i++) {
					let lastMatch = $(result).find("matchLastThree")[i];
					if ($(lastMatch).find("winlose").text() != "") {
						if ($(lastMatch).find("winlose").text() == 'Win') {
							$(lastMatchArea[i]).css("backgroundColor", "#9ac0ff");
						} else {
							$(lastMatchArea[i]).css("backgroundColor", "#ffaeae");
						}
						$(lastMatchArea[i]).append(
								"<img alt='' src='https://ddragon.leagueoflegends.com/cdn/11.3.1/img/champion/" + $(lastMatch).find("championId").text() +"'><br>" +
								"<span>" + Math.round((parseInt($(lastMatch).find("kill").text()) + parseInt($(lastMatch).find("assist").text()))/parseInt($(lastMatch).find("death").text()) * 100)/100 + "</span><br>" +
								"<span>(" + $(lastMatch).find("kill").text() + "/" + $(lastMatch).find("death").text() + "/" + $(lastMatch).find("assist").text() + ")</span>"
						)	
					}
				}
				$('#mask, #loadingImg').hide();
			    $('#mask, #loadingImg').empty(); 
			}
		});
	}
	
	var username = $("#user_name").val();
	$.ajax({
		url : "/lol/member/member/checkProfile?username=" + username,
		dataType: "text",
		success: function (result) {
			if (result != "") {
				showProfile(result);	
			}
		}
	})

	$("#getInfo").click(function() {
		var snickname = $("#snickname").val();
		showProfile(snickname);
	});
	
	$("#profile_register").click(function() {
		var snickname = $("#snickname").val();
		$.ajax({
			url: "/lol/member/member/registerProfileOk?username=" + username + "&snickname=" + snickname,
			success: function() {
				alert("프로필 등록이 완료되었습니다.")
			}
		})
	})
</script>