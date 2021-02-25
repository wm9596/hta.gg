<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>views/community/detail.jsp</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript">
</script>
<style type="text/css">
/* 	a{ text-decoration:none; color: black; } */
	.commWrap{margin-bottom: 20px; width: 80%; position: relative; margin-bottom: 20px; margin-left: auto; margin-right: auto;}
	.comm{width: 100%; border: 1px solid #aaa;position: relative;} 
/* 	.insert{margin-top: 5%} */
/* 	.comm{margin-bottom: 20px; margin-left: 22%; width: 600px; border: 1px solid #aaa;position: relative;} */
/* 	.commWrap1{margin-bottom: 20px; margin-left: 25%; width: 600px; position: relative;} */
</style>
<c:if test="${vo.cNum == 3 }">
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
</c:if>
</head>
<body><br>
<c:choose>
	<c:when test="${vo.cNum == 1}">
		<c:set var="categoryName" value="공략"/>
	</c:when>
	<c:when test="${vo.cNum == 2}">
		<c:set var="categoryName" value="자유"/>
	</c:when>
	<c:when test="${vo.cNum == 3}">
		<c:set var="categoryName" value="팀원모집"/>
	</c:when>
	<c:when test="${vo.cNum == 4}">
		<c:set var="categoryName" value="사건사고"/>
	</c:when>
	<c:when test="${vo.cNum == 5}">
		<c:set var="categoryName" value="Q&A"/>
	</c:when>
	<c:when test="${vo.cNum == 6}">
		<c:set var="categoryName" value="공지사항"/>
	</c:when>
	<c:otherwise>
		<c:set var="categoryName" value="경기일정"/>
	</c:otherwise>
</c:choose>
<form:form method="get" action="${pageContext.request.contextPath }/community/update">
	<input type="hidden" name="title" readonly="readonly" value="${vo.title }">
	<input type="hidden" id="pNum" name="pNum" value="${vo.pNum }">
	<input type="hidden" id="username" name="username" value="${vo.username}">
	<input type="hidden" name="cNum" value="${vo.cNum }">
	<table class="table" style="width: 70%; margin: auto;">
		<tr>
			<th scope="col">
				<h3>${vo.title }</h3>
			</th>
		</tr>
		<tr>
			<td>
				<span>${vo.username }</span><input type="button" id="sendMsg" value="쪽지"> | <span>${categoryName }</span> | <span>${vo.regdate }</span>
			</td>
			<td>
				<span>조회 ${vo.viewCount+1}</span> | <span>추천 ${vo.hit }</span> | <span>반대 ${vo.nohit }</span>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<c:if test="${categoryName == '팀원모집' }">
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
					<input type="hidden" id="user_name" value="${vo.username}">
				</div>
			</c:if>
			${vo.content }
			</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: center;">
				<button type="button" id="hit" class="btn btn-info likeBtn"	style="width: 100px; height: 50px; font-size: 25px;">추천 ${vo.hit }</button>
				<button type="button" id="nohit" class="btn btn-info likeBtn" style="width: 100px; height: 50px; font-size: 25px;">반대 ${vo.nohit }</button>
				<button type="button" id="report" class="btn btn-info likeBtn" onclick="" style="width: 100px; height: 50px; font-size: 25px;">신고</button>
			</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: center;">
<!-- 				<input type="button" value="이전 페이지로" onclick="beforePage()"> -->
				<button>게시글 수정</button>
				<input type="button" value="게시글 삭제" onclick="postDelete(${vo.pNum})">
			</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: center">
				<input type="hidden" id="rWriter" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}" readonly="readonly">
				<input type="text" id="rContent" style="width:70%">
				<input type="button" value="댓글등록" id="btn"><br><br><br>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<div id="commList"></div>
			</td>
		</tr>
		<tr>
			<td>
				<span>이전글</span> <a href='${pageContext.request.contextPath }/community/detail?pNum=${next.pNum}&cNum=${vo.cNum}'>${next.title }</a>
				<br>
				<span>다음글</span> <a href='${pageContext.request.contextPath }/community/detail?pNum=${prev.pNum}&cNum=${vo.cNum}'>${prev.title }</a>
			</td>
		</tr>
	</table>
