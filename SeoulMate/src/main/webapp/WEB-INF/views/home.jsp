<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src = "<%=request.getContextPath()%>/js/like.js"></script>
<c:set var ="mateArrList" value="mateMapList"/>
<script>
	$(function(){
		$("#hPnoSelect>a").click(function(){
			var hpno=$(this).attr("id");
			location.href="hpnoDefault?pno="+hpno;
		});
		
		$("#select_house").click(function(){
			$("#addr_search").attr("type","text");
			$("#area_search").attr("type","hidden");
		});
		$("#select_mate").click(function(){
			$("#area_search").attr("type","text");
			$("#addr_search").attr("type","hidden");
		});
	});
   function exitCheck(){
      if(${pwdCheck=='일치'}){
         alert("그동안 서울 메이트를 이용해주셔서 감사합니다.");
      }
   }
	   
   exitCheck();
   console.log(${logGrade});
   $(function(){
	   //내가 찜한 글은 별버튼에 불 들어오기==============================================세트
	   if(${logId != null}){ // 로그인 했을때만 실행
		   $.ajax({
			   url : '/home/likemarkCheck',
			   data : {'userid': '${logId}'},
			   traditional : true,
			   success : function(result){
				   likeButtonOn(result);
			   },error : function(){
				   alert('찜 목록 불러오기 실패')
			   }
		   });
	   }
		// 찜하기 등록 + 삭제
		$('.btn_star').click(function(){
			var obj = $(this);
			var no = $(this).val();
			var userid = '${logId}'
			var category = ''; 
			if($(obj).hasClass('on')){// 이미 등록한 버튼 눌리면 찜목록에서 삭제
				likeDelete(no, userid, obj)
			}else{
				if($(this).hasClass('houselike')){ // 찜하는 글이 하우스 글일때
					category = '하우스'; 
				}else{ //메이트 글일때.
					category = '메이트';
				}
				likeInsert(no, category, userid, obj); // 찜 등록 ajax함수.
			}
		});//=====================================================================세트
   });
   
</script>
<div class="main_wrap">
   <div class="content">
      <h2 class="main_title">
         당신과 가장 잘 맞는<br>
         쉐어하우스 & 메이트
      </h2>
      
      <form class="main_search_form" method="get" action="/home">
         <div class="checks">
            <input type="radio" id="select_house" name="main_search" checked> 
            <label for="select_house">쉐어하우스</label>
            
            <input type="radio" id="select_mate" name="main_search"> 
            <label for="select_mate">하우스메이트</label>
         </div>
         <div class="search_box">
            <input class="search_text" name="addr" id="addr_search" type="text" placeholder="지역명을 입력하세요.">
            <input class="search_text" name="area" id="area_search" type="hidden" placeholder="지역명을 입력하세요.">
            <button type="submit" class="green"></button>
         </div>
      </form>
   </div>
   <c:if test="${myHousePnoCnt>0}">
	   <c:if test="${logGrade==2}"> <!-- 프리미엄인 하우스의 성향 고르기 -->
	   		<div class="title_wrap" id="hPnoSelect">
	   			<p class="s_title">어느 집의 메이트를 구하시나요?</p><br/>
				<c:forEach var="housePno" items="${myHousePno}">
					<a class="<c:if test='${hPno==housePno.pno}'>green</c:if>" id="${housePno.pno}">
						<c:if test="${housePno.housename!=null}">${housePno.housename}</c:if>
						<c:if test="${housePno.housename==null}">성향${housePno.pno}</c:if>
					</a>
				</c:forEach>
			</div>
   	   </c:if>
   </c:if>
   <!-- 프리미엄 추천 쉐어하우스 -->
   <c:if test="${logGrade==2}">
	   <c:if test="${matePnoCheck>0}">
		   <section class="content recommend_list">
		      <div class="list_head">
			       <p class="m_title">${logName}님과 잘 어울리는 집이예요!</p>
			       <a href="">더보기</a>
		      </div>
		      <c:if test="${phList!=null}">
			      <ul class="list_content">
			         <c:forEach var="phList" items="${phList}">
			            <li>
			               <div class="list_img">
			                  <p><span>매칭</span>${phList.score}<b>%</b></p>
			                   <c:if test="${logId != null}">
	                  				<button class="btn_star houselike" value="${phList.no}"></button>
	                		  </c:if>
			                  <a href="houseView?no=${phList.no}">
			                     <img alt="${phList.housename}" src="<%=request.getContextPath()%>/housePic/${phList.housepic1}" onerror="this.src='<%=request.getContextPath()%>/img/comm/no_house_pic.png'">
			                  </a>
			               </div>
			               <div class="list_title">
			                  <span class="address">${phList.addr}</span>
			                  <span class="pay">￦ ${phList.deposit} / ${phList.rent}</span>
			               </div>
			               <ol class="list_icon">
			                  <li><p>${phList.room}</p></li>
			                  <li><p>${phList.bathroom}</p></li>
			                  <li><p>${phList.nowpeople}</p></li>
			               </ol>
			            </li>
			         </c:forEach>
			      </ul>
		      </c:if>
		      <c:if test="${phList==null}">
		      	<div class="empty_div">
			      	<img class="empty" src="<%=request.getContextPath()%>/img/empty.png" onerror="this.src='<%=request.getContextPath()%>/img/empty.png'"/>
			      	<p style="text-align:center;">매칭에 맞는 결과가 없습니다.</p>
		      	</div>
		      </c:if>
		   </section>
	   </c:if>
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
               	<c:if test="${logGrade==2}">
               	  <c:if test="${matePnoCheck>0}"> <!-- 등록된 메이트 성향이 없으면 매칭을 안보여줌 -->
                  <p><span>매칭</span>${newHouseVO.score}<b>%</b></p>
                  </c:if>
                </c:if>
                  <button class="btn_star houselike" value="${newHouseVO.no}"></button>
                  <a href="houseView?no=${newHouseVO.no}">
                     <img alt="" src="<%=request.getContextPath()%>/housePic/${newHouseVO.housepic1}" onerror="this.src='<%=request.getContextPath()%>/img/comm/no_house_pic.png'">
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
   
   <c:if test="${myHousePnoCnt>0}">
	   <c:if test="${logGrade==2}">
		   <!-- 프리미엄 추천 하우스메이트 -->
		   <section class="content recommend_list mate_list">
		      <div class="list_head">
		         <p class="m_title">${logName}님과 잘 어울리는 메이트예요!</p>
		         <a href="">더보기</a>
		      </div>
		      <c:if test="${pmList!=null}">
			      <ul class="list_content">
			         <c:forEach var="pmList" items="${pmList}">
			            <li>
			               <div class="list_img">
			                  <p><span>매칭</span>${pmList.score}<b>%</b></p>
			                  <button class="btn_star matelike" value="${pmList.no}"></button>
			                  <a href="mateView?no=${pmList.no}">
			                     <img alt="" src="<%=request.getContextPath()%>/matePic/${pmList.matepic1}" onerror="this.src='<%=request.getContextPath()%>/img/comm/no_house_pic.png'">
			                  </a>
			               </div>
			               <div class="list_title">
			                  <span class="mate_id">${pmList.userid}</span>
			                  <span class="pay">￦ ${pmList.deposit} / ${pmList.rent}</span>
			               </div>
			               <span class="address">
			               		${pmList.area1}
			               		<c:if test="${pmList.area2 != null }"> |  ${pmList.area2}</c:if>
			               		<c:if test="${pmList.area3 != null }"> |  ${pmList.area3}</c:if>
