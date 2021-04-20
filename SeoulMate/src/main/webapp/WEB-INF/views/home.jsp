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
	
	<!-- 지도 -->
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6bad1d8e9a1449ac5fb2b238e99a32ed"></script>
	<section class="content map_content">
		<div class="list_head">
			<p class="m_title">나의 지역 둘러보기</p>
		</div>
		<div class="main_map" id="map"></div>
	</section>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.54699, 127.09598), // 지도의 중심좌표
			draggable: false,
			level : 4
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		var imageSrc = '<%=request.getContextPath()%>/img/comm/map_marker.png', // 마커이미지의 주소입니다    
		imageSize = new kakao.maps.Size(40, 56), // 마커이미지의 크기입니다
		imageOption = {
			offset : new kakao.maps.Point(27, 69)
		}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

		// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
				imageOption), markerPosition = new kakao.maps.LatLng(37.54699,
				127.09598); // 마커가 표시될 위치입니다

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			position : markerPosition,
			image : markerImage
		// 마커이미지 설정 
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
	</script>
</div>