</form:form>
<c:if test="${categoryName == '팀원모집' }">
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
		console.log("showProfile snickname = " + snickname)
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

// 	$("#getInfo").click(function() {
// 		var snickname = $("#snickname").val();
// 		showProfile(snickname);
// 	});
	
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
</c:if>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/scrap.js" ></script>
<script type="text/javascript">

	var username = "${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}";
	var pnum = ${vo.pNum };
	
	$(function(){
	   getList();
	   
	   $("#btnScrap").on("click",function(){
	      scrap(pnum,username);
	   });
	   
	})

	$("#hit").click(function(e){
		var ask = confirm("해당 게시글을 추천하시겠습니까?");
		var username = document.getElementById("object HTMLInputElement");
		if(ask == true){
			if(username != null){
				$.ajax({
					url:"/lol/update/" + ${vo.pNum },
					success: function(data){
						alert('추천 성공');
						$("#hit").html('추천 '+data);
					}
				});
			}
			alert('로그인 후 이용해주세요.');
		}
	});
	
	$("#nohit").click(function(e){
		var ask = confirm("해당 게시글을 반대하시겠습니까?");
		var username = document.getElementById("object HTMLInputElement");
		if(ask == true){
			if(username != null){
				$.ajax({
					url:"/lol/update1/" + ${vo.pNum },
					success: function(data){
						alert('반대 성공');
						$("#nohit").html('반대 '+data);
				}
			});
		}
		alert('로그인 후 이용해주세요.');
	}
	});
	
	$("#btn").click(function(){
		var rWriter = document.getElementById("rWriter").value;
		var rContent = document.getElementById("rContent").value;
		var ask = confirm("댓글을 등록하시겠습니까?");
		if(ask == true){
		$.ajax({
			url:"/lol/insert/${vo.pNum}/"+rWriter+"/"+rContent+"/",
			success: function(data) {
				var code=$(data).find("code").text();
				alert("댓글이 등록되었습니다.");
				if(code=='success'){
					getList();
					$("#rContent").val('');
				}else{
					alert('등록 실패!');
				}
			}
		});
		}
	});
	
	function removeComm(rNum, pNum) {
		console.log("===========================");
		var ask = confirm("정말로 삭제하시겠습니까?");
		if(ask == true){
		$.ajax({
			url:"/lol/delete/"+rNum+"/"+pNum,
			success: function(data) {
				var code=$(data).find("code").text();
				if(code=='success'){
					alert('댓글이 삭제되었습니다.');
					getList();
				}else{
					alert('삭제 실패!');
				}
			}
		});
		}
	}

	function postDelete(pNum){
		var ask = confirm("정말로 삭제하시겠습니까?");
		if(ask == true){
		$.ajax({
			url:"/lol/community/delete/"+pNum,
			success: function(data) {
				var code=$(data).find("code").text();
				alert("게시글이 삭제되었습니다.");
				if(code=='success'){
					beforePage();
				}else{
					alert('삭제 실패!');
				}
			}
		});
		}
	}
	
	function replyHit(rNum) {
		var ask = confirm("해당 댓글을 추천하시겠습니까?");
		if(ask == true){
		$.ajax({
			url:"/lol/reHitUpdate/"+rNum,
			success: function(data) {
					alert('추천 성공');
					getList();
			}
		});
		}
	}

	function replyNohit(rNum) {
		var ask = confirm("해당 댓글을 반대하시겠습니까?");
		if(ask == true){
		$.ajax({
			url:"/lol/reNohitUpdate/"+rNum,
			success: function(data) {
					alert('반대 성공');
					getList();
			}
		});
		}
	}
	
	$("#report").click(function() {
		var username = $("#rWriter").val();
		var pNum = $("#pNum").val();
		if (username == "") {
			alert("로그인이 필요한 페이지입니다.");
			location.href = "/lol/member/login";
		} else {
			$.ajax({
				url: "/lol/reportCheck?pNum=" + pNum + "&username=" + username,
				success: function(result) {
					console.log(result);
					if (result == true) {
						alert("이미 신고한 게시물입니다.")
					} else {
						window.open('/lol/reportPage?pNum=' + pNum + '&username=' + username,'신고하기','width=500px, height=300px')
					}
				}
			})
		}
	})
	
	$("#sendMsg").click(function() {
		var receiver =  $("#username").val();
		var sender = $("#rWriter").val();
		if (sender == "") {
			alert("로그인이 필요한 페이지입니다.");
			location.href = "/lol/member/login";
		}
		else {
			window.open('/lol/sendMsgPage?sender=' + sender + '&receiver=' + receiver,'쪽지 보내기','width=500px, height=300px')	
		}
	})
	
	
	function beforePage(){
		location.href = "/lol/community/list";
		return;
	}

	function getList() {
		console.log("호출");
		$.ajax({
			url:"/lol/reply/${vo.pNum}",
			dataType: 'xml',
			success: function(data){
				console.log(data);
				var commList = $("#commList");
				var childs = commList.childNodes;
				
				commList.empty();
				$(data).find("item").each(function(){
					var rNum = $(this).find("rNum").text();
					var pNum = $(this).find("pNum").text();
					var rWriter = $(this).find("rWriter").text(); 
					var rContent = $(this).find("rContent").text();
					var regdate = $(this).find("regdate").text();
					var rHit = $(this).find("rHit").text();
					var rNohit = $(this).find("rNohit").text();
					var wrapDiv = $("<div>",{class:'commWrap'});
					var div = $("<div>",{class:'comm'});
					
					div.html(
							rWriter+"&nbsp;&nbsp;&nbsp;"+rContent+"<br>"
							+regdate+"&nbsp;&nbsp;&nbsp;"
							+"<a href='javascript:replyHit("+ rNum + ")'>추천</a>[" + rHit +"]&nbsp;&nbsp;"
							+"<a href='javascript:replyNohit("+ rNum + ")'>반대</a>[" + rNohit +"]&nbsp;&nbsp;"
							+"<a href=\"javascript:rereComment("+ rNum + "," + pNum + ",'" + rWriter + "','" + rContent + "')\">답글</a>"+"&nbsp;&nbsp;"
							);
					
					console.log(username == rWriter)
					if(username == rWriter){
						let delA = $("<a>",{href:"",text:'삭제'});
						delA.on("click",function(){
							removeComm(rNum,pNum);
						});
						console.log(delA);
						div.append(delA);
					}
					

					
					
					wrapDiv.append(div);
					
					getRRlist(wrapDiv,rNum);
					
					commList.append(wrapDiv);
					
				});
			}
		});
	}
	
	function getRRlist(wrapDiv,rNum){
		$.ajax({
			url:"/lol/rereply/"+rNum,
			dataType: 'json',
			success: function(data){
				if(data.length < 1 ) return;
				console.log(rNum+"번 대댓");
				for(rereply of data){
// 					console.log(rereply);
					var rereDiv = $("<div>",{class:'commWrap1'});
					rereDiv.text("└ " + rereply.regdate + " " + rereply.rWriter + " " + rereply.rContent);
// 					console.log(wrapDiv);
					wrapDiv.append(rereDiv);
				}
			},
			error :function(data){
				console.log("없음");
			}
		});
	}
	
	function rereComment(rNum, pNum, rWriter, rContent){
		var rWriter = document.getElementById("rWriter").value;
		// var ask = document.getElementById("ask").value;
		var prompt_test = prompt("댓글을 입력해주세요.");
		console.log(prompt_test);
		if(prompt_test == null){
			getList();
		}else{
			var ask = confirm("댓글을 등록하시겠습니까?");
			if(ask == true){
			$.ajax({
				url:"/lol/rinsert/"+rNum+"/"+pNum+"/"+rWriter+"/"+prompt_test,
				success: function(data) {
					var code=$(data).find("code").text();
					if(code=='success'){
						alert("댓글이 등록되었습니다.");
						getList();
					}else{
						alert('등록 실패!');
					}
				}
			});
			}
		}
	}

	


</script>
</body>
</html>