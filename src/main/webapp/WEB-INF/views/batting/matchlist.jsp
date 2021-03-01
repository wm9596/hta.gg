<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="now" class="java.util.Date"/>
   <%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<style type="text/css">
#matchList{
   position: absolute;
    left: 830px;
    top: 150px;
}
.btn-primary {
    color: #fff;
    background-color: black;
    border-color: black;
}
}
.winloseBTN{
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;

  font-size: 16px;
  margin-left: 40%;
}
#b1btn{
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;

  font-size: 16px;

}
#b2btn{
  background-color: black; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;

  font-size: 16px;

}
.winloseBTN{
  background-color: black; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;

  font-size: 16px;
}

</style>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript" src="/lol/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/scrap.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
<div id="nextday">
</div>
<script type="text/javascript">
$(function(){
	   $('.ui-datepicker ').css({ "margin-left" : "1000px", "margin-top": "-223px"});  
	 
		var today1=new Date();
		var year1 = today1.getFullYear(); // 년도
    	var month1 = ("0"+(today1.getMonth()+1));  // 월
    	var date1 = ("0"+(today1.getDate())).slice(-2);  // 날짜
  		var htmlday=year1+"/"+month1+"/"+date1;
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
		        	  $("#matchList").empty();
		        	 
		     
		        	var matchday=d.split("/");
		        console.log(matchday);
		        let matchdayin=matchday[0]+"/"+matchday[1]+"/"+matchday[2];
		        	console.log(d);
		        	let today=new Date();
		        	let year = today.getFullYear(); // 년도
		        	let month = ("0"+(today.getMonth()+1));  // 월
		        	var date = ("0"+(today.getDate())).slice(-2);  // 날짜
		        	console.log(today);
		        	console.log(htmlday);
		        	$("#ss").html(d);
					
		        	$.ajax({
		        		url:'/lol/match/yesdaylist',
		        		dataType: 'json',
		        		data:{
		        			mDate:matchdayin
		        		},
		        		success:function(data){
		        			console.log(data.matchinfo.length);
		        			if(data.matchinfo.length>0){
		         		$.each(data.matchinfo,function(key,value){
		         			console.log(data.matchinfo[key]);
		         			var targer=JSON.stringify(data.matchinfo[key]);
		         			console.log(targer);
		         			console.log(JSON.parse(targer));
		         			
		         				var str="<div id='"+(key+1)+"'><h3 style='color:black;'> "+(key+1)+"번째 경기</h3>"+
		        				"<div id='vs'>"+data.matchinfo[key].B1NAME+"vs"+data.matchinfo[key].B2NAME+"</div> </div>";
		        				
		        				if(data.matchinfo[key].MWINLOSE==data.matchinfo[key].TNUM1){
		        					str+="<span style='color:#CD0000'><h3 style='display:inline' >"+data.matchinfo[key].B1NAME+"</h3>팀 승리</span><span style='color:#00008C '><h3 style='display:inline'>"+data.matchinfo[key].MRATE+"</h3>포인트 지급</span><br><br><br>";
		        				}else if(data.matchinfo[key].MWINLOSE==data.matchinfo[key].TNUM2) {
		        					str+="<span style='color:#CD0000'><h3 style='display:inline' >"+data.matchinfo[key].B2NAME+"</h3>팀 승리</span><span style='color:#00008C'><h3 style='display:inline' >"+data.matchinfo[key].MRATE+"</h3>포인트 지급</span><br><br><br>";
		        				}else{
		        					str+="<div id='winlose"+(key+1)+"'><span style='color:blue' id='vs1'>경기 결과가 없습니다.</span><input type='button' value='승리팀예상하기'"+
		        					"onclick='selectTeam("+targer+","+(key+1)+")' class='winloseBTN'></div>";
		        					let Username="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}";
		        					$.ajax({
		        						url:'/lol/battinglog/choice',
		        						dataType:'json',
		        						data:{
		        							mNum:data.matchinfo[key].MNUM,username:Username
		        						},success:function(data){
		        							console.log(data);
		        							if(data.battingchoice.length>0){
		        							console.log(	$("#winlose :button").val("승리팀수정하기"));
		        							}
		        							else{
			        							
		        								
		        							}
		        						}
		        					})
		        				}
		        				$("#matchList").append(str);
		        				
		         		})
		        		}else{
		        			$("#matchList").append("<div><h3>등록된 경기가 없습니다</h3></div>")
		        		}  
		         			
		        			
		        		
		        		}
		        	})
		        	

		        }
		})
		

	
	
	

	
