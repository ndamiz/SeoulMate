<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="main_wrap">
	<div class="content">
		<h2 class="main_title">
			당신과 가장 잘 맞는<br>
			쉐어하우스 & 메이트
		</h2>
		<a href="memberForm">회원가입</a>
		<a href="memberEdit">회원정보 수정</a>
		<a href="memberProEdit">성향 수정</a>
		<a href="memberExit">회원 탈퇴</a><br/>
		<a class="green" href="admin/memberManagement">회원 관리</a>
		<c:if test="${logId!=null}">
			<p class="d_title">${logId}님 환영합니다!</p>
		</c:if>
		
		<form class="main_search_form" method="get" action="">
			<div class="checks">
				<input type="radio" id="select_house" name="main_search" checked> 
				<label for="select_house">쉐어하우스</label>
				
				<input type="radio" id="select_mate" name="main_search"> 
				<label for="select_mate">하우스메이트</label>
			</div>
			<div class="search_box">
				<input class="search_text" type="text" placeholder="지역명or지하철역을 입력하세요.">
				<button type="submit" class="green"></button>
			</div>
		</form>
	</div>
	
	<!-- 프리미엄 추천 쉐어하우스 -->
	<section class="content recommend_list">
		<div class="list_head">
			<p class="m_title">김두별님과 잘 어울리는 집이예요!</p>
			<a href="">더보기</a>
		</div>
		<ul class="list_content">
			<c:forEach var="i" begin="0" end="2">
				<li>
					<div class="list_img">
						<p><span>매칭</span>90<b>%</b></p>
						<button class="btn_star"></button>
						<a href="">
							<img alt="" src="<%=request.getContextPath()%>/img/comm/sample_house01.png">
						</a>
					</div>
					<div class="list_title">
						<span class="address">서울시 마포구 서강동</span>
						<span class="pay">￦ 100 / 25</span>
					</div>
					<ol class="list_icon">
						<li><p>1</p></li>
						<li><p>2</p></li>
						<li><p>3</p></li>
					</ol>
				</li>
			</c:forEach>
		</ul>
	</section>
	
	<!-- 신규 쉐어하우스 -->
	<section class="content recommend_list">
		<div class="list_head">
			<p class="m_title">NEW 쉐어하우스</p>
			<a href="">더보기</a>
		</div>
		<ul class="list_content">
			<c:forEach var="i" begin="0" end="2">
				<li>
					<div class="list_img">
						<p><span>매칭</span>90<b>%</b></p>
						<button class="btn_star"></button>
						<a href="">
							<img alt="" src="<%=request.getContextPath()%>/img/comm/sample_house02.png">
						</a>
					</div>
					<div class="list_title">
						<span class="address">서울시 마포구 서강동</span>
						<span class="pay">￦ 100 / 25</span>
					</div>
					<ol class="list_icon">
						<li><p>1</p></li>
						<li><p>2</p></li>
						<li><p>3</p></li>
					</ol>
				</li>
			</c:forEach>
		</ul>
	</section>
	
	<!-- 프리미엄 추천 하우스메이트 -->
	<section class="content recommend_list mate_list">
		<div class="list_head">
			<p class="m_title">김두별님과 잘 어울리는 메이트예요!</p>
			<a href="">더보기</a>
		</div>
		<ul class="list_content">
			<c:forEach var="i" begin="0" end="2">
				<li>
					<div class="list_img">
						<p><span>매칭</span>90<b>%</b></p>
						<button class="btn_star"></button>
						<a href="">
							<img alt="" src="<%=request.getContextPath()%>/img/comm/sample_mate01.png">
						</a>
					</div>
					<div class="list_title">
						<span class="mate_id">USER1</span>
						<span class="pay">￦ 100 / 25</span>
						<span class="address">서강동 | 합정동 | 당산동</span>
					</div>
					<ol class="list_icon">
						<li><p>여</p></li>
						<li><p>27세</p></li>
						<li><p>즉시</p></li>
					</ol>
				</li>
			</c:forEach>
		</ul>
	</section>
	
	<!-- 신규 하우스메이트 -->
	<section class="content recommend_list mate_list">
		<div class="list_head">
			<p class="m_title">NEW 하우스메이트</p>
			<a href="">더보기</a>
		</div>
		<ul class="list_content">
			<c:forEach var="i" begin="0" end="2">
				<li>
					<div class="list_img">
						<p><span>매칭</span>90<b>%</b></p>
						<button class="btn_star"></button>
						<a href="">
							<img alt="" src="<%=request.getContextPath()%>/img/comm/sample_mate02.png">
						</a>
					</div>
					<div class="list_title">
						<span class="mate_id">USER1</span>
						<span class="pay">￦ 100 / 25</span>
						<span class="address">서강동 | 합정동 | 당산동</span>
					</div>
					<ol class="list_icon">
						<li><p>여</p></li>
						<li><p>27세</p></li>
						<li><p>즉시</p></li>
					</ol>
				</li>
			</c:forEach>
		</ul>
	</section>
</div>