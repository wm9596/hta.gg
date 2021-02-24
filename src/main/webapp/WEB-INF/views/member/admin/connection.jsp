<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<h1 style="text-align: center; margin-top: 30px;">접속자 수 통계 목록</h1>
<div style="margin: 70px;">
	<h3 style="display: inline;">오늘 접속자 수 : ${todayCnt }</h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<h3 style="display: inline;">총 접속자 수 : ${totalCnt }</h3>
<!-- 	<table style="width: 1000px;" class="table table-hover"> -->
<!-- 		<thead> -->
<!-- 			<tr> -->
<!-- 				<th scope="col">날짜</th> -->
<!-- 				<th scope="col">접속자 수</th> -->
<!-- 			</tr> -->
<!-- 		</thead> -->
<!-- 		<tbody> -->
<%-- 		<c:forEach var="vo" items="${list }"> --%>
<!-- 			<tr> -->
<%-- 				<th scope="row"><fmt:formatDate value="${vo.regdate }" pattern="20YY년 MM월 dd일" /></th> --%>
<%-- 				<td>${vo.cnt}</td> --%>
<!-- 			</tr> -->
<%-- 		</c:forEach> --%>
<!-- 		</tbody> -->
<!-- 	</table> -->
<!-- 	<div> -->
<%-- 		<c:if test="${pu.startPageNum>5 }"> --%>
<%-- 		<a href="/lol/member/admin/connection?pageNum=${pu.pageNum-1}">[이전]</a> --%>
<%-- 		</c:if> --%>
<%-- 		<c:forEach var="i" begin="${pu.startPageNum}" end="${pu.endPageNum }"> --%>
<%-- 			<c:choose> --%>
<%-- 				<c:when test="${i==pu.pageNum }"> --%>
<%-- 					<a href="/lol/member/admin/connection?pageNum=${i}"><span style='color:blue'>[${i }]</span></a> --%>
<%-- 				</c:when> --%>
<%-- 				<c:otherwise> --%>
<%-- 					<a href="/lol/member/admin/connection?pageNum=${i}"><span style='color:gray'>[${i }]</span></a> --%>
<%-- 				</c:otherwise> --%>
<%-- 			</c:choose> --%>
<%-- 		</c:forEach> --%>
<%-- 		<c:if test="${pu.endPageNum<pu.totalPageCount }"> --%>
<%-- 			<a href="/lol/member/admin/connection?pageNum=${pu.pageNum+1}">[다음]</a> --%>
<%-- 		</c:if> --%>
<!-- 	</div> -->

	<div id="curve_chart" style="width: 900px; height: 500px"></div>
	
</div>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);
	
	function drawChart() {
	  
	  var data[i][j];
		  
		  
		['Day', 'cnt'],
	    ['2004', 10     ],
	    ['2005', 20     ],
	    ['2006', 30     ],
	    ['2007', 40     ]
	  ];
	  
	  google.visualization.arrayToDataTable(data);
	
	  var options = {
	    title: 'Company Performance',
	    curveType: 'function',
	    legend: { position: 'bottom' }
	  };
	
	  var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
	
	  chart.draw(data, options);
	}
</script>