/* $("#yester").click(function(){
	$("#matchList").empty();
	
	let day1=	$("#ss").html();
	
	let today1=htmlday.split("/");
	
	let today=new Date(today1[0],today1[1],parseInt(today1[2]-1));
	let year = today.getFullYear(); // 년도
	let month = ("0"+(today.getMonth()));  // 월
	let date = ("0"+(today.getDate())).slice(-2);  // 날짜
	console.log(month)
	$("#ss").html(year+"/"+month+"/"+date);
	let str=year+"/"+month+"/"+date;
	console.log(str);
	$.ajax({
		url:'/lol/match/yesdaylist',
		dataType: 'json',
		data:{
			mDate:str
		},
		success:function(data){
			console.log(data.matchinfo.length);
			if(data.matchinfo.length>0){
 		$.each(data.matchinfo,function(key,value){
 			console.log(data.matchinfo[key]);
 			var targer=JSON.stringify(data.matchinfo[key]);
 			console.log(targer);
 			console.log(JSON.parse(targer));
 			
 				var str="<div id='matchList2'>"+(key+1)+"번째 경기"+
				"<div id='vs'>"+data.matchinfo[key].B1NAME+"vs"+data.matchinfo[key].B2NAME+"</div> </div>";
				
				if(data.matchinfo[key].MWINLOSE==data.matchinfo[key].TNUM1){
					str+="<span style='color:blue'>"+data.matchinfo[key].B2NAME+"승리</span><span style='color:red'>"+data.matchinfo[key].MRATE+"포인트 지급</span>";
				}else if(data.matchinfo[key].MWINLOSE==data.matchinfo[key].TNUM2) {
					str+="<span style='color:blue'>"+data.matchinfo[key].B2NAME+"승리</span><span style='color:red'>"+data.matchinfo[key].MRATE+"포인트 지급</span>";
				}else{
					str+="<div id='winlose'><span style='color:blue' id='vs1'>경기 결과가 없습니다.</span><input type='button' value='승리팀예상하기'"+
					"onclick='selectTeam("+targer+")' class='winloseBTN'></div>";
				
				}
				$("#matchList").append(str);
 		})
		}else{
			$("#matchList").append("<div>등록된 경기가 없습니다</div>")
		}  
 			
			
		
		}
	})
})
$("#tomm").click(function(){
	$("#matchList").empty();
	let day2=	$("#ss").html();
	let today1=day2.split("/");
	let today=new Date(today1[0],today1[1],parseInt(today1[2])+1);
	let year = today.getFullYear(); // 년도
	let month = ("0"+(today.getMonth()));  // 월
	let date = ("0"+(today.getDate())).slice(-2);  // 날짜
	$("#ss").html(year+"/"+month+"/"+date);
	let str=year+"/"+month+"/"+date;
	console.log(str);
	$.ajax({
		url:'/lol/match/yesdaylist',
		dataType: 'json',
		data:{
			mDate:str
		},
		success:function(data){
			console.log(data.matchinfo.length);
			if(data.matchinfo.length>0){
 		$.each(data.matchinfo,function(key,value){
 			console.log(data.matchinfo[key]);
 			var targer=JSON.stringify(data.matchinfo[key]);
 			console.log(targer);
 			console.log(JSON.parse(targer));
 			
 				var str="<div id='matchList2'>"+(key+1)+"번째 경기"+
				"<div id='vs'>"+data.matchinfo[key].B1NAME+"vs"+data.matchinfo[key].B2NAME+"</div> </div>";
				
				if(data.matchinfo[key].MWINLOSE==data.matchinfo[key].TNUM1){
					str+="<span style='color:blue'>"+data.matchinfo[key].B2NAME+"승리</span><span style='color:red'>"+data.matchinfo[key].MRATE+"포인트 지급</span>";
				}else if(data.matchinfo[key].MWINLOSE==data.matchinfo[key].TNUM2) {
					str+="<span style='color:blue'>"+data.matchinfo[key].B2NAME+"승리</span><span style='color:red'>"+data.matchinfo[key].MRATE+"포인트 지급</span>";
				}else{
					str+="<div id='winlose'><span style='color:blue' id='vs1'>경기 결과가 없습니다.</span><input type='button' value='승리팀예상하기'"+
					"onclick='selectTeam("+targer+")' class='winloseBTN'></div>";
				
				}
				$("#matchList").append(str);
 		})
		}else{
			$("#matchList").append("<div>등록된 경기가 없습니다</div>")
		}  
 			
			
		
		}
	})

}) */
		
