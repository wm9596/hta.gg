<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>


<html>
<head>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script type="text/javascript" src="/lol/resources/js/jquery-3.5.1.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<meta charset="UTF-8">
<style type="text/css">
#d1{
margin-left:40%;
}
.mm.matchList{
display: inline-block; width: 10%;
}
.button{
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin-left: 40%;"
}
#matchList3.matchList{
display: inline-block; width: 40%;
}
#addTeamname {
	border:solid 2px black;
  font-size: 16px;
  margin-left: 40%;"
}
#removeTeambtn{
  background-color: red; /* Green */
  border: 3px;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
}
#addTeambtn{
background-color: black; /* Green */
  border: 1px;
  color: white;
    padding: 3px 31px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 13px;
}
select {
width: 100px;

border: 1px solid #999;

border-radius: 0px;
}



#matchinsert{
background-color: black; /* Green */
  border: 1px;
  color: white;
    padding: 3px 31px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 13px;
    margin-left: 40%;
}
#addmatch1{
	
  margin-left: 40%;
}
#matchList{

margin-top: 10px;
}
.matchList{

width: 40%; text-align: center; border: 2px solid black; display: inline-block; margin-left: 30%;"}
#addmatch{
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin-left: 40%;"
}
#matchinsert{
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
 
}
</style>
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {		
		$("#teamDelete").click(function() {
			let team1 = $("#addmatch1 option:selected").val();
			let team2 = $("#addmatch2 option:selected").val();
			$("#addmatch1 option[value='" + team1 + "']").remove();
			$.ajax({
				dataType: 'json',
				url:"/lol/battingdeleteTeam?tnum="+team1,
				tyoe:'get',
				
				success:function(data){
					alert("삭제성공")
				}
			})

		});
		$("#teamDelete2").click(function() {
			let team2 = $("#addmatch2 option:selected").val();
			$("#addmatch2 option[value='" + team2 + "']").remove();
		});
		
		   $('.ui-datepicker ').css({ "margin-left" : "500px", "margin-top": "-223px"});  
		$("#d1").datepicker({
			  dateFormat: 'yy/mm/dd',
		        prevText: '이전 달',	
		        nextText: '다음 달',
		        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],	
		        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],	
		        dayNames: ['일', '월', '화', '수', '목', '금', '토'],	
		        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],	
		        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],	
		        onSelect:function(d){
		        
		        	var dd=d;
		        	var matchday=dd.split("/");
		        
		        	var matchdayin=matchday[0]+"-"+matchday[1]+"-"+matchday[2];
		        	$("#test11").val(matchdayin);
		        
		        	dateList(d);

		        }
		})
		
	        	$("#matchinsert").click(function(){
	        		
	        	
	        		var matchdayin=$("#test11").val();
		        		let team1=$("#addmatch1 option:selected").val();
		        		let team2=$("#addmatch2 option:selected").val();
		        		
		        		
		        		
		        		$.ajax({
		        			url:"/lol/insertmatch",
		        			dataType: 'json',
		        			data:{
		        				mDate:matchdayin,tNum1:team1,tNum2:team2,mRate:'500'
		        				},
		        			tyep:'get',
		        			success: function(data){
		        			var a=	$("#test11").val();
		        			var matchday=a.split("-");
				        	var matchdayin=matchday[0]+"/"+matchday[1]+"/"+matchday[2];
				        	$("#matchList").empty();
				        	dateList(matchdayin);
		        			console.log(a);
		        			}
		        		})
		        		
		        	})
		 teamList();
		dateList();
