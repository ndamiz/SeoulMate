<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>

/* ul, li{float:left;} */
#topDiv{ width: 1229px; margin-bottom: 30px; height: 620px; position: relative;}
#topDiv>img{height: 200px; width: 200px;}
/* #img4, #img5, #img6{display: none;} */
.houseViewContent{width: 1230px; margin: 40px auto; overflow: hidden;}
#dateDiv{float: left; height: 50px; line-height: 50px; }
#btnDiv{float: right;
    height: 90px;
    overflow: auto;
    line-height: 90px;}

#houseExplain{width:65%; }
#peopleExplain{    position: relative;
    float: right;
    top: -430px;
    width: 300px;
    height: 520px;
    border: 1px solid #ddd;
    border-radius: 3px; }
#peopleExplain img{margin-top: 30px;}
#peopleExplain li{width: 90%;
    margin: 10px auto;
    text-align: center;}
#peopleExplain li:nth-of-type(2){font-size: 1.5em;}
#profilePic1{width:150px; height:150px; margin-top: 5px;}
#map_Div{background-color:skyblue;}
#reportBtn {display: inline-block; margin-right:20px;}
#middle_Div{overflow: auto; 
	border-radius: 3px; border: 1px solid #ddd;
    position: relative;
    left: 0px;
    top: -420px;
    width: 100%;}
.middle_houseInfo, #propensity_info{
    width: 80%;
    margin: 40px auto;
}