$.ajax({
	url:'/lol/match/teamrank',
	dataType: 'json',
	success:function(data){
		console.log(data);
		if(data){
		$.each(data.teamrank,function(key,value){
			$(".table").append("<tr><td><button type='button' class='btn btn-danger'>"+value.RANK+"</button></td><td>"
					+"<button type='button' class='btn btn-success'>"+(value.WINCOUNT*3)+"</button></td><td><button type='button' class='btn btn-info'>"+value.TNAME+"</button></td></tr>")
		})
		}else{
			$(".table").append("<tr><td>경기가 없습니다.</td></tr>")
		}
	}
	
})
})
function getday(){
	   var date = new Date();
	    var year = date.getFullYear();
	    var month = ("0" + (1 + date.getMonth())).slice(-2);
	    var day = ("0" + date.getDate()).slice(-2);

	    return year + month + day;
}
function selectTeam(data,key) {
	console.log(data);
	console.log("dddddddddddddd123");	
	$(".winloseBTN").css({
		display: "none"
	})
	var data1=JSON.stringify(data);
	console.log(data1)
	$("#winlose"+key).append("<br><input type='button' value='"+data.B1NAME+"' id='b1btn' onclick='b1win("+data1+")'>"+
			"<input type='button' value='"+data.B2NAME+"' id='b2btn'  onclick='b2win("+data1+")'>");
}
function b1win(data){
	if(confirm("정말 선택하시겠습니까?")){
	$("#b1btn").prop("disabled",true);
	$("#b1btn").css('backgroundColor', 'gray');
	$("#b2btn").prop("disabled",false);
	$("#b2btn").css('backgroundColor', 'black');
	console.log(data);
	console.log(data.B1NAME)
	let Username="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}";
	console.log(Username);
	var t1=data.B1NAME;
	$.ajax({
		url:'/lol/selectTeam',
		dataType: 'json',
		data:{
			mNum:data.MNUM,choice:data.TNUM1,username:Username
		},
		success:function(data){
			alert("배팅완료");
			$("#matchList").append(t1+"팀을 선택하셨습니다")
		}
	})
	}else{
		return;
	}
}
function b2win(data){
	if(confirm("정말 선택하시겠습니까?")){
	$("#b2btn").prop("disabled",true);
	$("#b2btn").css('backgroundColor', 'gray');
	$("#b1btn").prop("disabled",false);
	$("#b1btn").css('backgroundColor', '#4CAF50');

	console.log(data);
	var t2=data.B2NAME;
	let Username="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}";
	console.log(Username);
	
	$.ajax({
		url:'/lol/selectTeam',
		dataType: 'json',
		data:{
			mNum:data.MNUM,choice:data.TNUM2,username:Username
		},
		success:function(data){
			alert("배팅완료");
			$("#matchList").append(t2+"팀을 선택하셨습니다")
		}
	})
	}else{
		return;
	}
}
</script>
<div id="allList" style="height: 800px; padding-left: 200px; ">
<div id="d1" >
</div>
<div id="matchList">
<span id="ss"></span></div>
<div style="width: 270px;height:450px; ">
<table class="table">
 <tr><td><button type="button" class="btn btn-primary">순위</button></td><td><button type="button" class="btn btn-primary">승점</button></td><td><button type="button" class="btn btn-primary">팀이름</button></td></tr>
</table>
</div> 
</div>

</body>
</html>