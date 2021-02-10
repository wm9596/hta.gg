<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="now" class="java.util.Date"/>
   <%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/lol/resources/js/jquery-3.5.1.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
<div id="nextday">
</div>
<script type="text/javascript">
$(function(){
	let today=new Date();
	let year = today.getFullYear(); // 년도
	let month = ("0"+(today.getMonth()+1));  // 월
	var date = ("0"+(today.getDate())).slice(-2);  // 날짜
	console.log(today);
	$("#ss").html(year+"/"+month+"/"+date);
	console.log(year);
	let str=year+"/"+month+"/"+date;
	$.ajax({
		url:'/lol/match/yesdaylist',
		dataType: 'json',
		data:{
			mDate:str
		},
		success:function(data){
			console.log(data.matchinfo.length);
 		$.each(data.matchinfo,function(key,value){
 		 	if(data.matchinfo.length>0){
				$("#matchList").append("<div id='matchList2'>"+(key+1)+"번째 경기</div>"+
				"<div>"+data.matchinfo[key].B1NAME+"vs"+data.matchinfo[key].B2NAME+"</div> ");
				if(data.matchinfo[key].MWINLOSE==data.matchinfo[key].TNUM1){
					$("#matchList").append("<span style='color:blue'>"+data.matchinfo[key].B1NAME+"승리</span>");
					$("#matchList").append("<span style='color:red'>"+data.matchinfo[key].MRATE+"포인트 지급</span>");
				}else{
					$("#matchList").append("<span style='color:blue'>"+data.matchinfo[key].B2NAME+"승리</span>");
					$("#matchList").append("<span style='color:red'>"+data.matchinfo[key].MRATE+"포인트 지급</span>");
				}
		}else if(data.matchinfo.length=='0'){
			$("#matchList").append("<span style='color:blue'>"+data.matchinfo[key].B1NAME+"승리</span>");

		}  
				
			
			})
		}
	})
	
$("#yester").click(function(){
	$("#matchList").empty();
	let day1=	$("#ss").html();
	let today1=day1.split("/");
	
	let today=new Date(today1[0],today1[1],parseInt(today1[2]-1));
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
 		$.each(data.matchinfo,function(key,value){
 			
 			if(data.matchinfo.length>0){
				$("#matchList").append("<div id='matchList2'>"+(key+1)+"번째 경기</div>"+
				"<div>"+data.matchinfo[key].B1NAME+"vs"+data.matchinfo[key].B2NAME+"</div> ");
				if(data.matchinfo[key].MWINLOSE==data.matchinfo[key].TNUM1){
					$("#matchList").append("<span style='color:blue'>"+data.matchinfo[key].B1NAME+"승리</span>");
					$("#matchList").append("<span style='color:red'>"+data.matchinfo[key].MRATE+"포인트 지급</span>");
				}else{
					$("#matchList").append("<span style='color:blue'>"+data.matchinfo[key].B2NAME+"승리</span>");
					$("#matchList").append("<span style='color:red'>"+data.matchinfo[key].MRATE+"포인트 지급</span>");
				}
		}else if(data.matchinfo.length=='0'){
			$("#matchList").append("<span style='color:blue'>"+data.matchinfo[key].B1NAME+"승리</span>");

		}  
				
			
			})
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
			console.log(data);
 		$.each(data.matchinfo,function(key,value){
 			
 			if(data.matchinfo.length>0){
				$("#matchList").append("<div id='matchList2'>"+(key+1)+"번째 경기</div>"+
				"<div>"+data.matchinfo[key].B1NAME+"vs"+data.matchinfo[key].B2NAME+"</div> ");
				if(data.matchinfo[key].MWINLOSE==data.matchinfo[key].TNUM1){
					$("#matchList").append("<span style='color:blue'>"+data.matchinfo[key].B1NAME+"승리</span>");
					$("#matchList").append("<span style='color:red'>"+data.matchinfo[key].MRATE+"포인트 지급</span>");
				}else{
					$("#matchList").append("<span style='color:blue'>"+data.matchinfo[key].B2NAME+"승리</span>");
					$("#matchList").append("<span style='color:red'>"+data.matchinfo[key].MRATE+"포인트 지급</span>");
				}
		}else if(data.matchinfo.length=='0'){
			$("#matchList").append("<span style='color:blue'>"+data.matchinfo[key].B1NAME+"승리</span>");

		}  
			
			})
		}
	})

})
})
function getday(){
	   var date = new Date();
	    var year = date.getFullYear();
	    var month = ("0" + (1 + date.getMonth())).slice(-2);
	    var day = ("0" + date.getDate()).slice(-2);

	    return year + month + day;
}
</script>
<input type="button" id="yester" value="<">
<span id="ss"></span>
<input type="button" id="tomm" value=">">
<div id="matchList"></div>
</body>
</html>