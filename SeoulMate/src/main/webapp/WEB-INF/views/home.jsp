<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var ="mateArrList" value="mateMapList"/>
<script>
   function exitCheck(){
      if(${pwdCheck=='일치'}){
         alert("그동안 서울 메이트를 이용해주셔서 감사합니다.");
      }
   }
   exitCheck();
   console.log(${logGrade});
</script>
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
   <c:if test="${logGrade==2}">
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
                     <img alt="" src="<%=request.getContextPath()%>/housePic/sample_house01.png">
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
         <a href="#">더보기</a>
      </div>
      <ul class="list_content">
         <c:forEach items="${newHouseList}" var="newHouseVO">
            <li>
               <div class="list_img">
                  <p><span>매칭</span>90<b>%</b></p>
                  <button class="btn_star"></button>
                  <a href="">
                     <img alt="" src="<%=request.getContextPath()%>/housePic/${newHouseVO.housepic1}">
                  </a>
               </div>
               <div class="list_title">
                  <span class="address">${newHouseVO.addr}</span>
                  <span class="pay">￦ ${newHouseVO.deposit} / ${newHouseVO.rent}</span>
               </div>
               <ol class="list_icon">
                  <li><p>${newHouseVO.room}</p></li>
                  <li><p>${newHouseVO.bathroom}</p></li>
                  <li><p>${newHouseVO.nowpeople}</p></li>
               </ol>
            </li>
         </c:forEach>
      </ul>
   </section>
   
   <c:if test="${logGrade==2}">
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
                     <img alt="" src="<%=request.getContextPath()%>/matePic/sample_mate01.png">
                  </a>
               </div>
               <div class="list_title">
                  <span class="mate_id">USER1</span>
                  <span class="pay">￦ 100 / 25</span>
               </div>
               <span class="address">서강동 | 합정동 | 당산동</span>
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
         <c:forEach items="${newMateList}" var="newMateVO">
            <li>
               <div class="list_img">
                  <p><span>매칭</span>90<b>%</b></p>
                  <button class="btn_star"></button>
                  <a href="">
                     <img alt="" src="<%=request.getContextPath()%>/matePic/${newMateVO.matePic1}">
                  </a>
               </div>
               <div class="list_title">
                  <span class="mate_id">${newMateVO.userid}</span>
                  <span class="pay">￦ ${newMateVO.deposit} / ${newMateVO.rent}</span>
               </div>
               <span class="address">
               	${newMateVO.area1} 
               	<c:if test="${newMateVO.area2 != null}">
                	| ${newMateVO.area2} 
               	</c:if>
               	<c:if test="${newMateVO.area3 != null}">
                	| ${newMateVO.area3}
               	</c:if>
               </span>
               <ol class="list_icon">
                  <li>
                  	<p>
                  		<c:if test="${newMateVO.gender==1}">여</c:if>
                  		<c:if test="${newMateVO.gender==3}">남</c:if>
                  	</p>
                  </li>
                  <li>
                  	<p>
                  		${newMateVO.birth}세
                  	</p>
                  </li>
                  <li>
                  	<p>
                  		${newMateVO.enterdate}
                  	</p>
                  </li>
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
      	 <c:if test="${logId==null && logArea==null}">
      	 	<p class="m_title">서울메이트 둘러보기</p>
      	 </c:if>
      	 
      	 <c:if test="${logId!=null && logArea!=null}">
      	 	<p class="m_title">나의 지역 둘러보기</p>
      	 </c:if>
      </div>
      <div class="main_map" id="map"></div>
   </section>
   <script>
      // =============== 지도생성  =============== //
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
      mapOption = {
         center : new kakao.maps.LatLng(37.5640455, 126.834005), // 지도의 중심좌표
         //draggable: false,
         //level : 4
         level : 6
      // 지도의 확대 레벨 
      };
      var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
      
	  <c:if test="${logId==null}">
      madeMap();
  	  </c:if>
      // =============== default 서울시 =============== //
      function madeMap() {
         
         var lat, lon, locPosition;
         lat = 37.5662994, // 위도
         lon = 126.9757564; // 경도 
         locPosition = new kakao.maps.LatLng(37.5662994, 126.9757564); // 서울특별시
         map.setCenter(locPosition);   
         map.setLevel(9);
         getHouseMap();
      }
      
      // =============== 쉐어하우스 마커 찍기 =============== //
      function getHouseMap() {
	      <c:forEach items="${houseMapList}" var="item">
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
	                  offset : new kakao.maps.Point(15, 30)
	               }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	      
	               // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	               var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
	               imageOption), markerPosition = coords; // 마커가 표시될 위치입니다
	                 
	                 // 결과값으로 받은 위치를 마커로 표시합니다
	                 var marker = new kakao.maps.Marker({
	                     map: map,
	                     image: markerImage,
	                     zIndex : 11,
	                     position: coords
	                 });
	             } 
	         });    
	      </c:forEach>
	      <c:if test="${logId==null}">
     	  	getMateAddr();
     	  </c:if>
      }
      
      
      
      <c:if test="${logId!=null}">
     	var area = "${logArea}";
     	console.log("area : " + area);
     	if(area!=null){
     		getNowMap(area);
     	}else{
     		madeMap();
     	}
     </c:if>
      function getNowMap(area) {
          var geocoder = new kakao.maps.services.Geocoder();
          geocoder.addressSearch(area, function(result, status) {
             if (status === kakao.maps.services.Status.OK) {
             	setHopeArea(result[0].x, result[0].y)
             }
          });
  	}
     
  	function setHopeArea(x, y) {
          var locPosition = new kakao.maps.LatLng(y, x);
          map.setCenter(locPosition);
          getMateAddr();
  	}
  	  // =============== 하우스메이트 희망지역 리스트 구하기 =============== //
      function getMateAddr() {
         var mateArrList = ${mateMapList};
         // 메이트 리스트 JSON
         var data = {"positions": []}
         
         //var xObject = {}; // 각 주소에 대한 x 좌표를 담을 객체
         //var yObject = {}; // 각 주소에 대한 x 좌표를 담을 객체
         var total = mateArrList.length;
         var counter = 0;
         var geocoder = new kakao.maps.services.Geocoder();

         mateArrList.forEach(function (item) {
           geocoder.addressSearch(item, function(result, status) {
              if (status === kakao.maps.services.Status.OK) {
                 data.positions.push({
                     "lat": result[0].y,
                     "lng": result[0].x
                 });
              }
             counter++; // 비동기 콜백이 수행되었으면 하나 업 카운트

             if (total === counter) { // 모든 비동기 콜백이 수행되었다면
                getMateMap(data); // 다음 로직으로 넘어갑니다.
             }
           });
         });
      }
      
      // =============== 하우스메이트 마커 찍기 =============== //
      function getMateMap(data) {
          var clusterer = new kakao.maps.MarkerClusterer({
              map: map, 
              averageCenter: true, 
              minLevel: 1,
              minClusterSize : 1,
              texts: getTexts, 
              styles: [{ 
                      width : '150px', height : '150px',
                      background: 'rgba(19, 168, 158, .3)',
                      borderRadius: '150px',
                      color: '#fff',
                      textAlign: 'center',
                      fontSize: '1.4rem',
                      fontWeight: 'bold',
                      lineHeight: '150px',
                      textShadow: '0px 0px 6px #0e7770',
                      zIndex : -11
                  }
              ]
          });
          var markers = data.positions.map(function(position) {
              return new kakao.maps.Marker({
                  position : new kakao.maps.LatLng(position.lat, position.lng)
              });
          });

          // 클러스터러에 마커들을 추가합니다
          clusterer.addMarkers(markers);
          clusterer.setMap(map);
          // 클러스터 내부에 삽입할 문자열 생성 함수입니다 
          function getTexts( count ) {
            return count + "명";       
          }
          <c:if test="${logId!=null}">
         	getHouseMap();
       	  </c:if>
      }
	
   </script>
   
</div>