<%-- 			               		<c:if test="${pmList.area2!=null}">${pmList.area2}</c:if> --%>
<%-- 			               		<c:if test="${pmList.area3!=null}">${pmList.area3}</c:if> --%>
			               </span>
			               <ol class="list_icon">
			                  <li>
			                  	<p>
				                  	<c:if test="${pmList.gender==1}">여</c:if>
	                  				<c:if test="${pmList.gender==3}">남</c:if>
                  				</p>
							  </li>
			                  <li><p>${pmList.birth}세</p></li>
			                  <li><p>${pmList.enterdate}</p></li>
			               </ol>
			            </li>
			         </c:forEach>
			      </ul>
		      </c:if>
		      <c:if test="${pmList==null}">
				<div class="empty_div">
	      			<img class="empty" src="<%=request.getContextPath()%>/img/empty.png" onerror="this.src='<%=request.getContextPath()%>/img/empty.png'"/>
	      			<p style="text-align:center;">매칭에 맞는 결과가 없습니다.</p>
      			</div>
		      </c:if>
		   </section>
	   </c:if>
   </c:if>
   <!-- 신규 하우스메이트 -->
   <section class="content recommend_list mate_list">
      <div class="list_head">
         <p class="m_title">NEW 하우스메이트</p>
         <a href="">더보기</a>
      </div>
      <c:if test="${newMateListCnt!=0}">
	      <ul class="list_content">
	         <c:forEach items="${newMateList}" var="newMateVO">
	            <li>
	               <div class="list_img">
	               	 <c:if test="${myHousePnoCnt>0}"> <!-- 등록된 하우스 성향이 없으면 매칭을 안보여줌 -->
	               	 	<c:if test="${logGrade==2}"> <!-- 프리미엄만 매칭을 보여줌 -->
	                  		<p><span>매칭</span>${newMateVO.score}<b>%</b></p>
	                  	</c:if>
	                 </c:if>
	                  <button class="btn_star matelike" value="${newMateVO.no}"></button>
	                  <a href="mateView?no=${newMateVO.no}">
	                     <img alt="" src="<%=request.getContextPath()%>/matePic/${newMateVO.matePic1}" onerror="this.src='<%=request.getContextPath()%>/img/comm/no_mate_pic.png'">
	                  </a>
	               </div>
	               <div class="list_title">
	                  <span class="mate_id">${newMateVO.userid}</span>
	                  <span class="pay">￦ ${newMateVO.deposit} / ${newMateVO.rent}</span>
	               </div>
	               <span class="address">
	               	${newMateVO.listVO.area1} 
	               	<c:if test="${newMateVO.listVO.area2 != null}">
	                	| ${newMateVO.listVO.area2} 
	               	</c:if>
	               	<c:if test="${newMateVO.listVO.area3 != null}">
	                	| ${newMateVO.listVO.area3}
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
	  </c:if>
	  <c:if test="${newMateListCnt==0}">
	  	<div class="empty_div">
      		<img class="empty" src="<%=request.getContextPath()%>/img/empty.png" onerror="this.src='<%=request.getContextPath()%>/img/empty.png'"/>
      		<p style="text-align:center;">필터에 맞는 결과가 없습니다.</p>
     	</div>
	  </c:if>
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