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
	<c:if test="${logId!=null}">
	<section class="content recommend_list">
		<div class="list_head">
			<p class="m_title">${logName}님과 잘 어울리는 집이예요!</p>
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
	</c:if>
	
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
	
	<c:if test="${logId!=null}">
	<!-- 프리미엄 추천 하우스메이트 -->
	<section class="content recommend_list mate_list">
		<div class="list_head">
			<p class="m_title">${logName}님과 잘 어울리는 메이트예요!</p>
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
	</c:if>
	
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
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6bad1d8e9a1449ac5fb2b238e99a32ed&libraries=clusterer,services"></script>
	 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<section class="content map_content">
		<div class="list_head">
			<p class="m_title">나의 지역 둘러보기</p>
		</div>
		<div class="main_map" id="map"></div>
	</section>
	<script>
	
		// =============== 지도생성  =============== //
		
  		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.54699, 127.09598), // 지도의 중심좌표
			//draggable: false,
			level : 4
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		// =============== 현재좌표 구하기 =============== //
		
		var lat, lon, locPosition;
		// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		if (navigator.geolocation) {
		    
		    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
		    navigator.geolocation.getCurrentPosition(function(position) {
	        
	        lat = position.coords.latitude, // 위도
	        lon = position.coords.longitude; // 경도
	        
	       	locPosition = new kakao.maps.LatLng(lat, lon); 
	        // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
	        
	       	displayMarker(locPosition);
	      });
		    
		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
		    
	        lat = 33.450701, // 위도
	        lon = 126.570667; // 경도 
		    locPosition = new kakao.maps.LatLng(33.450701, 126.570667);
	        displayMarker(locPosition);
		}
		
		// =============== 현재좌표 마커, 지도중심 찍기 =============== //
		
		// 지도에 마커와 인포윈도우를 표시하는 함수입니다
		function displayMarker(locPosition) {
			var imageSrc = '<%=request.getContextPath()%>/img/comm/map_marker.png', // 마커이미지의 주소입니다    
			imageSize = new kakao.maps.Size(29, 41), // 마커이미지의 크기입니다
			imageOption = {
				offset : new kakao.maps.Point(27, 69)
			}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

			// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
			imageOption), markerPosition = locPosition; // 마커가 표시될 위치입니다
			
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({  
		        map: map, 
		        image: markerImage,
		        position: markerPosition
		    }); 

		    // 지도 중심좌표를 접속위치로 변경합니다
		    marker.setMap(map);
		    map.setCenter(locPosition);      
		}    
		
		
		// =============== 쉐어하우스 마커 찍기 =============== //
		
		<c:forEach items="${lst}" var="item">
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch("${item}", function(result, status) {
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					
					var imageSrc = '<%=request.getContextPath()%>/img/comm/map_marker.png', // 마커이미지의 주소입니다    
					imageSize = new kakao.maps.Size(29, 41), // 마커이미지의 크기입니다
					imageOption = {
						offset : new kakao.maps.Point(27, 69)
					}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
		
					// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
					var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
					imageOption), markerPosition = coords; // 마커가 표시될 위치입니다
			        
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
				        image: markerImage,
			            position: coords
			        });
	
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        // map.setCenter(coords);
			    } 
			});    
		</c:forEach>
		
		
<%-- 		var imageSrc = '<%=request.getContextPath()%>/img/comm/map_marker.png', // 마커이미지의 주소입니다    
		imageSize = new kakao.maps.Size(40, 56), // 마커이미지의 크기입니다
		imageOption = {
			offset : new kakao.maps.Point(27, 69)
		}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

		// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
				imageOption), markerPosition = new kakao.maps.LatLng(lat,lon); // 마커가 표시될 위치입니다

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			position : markerPosition,
			image : markerImage
		// 마커이미지 설정 
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		map.setCenter(locPosition);       --%>
		
 		<%-- var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
	        center : new kakao.maps.LatLng(36.2683, 127.6358), // 지도의 중심좌표 
	        /* draggable: false, */
	        level : 10 // 지도의 확대 레벨 
	    });
	    
	    // 마커 클러스터러를 생성합니다 
	    var clusterer = new kakao.maps.MarkerClusterer({
	        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
	        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
	        minLevel: 3 // 클러스터 할 최소 지도 레벨 
	    });
		
		
	    // 데이터를 가져오기 위해 jQuery를 사용합니다
	    // 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
	    $.get("<%=request.getContextPath()%>/js/main/sample.json", function(data) {
	        // 데이터에서 좌표 값을 가지고 마커를 표시합니다
	        // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
	        var markers = $(data.positions).map(function(i, position) {
	            return new kakao.maps.Marker({
	                position : new kakao.maps.LatLng(position.lat, position.lng)
	            });
	        });

	        // 클러스터러에 마커들을 추가합니다
	        clusterer.addMarkers(markers);
	    });  --%>
	</script>
</div>