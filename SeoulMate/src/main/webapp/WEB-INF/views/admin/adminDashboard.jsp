<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/yun.css">
<div id="dashMainDiv">
		<p class="d_title">Today</p>
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
			<img alt="지역별그래프" src="<%=request.getContextPath()%>/img/yun/dashboard/dashboard1.png" style="width: 400px;">
			<img alt="지역별그래프" src="<%=request.getContextPath()%>/img/yun/dashboard/dashboard2.png" style="width: 400px;">
		</div>
</div>