#propensity_info ul>li{float: left;
    height: 40px;
    line-height: 40px;
    padding: 0px 10px;
    width: 50%;
}
#propensity_info ul{width: 100%}
.propensity_info_house, .propensity_info_mate{width: 50%; float: left;}
#facility_info img{width: 70px; height: 70px;}
#facility_info div{width: 100%; overflow: auto;}
#facility_info ul{float: left; margin: 10px 20px;}
#facility_info li{text-align: center;}
.facility_info_title{font-size: 1.2em; font-weight: bold;}
/* 슬라이드 */
.slide_Img{
    position: relative;
    top: 90px;
    width: 920px;
    height: 520px; border-radius: 3px; border: 1px solid #ddd;}
.slide_wraper{height: 500px;
    width: 840px;
    overflow: hidden;
    top: 10px;
    left: 40px;
    position: absolute;}
.slides{
   position:relative; top:0; left:0; width:100%; height:100%;
   transition: left 0.5s ease-out; margin:0 auto;
}
.slides>ul>li:not(:last-child){ float:left; }
.slides>ul>li>img{ width:840px;  height:500px; display:block; padding: 0px 120px;}
.controlls_prev:hover, .controlls_next:hover{background-color: #f3f3f3; border-radius: 3px}
.controlls_prev, .controlls_next{    
	font-size: 25px;
    width: 40px;
    height: 518px;
    line-height: 320px;
    text-align: center;
    position: relative;
    top: 0px;}
.controlls_next{
        float: left;
    left: 878px;
    top: -500px;
    line-height: 520px;
    height: 518px;}
.reportpopup{display: none;}
#pup_wrap_report{display: none;}
#pup_wrap_share{display: none;}
#pup_wrap_share .list_title{width: 100%;}
#snsList li{float: left;}
#vIconTw, #vIconTg, #vIconFb, #vIconKs{ position: relative; box-shadow: none; border: none;
	border-radius: inherit; margin: 0; padding: 0; line-height: inherit; height: inherit;
	width: 40px; height: 40px; font-size:0; }
.snsList li {margin:0 10px;}
.pup_body{height: inherit;}
#pup_wrap_share .list_title{margin: 0 auto; width: max-content}
.snsList li a::before { content: ""; display: block; position: absolute; width: 40px; height: 40px; }
#vIconTw::before { background: url(/home/img/house/twt.png) no-repeat; background-size: cover;}
#vIconTg::before { background: url(/home/img/house/telegram.png) no-repeat; background-size: cover; }
#vIconFb::before { background: url(/home/img/house/facebook.png) no-repeat; background-size: cover; }
#vIconKs::before { background: url(/home/img/house/kakaostory.jpg) no-repeat; background-size: cover; }

</style>

<div class="wrap">
 <div class="houseViewContent">
 	<div id="topDiv">
 		<div id="dateDiv" class="m_title"> ${hVO.housename } </div>
	 	<input type="hidden" value="${hVO.userid }"/>
	 	<input type="hidden" value="${logId }"/>
	 	<div id="btnDiv"> <!-- 수정, 삭제는 본인의 글을 볼 경우에만 -->
		 	<c:if test="${logId==hVO.userid }">
	 		<a id="hEdit" class="white" href="houseEdit?no=${hVO.no }" >수정</a> 
	 		<a class="white" id="houseDel" >삭제</a> 
	 		</c:if>
	 		 <a class="reportBtn" id="reportBtn">
				<img title="신고" alt="신고" src="<%=request.getContextPath()%>/img/comm/ico_report.png">
			</a>
 		</div>
 		<div class="slide_Img">
 			<div class="controlls_prev">◀</div>
	      	<div class="slide_wraper">
	         	<div class="slides">
	            	<ul>
		               <li><img src="/home/housePic/${hVO.housepic1}" title="방1"></li>
		               <li><img src="<%=request.getContextPath()%>/img/house/house02.jpg"></li>
		               <li><img src="<%=request.getContextPath()%>/img/house/house03.jfif"></li>
		               <li><img src="<%=request.getContextPath()%>/img/house/house04.jfif"></li>
		               <li><img src="<%=request.getContextPath()%>/img/house/house02.jpg"></li>
	           		</ul>
	         	</div> <!-- "slides" -->
			</div> <!--slide_wraper -->
			<div class="controlls_next">▶</div>
		</div>
		<div  id="peopleExplain">
			<ul>
				<li ><img src="/home/profilePic/${memProfilePic}" id="profilepic"/> </li>
				<li>${hVO.userid }</li>
				<li><button class="q_btn green">약속잡기</button></li>
				<li><button class="q_btn white">찜하기</button> </li>
				<li><button class="q_btn white" id="shareBtn" >공유하기</button></li>
			</ul>
		</div> <!-- peopleExplain div 종료 -->
 	</div> <!-- topDiv 종료 -->
	
	<div id="middle_Div">
		<div class="middle_houseInfo" id="room_info">
			<p class="s_title">룸 정보</p>
			<table class="tb">
			<thead>
				<tr>
					<th>룸</th>
					<th>보증금</th>
					<th>월세</th>
					<th>입주가능일</th>
					<th>최소거주기간</th>
					<th>최대거주기간</th>
					<th>가구</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="r" items="${rVO_List }">
					<tr>
						<td>${r.roomName } / ${r.roomPeople}인실</td>
						<td>${r.deposit }</td>
						<td>${r.rent }</td>
						<td>${r.enterdate }</td>
						<td>${r.minStay }</td>
						<td>${r.maxStay }</td>
						<td>
							<c:if test="${r.furniture == 1 }">${r.incFurniture }</c:if>
							<c:if test="${r.furniture == 2 }">포함가구 없음</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
			</table>
		</div>
		<div class="middle_houseInfo" id="facility_info">
			<p class="s_title">시설 정보</p>
			<c:set var="publicfacility" value="${fn:split(hVO.publicfacility,',')}"/>
			<div>
			<c:forEach var="p1" items="${publicfacility }">
				<c:if test="${p1 == '냉장고'}">
				<ul>
					<li><img src="/home/img/houseView/refrigerator_icon.svg"/></li>
					<li>냉장고</li>
				</ul>
				</c:if>
				<c:if test="${p1 == '정수기'}">
				<ul>
					<li><img src="/home/img/houseView/cooler_icon.svg"/></li>
					<li>정수기</li>
				</ul>
				</c:if>
				<c:if test="${p1 == '가스레인지'}">
				<ul>
					<li><img src="/home/img/houseView/stove_icon.svg"/></li>
					<li>가스레인지</li>
				</ul>
				</c:if>
				<c:if test="${p1 == '밥솥'}">
				<ul>
					<li><img src="/home/img/houseView/ricecooker_icon.svg"/></li>
					<li>밥솥</li>
				</ul>
				</c:if>
				<c:if test="${p1 == '식기세척기'}">
				<ul>
					<li><img src="/home/img/houseView/dishwasher_icon.svg"/></li>
					<li>식기세척기</li>
				</ul>
				</c:if>
				<c:if test="${p1 == '냄비'}">
				<ul>
					<li><img src="/home/img/houseView/cookingpot_icon.svg"/></li>
					<li>냄비</li>
				</ul>
				</c:if>
				<c:if test="${p1 == '프라이팬'}">
				<ul>
					<li><img src="/home/img/houseView/frying_pan_icon.svg"/></li>
					<li>프라이팬</li>
				</ul>
				</c:if>
				<c:if test="${p1 == '토스트기'}">
				<ul>
					<li><img src="/home/img/houseView/toaster_icon.svg"/></li>
					<li>토스트기</li>
				</ul>
				</c:if>
				<c:if test="${p1 == '소파'}">
				<ul>
					<li><img src="/home/img/houseView/sofa_icon.svg"/></li>
					<li>소파</li>
				</ul>
				</c:if>
				<c:if test="${p1 == '티비'}">
				<ul>
					<li><img src="/home/img/houseView/television_icon.svg"/></li>
					<li>티비</li>
				</ul>
				</c:if>
				<c:if test="${p1 == '탁자'}">
				<ul>
					<li><img src="/home/img/houseView/dinning_table_icon.svg"/></li>
					<li>탁자</li>
				</ul>
				</c:if>
				<c:if test="${p1 == '카펫'}">
				<ul>
					<li><img src="/home/img/houseView/carpet_icon.svg"/></li>
					<li>카펫</li>
				</ul>
				</c:if>
				<c:if test="${p1 == '욕조'}">
				<ul>
					<li><img src="/home/img/houseView/bathtub_icon.svg"/></li>
					<li>욕조</li>
				</ul>
				</c:if>
				<c:if test="${p1 == '비데'}">
				<ul>
					<li><img src="/home/img/houseView/toilet_icon.svg"/></li>
					<li>비데</li>
				</ul>
				</c:if>
				<c:if test="${p1 == '샴푸'}">
				<ul>
					<li><img src="/home/img/houseView/liquid_icon.svg"/></li>
					<li>샴푸</li>
				</ul>
				</c:if>
				<c:if test="${p1 == '린스'}">
				<ul>
					<li><img src="/home/img/houseView/liquid_icon.svg"/></li>
					<li>린스</li>
				</ul>
				</c:if>
				<c:if test="${p1 == '세탁기'}">
				<ul>
					<li><img src="/home/img/houseView/washing_machine_icon.svg"/></li>
					<li>세탁기</li>
				</ul>
				</c:if>
				<c:if test="${p1 == '건조기'}">
				<ul>
					<li><img src="/home/img/houseView/drying_machine_icon.svg"/></li>
					<li>건조기</li>
				</ul>
				</c:if>
				<c:if test="${p1 == '베란다'}">
				<ul>
					<li><img src="/home/img/houseView/balcony_icon.svg"/></li>
					<li>베란다</li>
				</ul>
				</c:if>
				<c:if test="${p1 == 'WIFI'}">
				<ul>
					<li><img src="/home/img/houseView/wifi_icon.svg"/></li>
					<li>WIFI</li>
				</ul>
				</c:if>
				</c:forEach>
			</div>
		</div>
		<div id="propensity_info">
			<div class="propensity_info_house">
				<p class="s_title"> [${hVO.housename }] 하우스 성향</p>
				<ul>
					<li>생활 소음</li>
						<li <c:if test="${pVO.h_noise=='1' }"></c:if>>매우 조용함</li>
						<li><c:if test="${pVO.h_noise=='2' }">보통</c:if></li>
						<li><c:if test="${pVO.h_noise=='3' }">조용하지 않음</c:if></li>
				</ul>
				<ul>
					<li>생활 시간</li>
					<li><c:if test="${pVO.h_pattern=='1' }">주행성</c:if>
						<c:if test="${pVO.h_pattern=='3' }">야행성</c:if></li>
				</ul>
				<ul>
					<li>반려동물 여부</li>
					<li><c:if test="${pVO.h_pet=='1' }">없음</c:if>
						<c:if test="${pVO.h_pet=='3' }">있음</c:if></li>
				</ul>
				<ul>
					<li>반려동물 동반 입실 여부</li>
					<li><c:if test="${pVO.h_petwith=='1' }">불가능</c:if>
						<c:if test="${pVO.h_petwith=='3' }">가능</c:if></li>
				</ul>
				<ul>
					<li>흡연 여부</li>
					<li><c:if test="${pVO.h_smoke=='1' }">비흡연</c:if>
						<c:if test="${pVO.h_smoke=='2' }">실외흡연</c:if>
						<c:if test="${pVO.h_smoke=='3' }">실내흡연</c:if></li>
				</ul>
				<ul>
					<li>분위기</li>
					<li><c:if test="${pVO.h_mood=='1' }">화목함</c:if>
						<c:if test="${pVO.h_mood=='2' }">보통</c:if>
						<c:if test="${pVO.h_mood=='3' }">독립적</c:if></li>
				</ul>
				<ul>
					<li>소통방식</li>
					<li><c:if test="${pVO.h_communication=='1' }">메신저</c:if>
						<c:if test="${pVO.h_communication=='2' }">기타</c:if>
						<c:if test="${pVO.h_communication=='3' }">대화</c:if></li>
				</ul>
				<ul>
					<li>모임빈도</li>
					<li><c:if test="${pVO.h_party=='1' }">없음</c:if>
						<c:if test="${pVO.h_party=='2' }">상관없음</c:if>
						<c:if test="${pVO.h_party=='3' }">있음</c:if></li>
				</ul>
				<ul>
					<li>모임참가 의무</li>
					<li><c:if test="${pVO.h_enter=='1' }">없음</c:if>
						<c:if test="${pVO.h_enter=='2' }">상관없음</c:if>
						<c:if test="${pVO.h_enter=='3' }">있음</c:if></li>
				</ul>
				<ul>
					<li>모임참가 의무</li>
					<li><c:if test="${pVO.h_enter=='1' }">없음</c:if>
						<c:if test="${pVO.h_enter=='2' }">상관없음</c:if>
						<c:if test="${pVO.h_enter=='3' }">있음</c:if></li>
				</ul>
				<ul>
					<li>하우스 지원</li>
					<c:forEach var="i" items="${pVO.h_support }">
						<li>${i }</li>
					</c:forEach>
				</ul>
				<ul>
					<li>기타 사항</li>
					<li>
					<c:forEach var="j" items="${pVO.h_etc }">
						<c:if test="${j == 1}">공용공간청소 </c:if>
						<c:if test="${j == 2}">공용생필품 </c:if>
						<c:if test="${j == 3}">기본식품 </c:if>
					</c:forEach>
					</li>
				</ul>
			</div>
			<div class="propensity_info_mate">
				<p class="s_title">희망 메이트</p>
				<ul>
					<li>생활 시간</li>
					<li><c:if test="${pVO.m_pattern=='1' }">주행성</c:if>
						<c:if test="${pVO.m_pattern=='2' }">야행성</c:if></li>
				</ul>
				<ul>
					<li>성격</li>
					<li><c:if test="${pVO.m_personality=='1' }">내향적</c:if>
						<c:if test="${pVO.m_personality=='2' }">상관없음</c:if>
						<c:if test="${pVO.m_personality=='3' }">외향적</c:if></li>
				</ul>
			</div>
		</div>
	</div> <!-- middleFrm div 종료 -->
<!-- 	<div id="map_Div"> -->
<!-- 	지도 부분 -->
	<div id="map_Div" style="height: 350px; width: 100%;  border-radius: 3px; border: 1px solid #ddd; position: relative; 
	 top: -410px;"></div> <!-- map_Div div종료 -->
<!-- 	</div> map_Div div종료 -->
</div> <!-- content div 종료 -->
</div> <!-- 전체div 종료 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6bad1d8e9a1449ac5fb2b238e99a32ed&libraries=clusterer,services"></script>
<script>
	var mapContainer = document.getElementById('map_Div'), // 지도를 표시할 div 
	mapOption = { 
	    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};
	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption);
	
	var geocoder = new kakao.maps.services.Geocoder();
	// 주소로 좌표를 검색합니다
    geocoder.addressSearch('서울특별시 대흥동', function(result, status) {
        // 정상적으로 검색이 완료됐으면
         if (status === kakao.maps.services.Status.OK) {
          var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
          map.setCenter(coords);
          
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
    
    
</script>
<!-- 		<div class="pup_wrap" id="pup_wrap_report"> -->
		
<!-- 		<div class="pup_form"> -->
<!-- 			<div class="pup_head">신고하기</div> -->
<!-- 			<div class="pup_body"> -->
			
<!-- 			<div class="pup_list"> -->
<!-- 				<div class="list_img"> -->
<%-- 					<img src="<%=request.getContextPath()%>/img/house/house01.jfif" id="reportPic" /> --%>
<!-- 				</div> -->
<!-- 				<div class="list_title"> -->
<!-- 						<p class="s_title">house addr</p> -->
<!-- 						<p class="d_title">즉시입주 가능 / 1명 구해요</p> -->
<!-- 						<p class="d_title">월세 가격 / 보증금</p>  -->
<!-- 						<p class="d_title">신고사유  -->
<!-- 							<select> -->
<!-- 								<option> 허위매물 </option> -->
<!-- 								<option> 기간만료 </option> -->
<!-- 								<option> 광고물 </option> -->
<!-- 							</select> </p> -->
<!-- 						<p class="d_title">상세 사유 <textarea cols="30"></textarea></p> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="pup_bottom"> -->
<!-- 				<a href="" class="btn_cancel">닫기</a> -->
<!-- 				<a href="" class="btn_save">신고하기</a> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 			<a href="" class="btn_close">닫기</a> -->
<!-- 		</div> -->
<!-- 	</div> -->


	<!--  팝업창///////////////////////////////////////////// -->
	<div class="pup_wrap reportpopup">
		<div class="pup_form">
			<form id="reportForm" method="post">
				<div class="pup_head">신고 정보</div>
				<div class="pup_body">
					<div class="pup_list">
						<ul>
							<li><div>신고 ID</div><input class="userid" type="text" name="userid" readonly></li>
							<li><div>신고자 ID</div> <input type="text" name="reportid" value="${logId}" readonly> </li>
							<li>
								<div>분류</div> <input class="reportCategory" type="text" name="category" readonly>
								<input type="hidden" class="reportNum" name="no"><!-- 글/댓글번호 -->
							</li>
							<li><div>신고 사유</div>
								<select id="reportcategory" name="reportcategory">
									<option disabled selected hidden>신고사유를 선택하세요</option>
									<option>홍보,광고</option>
									<option>음란</option>
									<option>욕설</option>
									<option>기타</option>
								</select>
							</li>
							<li><div>상세내용</div> <textarea rows="5" id="reportcontent" name="reportcontent"></textarea></li>
						</ul>
					
					</div>
				</div>
				<div class="pup_bottom">
					<a class="btn_cancel popupClose">닫기</a>
					<a href="javascript:$('#reportForm').submit()" id="reportBtn" class="btn_save">접수</a>
				</div>
				<a class="pup_btn_close popupClose">닫기</a>
			</form>
		</div>
	</div>


		<div class="pup_wrap" id="pup_wrap_share">
			<div class="pup_form">
				<div class="pup_head">공유하기</div>
				<div class="pup_body">
					
						<div class="list_title">
							<ul id="snsList" class="snsList">
							<li><a href="#" id="vIconTw" onclick="return false;">트위터</a></li>
							<li><a href="#" id="vIconTg" onclick="return false;">텔레그램</a> </li>
							<li><a href="#" id="vIconFb" onclick="return false;">페이스북</a></li>
							<li><a href="#" id="vIconKs" onclick="return false;">카카오스토리</a></li>
							</ul>
						</div>
					</div>
					<div class="pup_bottom">
						<a href="" class="btn_cancel">닫기</a>
						<a href="" class="btn_save">확인</a>
					</div>
				<a href="" class="btn_close">닫기</a>
			</div>
		</div>
<script>
    $(function(){

    	$("#houseDel").click(()=>{
			if(confirm("삭제하시겠습니까?")){
				location.href="houseDel?no=${hVO.no }" 
			};
		});
        $('#hEdit').click(function(){ //수정하기 버튼
        	location.href="houseEdit"; //방수정하기 form 으로 이동
        });
        

		$("#reportBtn").click(function(){ //신고하기 버튼 신고팝업창
			$(".reportpopup").css("display", "block");
		});
		
		
		$("#shareBtn").click(function(){ //공유하기 버튼 공유하기팝업창
			$("#pup_wrap_share").css("display", "block");
		});
      
        var slides = document.querySelector('.slides'),
        slide = document.querySelectorAll('.slides li'),
        currentIdx =0,   //현재인덱스
        slideCount = slide.length, //슬라이드의 갯수
        prevBtn = document.querySelector('.controlls_prev'),
        nextBtn = document.querySelector('.controlls_next');
        slideWidth = 840,
        slideMargin = 0,
     
     slides.style.width = (slideWidth + slideMargin)*slideCount - slideMargin +'px'; //슬라이드의 넓이
     
     function moveSlide(num){
        slides.style.left = -num * 840 +'px';
        currentIdx = num;
     }
     
     //이미지 슬라이드 버튼이벤트
     nextBtn.addEventListener('click',function(){
        if(currentIdx < slideCount - 1){
           moveSlide(currentIdx + 1);
        }
     });
     prevBtn.addEventListener('click',function(){
        if(currentIdx >0){
           moveSlide(currentIdx - 1);
        }
     });
     
   });

	//신고하기=================================================
	$(document).on('click','.replyReport', function(){
		var	reportid = $(this).prev().prev().val();
		var category = '하우스';
		var no = $(this).prev().val();
		report(reportid, category, no);
	});
	
	//신고하기 창 띄우고 값 가져오는 함수
	function report(reportid, category, no){
		//값 가져오기
		$(".userid").val(reportid);
		$(".reportCategory").val(category);
		$(".reportNum").val(no);
		$('.reportpopup').css('postion','relative');
		$('.reportpopup').css('z-index','999');
		$('.reportpopup').css('display','block');
		$('body').css('overflow','hidden');
	}
	//신고하기 팝업창 닫기
	$('.popupClose').click(function(){
		reportFormReset();
	});
	function reportFormReset(){
		//값 초기화
		$(".userid").val("");
		$(".reportCategory").val("");
		$(".reportNum").val("");
		$("#reportcontent").val("");
		$("#reportcategory option:eq(0)").prop('selected', true);
		//$("#category").val('${list.category}').prop('selected', true);
		$('.reportpopup').css('display','none');
		$('body').css('overflow','auto');
	}
	//신고하기 서브밋
	$('#reportForm').submit(function(){
		if($("#reportcategory option").index($("#reportcategory option:selected"))==0){
			alert("신고사유를 선택하세요.");
			return false;
		}
		if($("#reportcontent").val()==''){
			alert("상세내용을 입력해주세요.");
			return false;
		}
		var url = '/home/reportInsert'
		var params = $(this).serialize();
		
		$.ajax({
			url : url,
			data : params,
			success : function(result){
				alert("신고가 정상적으로 접수되었습니다.");
				reportFormReset();
			},error : function(){
				alert("신고접수에 실패했습니다..");
			}
		});//ajax end
		return false;
	});

    

    $(window).ready(function(){  //공유하기 팝업창
        $(".snsList li a").click(function(){
			shareAct(this);
  		});
  });
    
    function shareAct(a){ //공유하기
  
        var snsCode = $(a).attr('id');
        var cUrl = document.location.href; console.log(cUrl);
  
        switch(snsCode){
  
            case"vIconTw": //트위터
                cUrl = 'https://twitter.com/intent/tweet?text=페이지제목:&url='+cUrl;
            break;
  
            case"vIconTg": //텔레그램
                cUrl = 'https://telegram.me/share/url?url='+cUrl;
            break;
                  
            case"vIconFb": //페이스북
                cUrl = 'http://www.facebook.com/sharer/sharer.php?u='+cUrl;
            break;
  
            case"vIconKs": //카카오스토리
                cUrl = 'https://story.kakao.com/share?url='+cUrl;
            break;
  			}
  		window.open(cUrl,'','width=700,height=500,top=300,left=450,scrollbars=yes');
		}


	$(()=>{
		$("#houseDel").click(()=>{
			if(confirm("삭제하시겠습니까?")){
				location.href="houseDel?no=${hVO.no}" //true일 경우 실행
			};
		});
	});
    
</script>