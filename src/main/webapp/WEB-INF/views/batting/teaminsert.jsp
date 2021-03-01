<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>


<html>
<head>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript" src="/lol/resources/js/jquery-3.5.1.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/scrap.js"></script>

<meta charset="UTF-8">
<style type="text/css">
#d1{
    padding-left: 100px;
}
#adminList{
width: 350px;
}
#tb{
position: relative;
    top: -400px;
    left: 400px;
}
.button{
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;

  font-size: 16px;

}
#new{
    padding-left: 100px;
}

#addTeamname {
	border:solid 2px black;
  font-size: 16px;
}
#removeTeambtn{
  background-color: red; /* Green */
  border: 3px;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  font-size: 16px;

}

#addTeambtn{
background-color: black; /* Green */
  border: 1px;
  color: white;
    padding: 3px 31px;
  text-align: center;
  text-decoration: none;

  font-size: 13px;
}







#addmatch{
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
 
  font-size: 16px;

}
#matchinsert{
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  
  font-size: 16px;
 
}

</style>
<title>Insert title here</title>
</head>
<body>
<div id="allList33">
<div id="d1" ></div>


<div id="new">
<input type="button" value="새로운팀추가" id="addTeam" class="button">
		<input type="button" id="removeTeambtn" style="display: none;" value="팀추가끄기">

		<br>
		<input type="text" id="addTeamname" style="display: none;"> 
		<input type="button" id="addTeambtn" style="display: none;" value="팀추가"><br>
	
		<select id='addmatch1' style="display: none;">
</select><br>
<select id='addmatch2' style="display: none;">
</select><br>
		<input type="button" id="matchinsert" value="경기등록">
	


</div>

	<div id='tb'>
</div>
</div>
<input type="hidden" id="test11" >



</body>
<script type="text/javascript">
teamList();
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
		$("#pointgo").click(function(){
			console.log("ddddddddddd")
		})
		$("#teamDelete2").click(function() {
			let team2 = $("#addmatch2 option:selected").val();
			$("#addmatch2 option[value='" + team2 + "']").remove();
		});
		
		  
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
				        	$("#tb").empty();
				        	dateList(matchdayin);
		        			console.log(a);
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
			$("#addTeam").prop("disabled",true);
			$("#addTeam").css('backgroundColor', 'gray');
			
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
				$("#addTeam").prop("disabled",false);
				$("#addTeam").css('backgroundColor', '#4CAF50');
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
	
