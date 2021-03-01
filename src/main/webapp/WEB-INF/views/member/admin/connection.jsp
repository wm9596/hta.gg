<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<h3 style="text-align: center; margin-top: 30px;">접속자 수 통계 목록</h3>
<div style="margin: 70px;">
	<h5 style="display: inline;">오늘 접속자 수 : ${todayCnt }</h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<h5 style="display: inline;">총 접속자 수 : ${totalCnt }</h5>
	<div id="curve_chart" style="width: 900px; height: 700px;"></div>
</div>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);
	
	function drawChart() {
		$.ajax({
			url: "/lol/member/admin/connectionList",
			dataType: "json",
			success: function(data){
// 				console.log(data);
// 				console.log(new Date(data[0].regdate))
				function create2DArray(rows, columns) {
				    var arr = new Array(rows);
				    for (var i = 0; i < rows; i++) {
				        arr[i] = new Array(columns);
				    }
				    return arr;
				}
				var visit = create2DArray(data.length+1, 2);
				
				visit[0][0]='Day';	visit[0][1]='cnt';
				console.log(data.length);
				for(var i=0;i<data.length;i++){
					visit[i+1][0] = new Date(data[i].regdate);
					visit[i+1][1] =data[i].cnt;
					
				}
				visit = google.visualization.arrayToDataTable(visit);
				
				var options = {
					    title: 'Company Performance',
					    curveType: 'function',
					    legend: { position: 'bottom' },
					    width: 1000,
						height: 700    
				};
				
				var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
			
				chart.draw(visit, options);
			}
		});
	}
</script>