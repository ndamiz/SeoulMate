<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/yun.css">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.1.1/dist/chart.min.js"></script>

<div class="dashMainDiv">
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
			
<!-- 		<div style="margin-top:50px;"> -->
<!-- 			<table> -->
<!-- 				<tr class="columns"> -->
<!-- 					<td><div id="Sarah_chart_div"></div></td> -->
<!--         			<td><div id="Anthony_chart_div" style="border: 1px solid #eee"></div></td> -->
<!-- 				</tr> -->
<!-- 			</table> -->
<!-- 		</div> -->
		<div style="margin-top:50px;">
			<table>
				<tr style="width:100%">
					<td id="chartTd"><canvas id="myChart" width="300" height="300"></canvas></td>
        			<td><canvas id="pieChart" width="300" height="300"></canvas></td>
				</tr>
			</table>
		</div>
			
		<script>
		var ctx = document.getElementById('myChart').getContext('2d');
		var myChart = new Chart(ctx, {
		    type: 'bar',
		    data: {
		        labels: ['강남구', '마포구', '양천구', '영등포구', '서대문구'],
		        datasets: [{
		            label: '지역별 하우스 분포 TOP5',
		            data: [12, 19, 3, 5, 2, 3],
		            backgroundColor: [
		                'rgba(54, 162, 235, 0.2)',
		                'rgba(255, 99, 132, 0.2)',
		                'rgba(255, 206, 86, 0.2)',
		                'rgba(75, 192, 192, 0.2)',
		                'rgba(153, 102, 255, 0.2)',
		            ],
		            borderColor: [
		                'rgba(54, 162, 235, 1)',
		                'rgba(255, 99, 132, 1)',
		                'rgba(255, 206, 86, 1)',
		                'rgba(75, 192, 192, 1)',
		                'rgba(153, 102, 255, 1)',
		            ],
		            borderWidth: 1
		        }]
		    },
		    options: {
		        scales: {
		            y: {
		                beginAtZero: true
		            }
		        }
		    }
		});
		///////////////////
		//파이차트//////////////////////////////////////////////////////////
		//////////////////
		
		const data = {
			  labels: [
			    '일반',
			    '프리미엄',
			  ],
			  datasets: [{
			    label: '회원 비율',
			    data: [300, 100],
			    backgroundColor: [
			      'rgb(255, 99, 132)',
			      'rgb(54, 162, 235)',
		   	 ],
		    hoverOffset: 4
		  }]
		};
		const config = {
			  type: 'doughnut',
			  data: data,
		};
		var myChart2 = new Chart(
			document.getElementById('pieChart'),
		    config
		);
		</script>
</div>
</body>
</html>