function yesorno(aa,bb,cc,dd,key){
	if(confirm("승리한팀이 맞습니까?")) {
		
		console.log("aaㅁㅁㅁㅁㅁ"+aa);
		console.log("매치번호"+bb);
		console.log("팀번호"+cc);
		console.log("승리팀"+dd);
		console.log($("#"+aa).parent());
		$("#"+aa).next().find("span").html("<input type='button' id='"+key+"' onclick='pointgo("+bb+","+dd+",event)' class='button' value='포인트 즉시지급'>")
		
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
}function yesorno2(aa,bb,cc,dd,key){
	if(confirm("승리한팀이 맞습니까!?")) {
		console.log("aaㅁㅁㅁㅁㅁ"+aa);
		console.log("매치번호"+bb);
		console.log("팀번호"+cc);
		console.log($("#"+aa).parent());
		console.log($("#"+aa).parent());
		$("#"+aa).next().find("span").html("<input type='button' id='"+key+"' onclick='pointgo("+bb+","+dd+",event)' class='button' value='포인트 즉시지급'>")
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
					display: "inline"
				})
					$("#addmatch2").css({
					display: "inline"
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
		$("#tb").empty();
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
				$("#tb").append("<h3>진행된 경기가 없습니다.</h3>")
					
				}  else{
					
	 		$.each(data.matchinfo,function(key,value){
	 			console.log(data.matchinfo);
	 			console.log(value)
	 			if(data.matchinfo.length>0){
	 				console.log(data.matchinfo);
	 				var team1win="<a href='javascript:yesorno("+key+","+data.matchinfo[key].MNUM+","+value.TNUM1+")'>"+data.matchinfo[key].B1NAME+"</a>";
	 				var team2win="<a href='javascript:yesorno2("+key+","+data.matchinfo[key].MNUM+","+value.TNUM2+")'>"+data.matchinfo[key].B2NAME+"</a>";
	 				var aa=value.TNUM1;
	 				console.log(value.TNUM1);
	 				var str="<div id='"+key+"' class='mm' '><h3>"+(key+1)+"번째 경기<span></span></h3></div>";
	 				console.log(data.matchinfo[key].MWINLOSE+"아랄랄");
	 				console.log(data.matchinfo[key].TNUM1+"dddddddddddddddd");
	 				console.log(data.matchinfo[key].point+"포인트")
	 				
	 				if(((data.matchinfo[key].MWINLOSE==data.matchinfo[key].TNUM1) && (data.matchinfo[key].POINT==0))){
	 					str +="<div id='matchList3' '><a href='javascript:yesorno("+key+","+data.matchinfo[key].MNUM+","+value.TNUM1+","+data.matchinfo[key].MWINLOSE+","+key+3+")'>"+data.matchinfo[key].B1NAME+"</a>vs"+
	 					"<a href='javascript:yesorno2("+key+","+data.matchinfo[key].MNUM+","+value.TNUM2+","+data.matchinfo[key].MWINLOSE+","+key+4+")'>"+data.matchinfo[key].B2NAME+"</a><br>"+
	 					"<span id='span11'>"+data.matchinfo[key].B1NAME+"</span>팀이 승리한 경기입니다 클릭시 승리팀이 변경됩니다.</span><input type='button' id='"+key+3+"' onclick='pointgo("+data.matchinfo[key].MNUM+","+data.matchinfo[key].MWINLOSE+",event)' class='button' value='포인트지급'></div> ";
	 				}else if(((data.matchinfo[key].MWINLOSE==data.matchinfo[key].TNUM2) && (data.matchinfo[key].POINT==0)) ){
	 					str +="<div id='matchList3' '><a href='javascript:yesorno("+key+","+data.matchinfo[key].MNUM+","+value.TNUM1+","+data.matchinfo[key].MWINLOSE+","+key+3+")'>"+data.matchinfo[key].B1NAME+"</a>vs"+
	 					"<a href='javascript:yesorno2("+key+","+data.matchinfo[key].MNUM+","+value.TNUM2+","+data.matchinfo[key].MWINLOSE+","+key+4+")'>"+data.matchinfo[key].B2NAME+"</a><br>"+
	 					"<span id='span11'>"+data.matchinfo[key].B2NAME+"</span>팀이 승리한 경기입니다 클릭시 승리팀이 변경됩니다.</span><input type='button' id='"+key+4+"' onclick='pointgo("+data.matchinfo[key].MNUM+","+data.matchinfo[key].MWINLOSE+",event)' class='button' value='포인트지급'></div> ";
	 				}else if(data.matchinfo[key].POINT==1){
	 					str +="<div id='matchList3' '>"+data.matchinfo[key].B1NAME+"vs"+data.matchinfo[key].B2NAME+"<br>"+
	 					"<span id='span11'></span>포인트 지급이 완료 되었습니다..</span></div> ";
	 				
	 				}else{
	 					var team1win="<a href='javascript:yesorno("+key+","+data.matchinfo[key].MNUM+","+value.TNUM1+")'>"+data.matchinfo[key].B1NAME+"</a>";
		 				var team2win="<a href='javascript:yesorno2("+key+","+data.matchinfo[key].MNUM+","+value.TNUM2+")'>"+data.matchinfo[key].B2NAME+"</a>";
					
		 				str +="<div id='matchList3'>"+team1win+"vs"+team2win+"<br><span>클릭시 승리팀을 선택합니다.</span></div> ";
						
	 				}
		 				$(str).appendTo("#tb");
	 				
	 				
	 				
	 				
					if(data.matchinfo[key].MWINLOSE==data.matchinfo[key].TNUM1){
					
					}else{
					
					}
			}
					
				
				})
				}
			}
		})
	}
function pointgo(mnum,mwinlose,e){
	if(confirm("해당팀이 승리팀이 맞습니까?")){
		
		console.log(e.target);
		var aa=e.target.id;
	

	$('#'+aa).css({
		display: "none"
	})
	$.ajax({
		url:'/lol/batting/pointGo',
		data:{
			mnum:mnum
		},
		dataType: 'json',
		success:function(data){
		console.log(data);
	
		$.each(data.list,function(key,value){
			
			
			$.ajax({
				url:'/lol/batting/pointInsert',
				data:{
					score:data.list[key].MRATE,username:data.list[key].USERNAME,mNum:mnum
				}
			})
		})
		alert("포인트지금완료");
		}
	})
	}else{
		return;
	}
}
</script>

</html>