$("#addmatch1").change(function(){
	let team1=$("#addmatch1 option:selected").val();
	let team2=$("#addmatch2 option:selected").val();
	var add1index=$("#addmatch2 option").index($("#addmatch2 option:selected"))+1;
	if(team1==team2){
		alert("같은팀 선택불가");
		if(add1index>8){
			add1index=1;
		$("#addmatch1 option:eq("+add1index+")").attr("selected","selected");
		}else{
			$("#addmatch1 option:eq("+add1index+")").attr("selected","selected");
		}
	}
})
$("#addmatch2").change(function(){
	let team1=$("#addmatch1 option:selected").val();
	let team2=$("#addmatch2 option:selected").val();
	var add2index=$("#addmatch2 option").index($("#addmatch2 option:selected"))+1;
	

	if(team1==team2){
		alert("같은팀 선택불가");
		if(add2index>8){
			add2index=1;
		$("#addmatch2 option:eq("+add2index+")").attr("selected","selected");
		}else{
			$("#addmatch2 option:eq("+add2index+")").attr("selected","selected");
		}
		
	}
})
		$("#addTeam").click(function() {
			$("#addTeamname").css({
				display : "inline"
			});
			$("#addTeambtn").css({
				display : "inline"
			});
			$("#removeTeambtn").css({
				display: "inline"
			})
			$("#addTeambtn").click(function() {
				var teamname = $("#addTeamname").val();
				$.ajax({
					url : "/lol/insertTeam",
					type : 'get',
					dataType : 'json',
					data : {
						'tname' : teamname
					},
					success : function(data) {
						console.log(data);
						if (data.code == 'success') {
							$("#addmatch1").empty();
							$("#addmatch2").empty();
							teamList();
							alert("팀 추가 완료");
							$("#addTeamname").val("");
						
							
						} else {
							$("#addmatch1").empty();
							$("#addmatch2").empty();
							teamList();
							alert("팀 추가 실패");
							$("#addTeamname").val("");
						
							
						}
					}
				})
			});
			
			$("#removeTeambtn").click(function() {
				$("#addTeamname").css({
					display : "none"
				});
				$("#addTeambtn").css({
					display : "none"
				});
				$("#removeTeambtn").css({
					display: "none"
				})
			});
			$("#teamDelete").click(function() {
				
			});

		})
/*		$("#d2").datepicker({
			  dateFormat: 'yy/mm/dd',
		        prevText: '이전 달',	
		        nextText: '다음 달',
		        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],	
		        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],	
		        dayNames: ['일', '월', '화', '수', '목', '금', '토'],	
		        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],	
		        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],	
			onSelect:function(d){
				dateList(d);
			}
		  }) */
	});
	
