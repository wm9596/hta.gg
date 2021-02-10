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
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url:"/lol/listTeam",
			dataType: 'json',
			type:'get',
			success:function(data){
				$.each(data.list,function(key,value){
					console.log(value.tname);
					if(value.tname!=null){
					$("#addmatch1").css({
						display: "inline"
					})
						$("#addmatch2").css({
						display: "inline"
					})
					$("#addmatch1").append("<option value='"+value.tnum+"'>"+value.tname+"</option> ");
					$("#addmatch2").append("<option value='"+value.tnum+"'>"+value.tname+"</option> ");
					
					var team2=$("#addmatch2 option:selected").val();
				
					}else{
						alert("팀이 없습니다.")
					}
				})
			}
		});
$("#matchinsert").click(function(){
	let team1=$("#addmatch1 option:selected").val();
	let team2=$("#addmatch2 option:selected").val();
	var matchday=$("#matchday").val();
	console.log(matchday)
	$.ajax({
		url:"/lol/insertmatch",
		dataType: 'json',
		data:{
			mDate:matchday,tNum1:team1,tNum2:team2,mRate:'500'
			},
		tyep:'get',
		success: function(data){
			console.log(data)
		}
	})
	
})

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
							alert("팀 추가 완료");
							$("#addTeamname").val("");
						
							
						} else {
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

		})
		$("#d2").datepicker({
			  dateFormat: 'yy/mm/dd',
		        prevText: '이전 달',	
		        nextText: '다음 달',
		        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],	
		        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],	
		        dayNames: ['일', '월', '화', '수', '목', '금', '토'],	
		        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],	
		        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],	
			onSelect:function(d){
				$("#matchList").empty();
				var today=$(this).datepicker("getDate");
				$.ajax({
					url:'/lol/match/yesdaylist',
					dataType: 'json',
					data:{
						mDate:d
					},
					success:function(data){
						console.log(data);
			 		$.each(data.matchinfo,function(key,value){
			 			
			 			if(data.matchinfo.length>0){
							$("#matchList").append("<div id='matchList2'>"+(key+1)+"번째 경기</div>"+
							"<div>"+data.matchinfo[key].B1NAME+"vs"+data.matchinfo[key].B2NAME+"</div> ");
							if(data.matchinfo[key].MWINLOSE==data.matchinfo[key].TNUM1){
							
							}else{
							
							}
					}else if(data.matchinfo.length=='0'){
						$("#matchList").append("<span style='color:blue'>"+data.matchinfo[key].B1NAME+"승리</span>");

					}  
							
						
						})
					}
				})
			}
		  })
	});

</script>
</head>
<body>
	<input type="button" value="새로운팀추가" id="addTeam">
		<input type="button" id="removeTeambtn" style="display: none;" value="팀추가끄기">
	<div id="addTeam">
		<input type="text" id="addTeamname" style="display: none;"> <input
			type="button" id="addTeambtn" style="display: none;" value="팀추가"><br>
	</div>
<div id="addmatch" >
<select id='addmatch1' style="display: none;">
</select>
<select id='addmatch2' style="display: none;">
</select><br>
<input type="date" id="matchday">
<input type="button" id="matchinsert" value="경기등록">
</div>
<div id="d2"></div>
<div id="matchList"></div>
</body>
</html>