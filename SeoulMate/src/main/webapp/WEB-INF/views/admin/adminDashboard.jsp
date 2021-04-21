<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/yun.css">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
	
	// Load Charts and the corechart package.
	google.charts.load('current', {'packages':['corechart']});
	
	// Draw the pie chart for Sarah's pizza when Charts is loaded.
	google.charts.setOnLoadCallback(drawSarahChart);
	
	// Draw the pie chart for the Anthony's pizza when Charts is loaded.
	google.charts.setOnLoadCallback(drawAnthonyChart);
	
	// Callback that draws the pie chart for Sarah's pizza.
	function drawSarahChart() {
	
	  // Create the data table for Sarah's pizza.
	  var data = new google.visualization.DataTable();
	  data.addColumn('string', 'Topping');
	  data.addColumn('number', 'Slices');
	  data.addRows([
	    ['Mushrooms', 1],
	    ['Onions', 1],
	    ['Olives', 2],
	    ['Zucchini', 2],
	    ['Pepperoni', 1]
	  ]);
	
	  // Set options for Sarah's pie chart.
	  var options = {title:'How Much Pizza Sarah Ate Last Night',
	                 width:400,
	                 height:300};
	
	  // Instantiate and draw the chart for Sarah's pizza.
	  var chart = new google.visualization.PieChart(document.getElementById('Sarah_chart_div'));
	  chart.draw(data, options);
	}
	
	// Callback that draws the pie chart for Anthony's pizza.
	function drawAnthonyChart() {
	
	  // Create the data table for Anthony's pizza.
	  var data = new google.visualization.DataTable();
	  data.addColumn('string', 'Topping');
	  data.addColumn('number', 'Slices');
	  data.addRows([
	    ['Mushrooms', 2],
	    ['Onions', 2],
	    ['Olives', 2],
	    ['Zucchini', 0],
	    ['Pepperoni', 3]
	  ]);
	
	  // Set options for Anthony's pie chart.
	  var options = {title:'How Much Pizza Anthony Ate Last Night',
	                 width:400,
	                 height:300};
	
	  // Instantiate and draw the chart for Anthony's pizza.
	  var chart = new google.visualization.PieChart(document.getElementById('Anthony_chart_div'));
	  chart.draw(data, options);
	}
</script>
<div id="dashMainDiv">
		<p>Today</p>
		<div id="dashUl">
			<ul>
				<li><p>하우스 신고</p>
				<span><img alt="하우스신고" src="<%=request.getContextPath()%>/img/yun/dashboard/fi-rr-home.svg"></span>
				<span>2건</span>
				</li>
				<li><p>메이트 신고</p>
				<span><img alt="메이트신고" src="<%=request.getContextPath()%>/img/yun/dashboard/fi-rr-user.svg"></span>
				<span>2건</span>
				</li>
				<li><p>커뮤니티 신고</p>
				<span><img alt="커뮤니티신고" src="<%=request.getContextPath()%>/img/yun/dashboard/fi-rr-screen.svg"></span>
				<span>2건</span>
				</li>			
			</ul>
			<ul>
				<li><p>문의</p>
				<span><img alt="문의" src="<%=request.getContextPath()%>/img/yun/dashboard/fi-rr-interrogation.svg"></span>
				<span>2건</span>
				</li>
			</ul>
			<ul>
				<li><p>프리미엄 가입</p>
				<span><img alt="프리미엄가입" src="<%=request.getContextPath()%>/img/yun/dashboard/fi-rr-shopping-cart-check.svg"></span>
				<span>2건</span>
				</li>
				<li><p>매출</p>
				<span><img alt="매출" src="<%=request.getContextPath()%>/img/yun/dashboard/fi-rr-dollar.svg"></span>
				<span>20,000원</span>
				</li>
			</ul>
		</div>
			
		<div style="margin-top:50px;">
			<table>
				<tr class="columns">
					<td><div id="Sarah_chart_div" style="border: 1px solid #eee"></div></td>
        			<td><div id="Anthony_chart_div" style="border: 1px solid #eee"></div></td>
				</tr>
			</table>
		</div>
</div>