function yesorno(aa,bb,cc){
	if(confirm("승리한팀이 맞습니까?")) {
		console.log("aaㅁㅁㅁㅁㅁ"+aa);
		console.log("매치번호"+bb);
		console.log("팀번호"+cc);
		console.log($("#"+aa).parent());
		$("#"+aa).next().find("span").html("<span style='color:red'>&nbsp;&nbsp;홈팀 승리 입니다</span>")
		/* $("<span style='color:red'>홈팀 승리 입니다</span>").appendTo("#matchList3"); */
		$.ajax({
			url:'/lol/winupdate',
			dataType: 'json',
			data:{
				mNum:bb,mWinlose:cc
			},
			success : function(data){
				console.log(data);
				alert("성공");
			}
		})
	}else{
		return;
	}
}function yesorno2(aa,bb,cc){
	if(confirm("승리한팀이 맞습니까?")) {
		console.log("aaㅁㅁㅁㅁㅁ"+aa);
		console.log("매치번호"+bb);
		console.log("팀번호"+cc);
		console.log($("#"+aa).parent());
		console.log($("#"+aa).parent());
		$("#"+aa).next().find("span").html("<span style='color:red'>&nbsp;&nbsp;어웨이팀 승리 입니다</span>")
		/* $("<span style='color:red'>홈팀 승리 입니다</span>").appendTo("#matchList3"); */
				$.ajax({
			url:'/lol/winupdate',
			dataType: 'json',
			data:{
				mNum:bb,mWinlose:cc
			},
			success : function(data){
				console.log(data);
				alert("성공");
			}
		})
	}else{
		return;
	}
}
function teamList(){

	$.ajax({
		url:"/lol/listTeam",
		dataType: 'json',
		type:'get',
		success:function(data){
			$.each(data.list,function(key,value){
				console.log(value)
				console.log(value.tname);
				if(value.tname!=null){
				$("#addmatch1").css({
					display: "inline-block"
				})
					$("#addmatch2").css({
					display: "inline-block"
				})
				var team1=value.tname;
				$("#addmatch1").append("<option value='"+value.tnum+"'>"+value.tname+"</option> ");
				$("#addmatch2").append("<option value='"+value.tnum+"'>"+value.tname+"</option> ");
				
				var team1=$("#addmatch1 option:selected").text();
				var team2=$("#addmatch2 option:selected").text();
				
			console.log(team2)
				}else{
					return;
				}
			})
		}
	});
	}

	function dateList(d){
		$("#matchList").empty();
		console.log(d);
		if(!d){
			return;
		}
		
		var today=$(this).datepicker("getDate");
		$.ajax({
			url:'/lol/match/yesdaylist',
			dataType: 'json',
			data:{
				mDate:d
			},
			success:function(data){
				console.log(data.matchinfo.length);
				if(data.matchinfo.length==0){
					console.log("엘스@@@@@@@@@@@")
					
				}  else{
					
	 		$.each(data.matchinfo,function(key,value){
	 			console.log(data.matchinfo);
	 			console.log(value)
	 			if(data.matchinfo.length>0){
	 				var team1win="<a href='javascript:yesorno("+key+","+data.matchinfo[key].MNUM+","+value.TNUM1+")'>"+data.matchinfo[key].B1NAME+"</a>";
	 				var team2win="<a href='javascript:yesorno2("+key+","+data.matchinfo[key].MNUM+","+value.TNUM2+")'>"+data.matchinfo[key].B2NAME+"</a>";
	 				var aa=value.TNUM1;
	 				console.log(value.TNUM1);
	 				var str="<div id='"+key+"' class='mm' style='background-color:Aquamarine;'><h3>"+(key+1)+"번째 경기<span></span></h3></div>";
	 				console.log(data.matchinfo[key].MWINLOSE+"아랄랄");
	 				console.log(data.matchinfo[key].TNUM1+"dddddddddddddddd")
	 				if(data.matchinfo[key].MWINLOSE==data.matchinfo[key].TNUM1){
	 					str +="<div id='matchList3' style='background-color:DodgerBlue;'>"+team1win+"vs"+team2win+"<br><span>"+data.matchinfo[key].B1NAME+"팀이 승리한 경기입니다 클릭시 승리팀이 변경됩니다.</span></div> ";
	 				}else if(data.matchinfo[key].MWINLOSE==data.matchinfo[key].TNUM2){
	 					str +="<div id='matchList3' style='background-color:Cyan;'>"+team1win+"vs"+team2win+"<br><span>"+data.matchinfo[key].B2NAME+"팀이 승리한 경기입니다 클릭시 승리팀이 변경됩니다.</span></div> ";
	 				}else{
	 					var team1win="<a href='javascript:yesorno("+key+","+data.matchinfo[key].MNUM+","+value.TNUM1+")'>"+data.matchinfo[key].B1NAME+"</a>";
		 				var team2win="<a href='javascript:yesorno2("+key+","+data.matchinfo[key].MNUM+","+value.TNUM2+")'>"+data.matchinfo[key].B2NAME+"</a>";
					
		 				str +="<div id='matchList3'>"+team1win+"vs"+team2win+"<br><span>클릭시 승리팀을 선택합니다.</span></div> ";
						
	 				}
		 				$(str).appendTo("#matchList").addClass("matchList");
	 				
	 				
	 				
	 				
					if(data.matchinfo[key].MWINLOSE==data.matchinfo[key].TNUM1){
					
					}else{
					
					}
			}
					
				
				})
				}
			}
		})
	}

</script>
</head>
<body>

	<input type="button" value="새로운팀추가" id="addTeam" class="button">
		<input type="button" id="removeTeambtn" style="display: none;" value="팀추가끄기">
	<div id="addTeam">
		<input type="text" id="addTeamname" style="display: none;"> <input
			type="button" id="addTeambtn" style="display: none;" value="팀추가"><br>
	</div>
<div id="d1" style="width:100%;"></div>
<div id="addmatch" >
<select id='addmatch1' style="display: none;">
</select>
<input type="button" id="teamDelete" value="x">
<select id='addmatch2' style="display: none;">

</select>
<input type="button" id="teamDelete2" value="x"><br>

<input type="button" id="matchinsert" value="경기등록">
</div>
<div id="d2"></div>
<div id="matchList" style="width: 100%;"></div>
<div id="Nomatch"></div>
<input type="hidden" id="test11" >

</body>
</html>