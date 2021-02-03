<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.container {
  background-color: gray;
  background: rgba(0,0,0,0.4); 
  position: absolute;
  width: 100%;
  min-height: 100%;
  left: 0;
  top: 0;
  text-align:center;
}
.content {
  border: 3px solid black;
  border-radius: 25px;
  background-color: #ffffff; 
  position:absolute;
  top:70%;
  left:50%;
  width: 60%;
  height: 450px;
  transform:translate(-50%, -50%)
}


</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/lol/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(function() {
		$
				.ajax({
					contentType : 'application/json',
					url : "/lol/itemlist",
					type : 'get',
					dataType : 'json',

					success : function(data) {
						console.log(data.effect);
						console.log(data)
						$
								.each(
										data,
										function(key, value) {

											console.log(value.icon);
											var str2 = "<img src=http://ddragon.leagueoflegends.com/cdn/11.2.1/img/item/"+value.icon+" style='width:64px; height:64px;'"+ 
											"onmouseover='iteminfoinfo("+value.inum+")' onmouseout='iteminfo2()'>";
											$(str2).appendTo("#dd").addClass("iteminfo");
											
										})
										
					}
				})

	});
	function iteminfoinfo(inum){
		$.ajax({
			contentType : 'application/json',
			url : "/lol/iteminfo?inum="+inum,
			dataType: 'json',
			success:function(data){
				console.log(data.name+"<br>"+data.effect);
				var nameeffect="<div><h2>"+data.name+"</h2><br>"+data.effect+"</div>";
				$("#iteminfo").empty();
				$(nameeffect).appendTo("#iteminfo").addClass("content");
			}
		})
	}
	function iteminfo2(){
		$("#iteminfo").empty();
	}
</script>
</head>
<body>
	<div id="dd"></div>
	<div id="iteminfo" ></div>
</body>
</html>