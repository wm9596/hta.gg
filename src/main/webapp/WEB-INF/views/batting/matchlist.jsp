<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="now" class="java.util.Date"/>
   <%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<style type="text/css">
#d1{
height:500px;
padding-left: 550px;
}
</style>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript" src="/lol/resources/js/jquery-3.5.1.js"></script>
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
		         			
		         				var str="<div id='matchList2'>"+(key+1)+"번째 경기"+
		        				"<div id='vs'>"+data.matchinfo[key].B1NAME+"vs"+data.matchinfo[key].B2NAME+"</div> </div>";
		        				
		        				if(data.matchinfo[key].MWINLOSE==data.matchinfo[key].TNUM1){
		        					str+="<span style='color:blue'>"+data.matchinfo[key].B2NAME+"팀 승리</span><span style='color:red'>"+data.matchinfo[key].MRATE+"포인트 지급</span>";
		        				}else if(data.matchinfo[key].MWINLOSE==data.matchinfo[key].TNUM2) {
		        					str+="<span style='color:blue'>"+data.matchinfo[key].B2NAME+"팀 승리</span><span style='color:red'>"+data.matchinfo[key].MRATE+"포인트 지급</span>";
		        				}else{
		        					str+="<div id='winlose'><span style='color:blue' id='vs1'>경기 결과가 없습니다.</span><input type='button' value='승리팀예상하기'"+
		        					"onclick='selectTeam("+targer+")' class='winloseBTN'></div>";
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
		        							$("#winlose").append("<div id='pick' >이미 배팅하셨네요</div>")}
		        							else{
		        							
		        								$("#winlose").append("<div id='pick'> 배팅을 안하셨어요</div>")
		        							}
		        						}
		        					})
		        				}
		        				$("#matchList").append(str);
		         		})
		        		}else{
		        			$("#matchList").append("<div>등록된 경기가 없습니다</div>")
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
		

})
function getday(){
	   var date = new Date();
	    var year = date.getFullYear();
	    var month = ("0" + (1 + date.getMonth())).slice(-2);
	    var day = ("0" + date.getDate()).slice(-2);

	    return year + month + day;
}
function selectTeam(data) {
	console.log(data);
	console.log("dddddddddddddd123");	
	$(".winloseBTN").css({
		display: "none"
	})
	var data1=JSON.stringify(data);
	console.log(data1)
	$("#winlose").append("<br><input type='button' value='"+data.B1NAME+"' onclick='b1win("+data1+")'>"+
			"<input type='button' value='"+data.B2NAME+"' onclick='b2win("+data1+")'>");
}
function b1win(data){
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
			console.log($("#pick").html(t1+"팀을 선택하셨습니다"))
		}
	})
}
function b2win(data){
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
			console.log($("#pick").html(t2+"팀을 선택하셨습니다"))
		}
	})
}
</script>
<div id="allList" style="width: 100%">
<div id="d1">

<span id="ss"></span>
<div id="matchList"></div>
</div>

</div>
</body>
</html>