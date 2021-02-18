<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript" src="/lol/resources/js/jquery-3.5.1.js"></script>
</head>
<body>
<script type="text/javascript">

$(function(){
	var list=${championid}
	console.log(list)
	$.ajax({
		url:"/lol/champ/selectList1",
		data:{
			championid:list
			},
		dataType: 'json',
		success: function(data){
		
			let a=JSON.parse(data.skillE_info);
		
		console.log(a.tooltip.replace(/\{|\}|duration/gi,''));
			$("#test").html(data.skillW_info);
		}
	})
})
</script>
<div id="test"> </div>
</body>
</html>