<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="main_wrap">
	<div class="content">
		<h2 class="main_title">
			당신과 가장 잘 맞는<br>
			쉐어하우스 & 메이트
		</h2>
		
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
	
	<section class="content recommend_list">
		<div class="list_head">
			<p class="m_title">김두별님과 잘 어울리는 집이예요!</p>
			<a href="">더보기</a>
		</div>
		<ul class="list_content">
			<li>
				<div class="list_img">
					<p><span>매칭</span>90<b>%</b></p>
					<button class="btn_star"></button>
					<a href="">
						<img alt="" src="<%=request.getContextPath()%>/img/comm/sample_house01.png">
					</a>
				</div>
				<div>
					<span class="address">서울시 마포구 서강동</span>
					<span class="">￦ 100 / 25</span>
				</div>
				<ol>
					<li><p>1</p></li>
					<li><p>2</p></li>
					<li><p>3</p></li>
				</ol>
			</li>
		</ul>
	</section>
</div>