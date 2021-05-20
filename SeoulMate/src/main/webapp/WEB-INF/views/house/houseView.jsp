<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>

/* ul, li{float:left;} */
#topDiv{height:300px; width:100%; position: relative; margin-bottom: 30px;}
#topDiv>img{height: 200px; width: 200px;}
/* #img4, #img5, #img6{display: none;} */
#dateDiv{float: left; height: 50px; line-height: 50px; }
#btnDiv{float: right; height: 50px; overflow: auto;}

#middle_Div{  width:100%; height:400px; }
#middle_Div>div{float:left;}
#houseExplain{width:65%; }
#peopleExplain{width:35%; margin:0 auto; text-align: center;  }
/* #peopleExplain>ul{ text-align:center; align-items: center;} */
#peopleExplain li{ /*display:inline-block;*/ text-align:center; align-items: center; height: 100%;}
#profilePic1{width:150px; height:150px; margin-top: 5px;}
#matching{position: relative; text-align: center;}
#map_Div{background-color:skyblue;}


/* 슬라이드 */
.slide_wraper{
   height:250px;
   width:250px;
   margin:0 auto;
   overflow:hidden;
   
}
.slides{
   position:relative;
   top:0;
   left:0;
   width:100%;
   height:100%;
   transition: left 0.5s ease-out;
   margin:0 auto;
   text-align: center;
}
.slides>ul>li:not(:last-child){
   float:left;
   
}
.slides>ul>li>img{
   width:250px;
   height:250px;
   display:block;
}

.controlls{
   width:80%;
   height:40px;
   position:absolute;
	z-index: 1;
	top:50%

}
.controlls span{
   font-size:25px;
   width:40px;
   height:40px;
   line-height:40px;
   position:absolute;
   left:0;
   top:0;
}
.controlls span.prev{
   display:block;
   left:37%;
}
.controlls span.next{
   left:75%;
}
.reportpopup{display: none;}
#pup_wrap_report{display: none;}
#pup_wrap_share{display: none;}
#pup_wrap_share .list_title{width: 100%;}
#snsList li{float: left;}


#vIconTw, #vIconTg, #vIconFb, #vIconKs{
	position: relative;
	box-shadow: none;
	border: none;
	border-radius: inherit;
	margin: 0;
	padding: 0;
	line-height: inherit;
	height: inherit;
	width: 40px;
	height: 40px;
	font-size:0;
}
.snsList li {margin:0 10px;}
.pup_body{height: inherit;}
#pup_wrap_share .list_title{margin: 0 auto; width: max-content}
.snsList li a::before {
	content: "";
	display: block;
	position: absolute;
	width: 40px;
	height: 40px;
}
#vIconTw::before {
	background: url(/home/img/house/twt.png) no-repeat;
	background-size: cover;
}
#vIconTg::before {
	background: url(/home/img/house/telegram.png) no-repeat;
	background-size: cover;
}
#vIconFb::before {
	background: url(/home/img/house/facebook.png) no-repeat;
	background-size: cover;
}
#vIconKs::before {
	background: url(/home/img/house/kakaostory.jpg) no-repeat;
	background-size: cover;
}

</style>
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
        prevBtn = document.querySelector('.prev'),
        nextBtn = document.querySelector('.next');
        slideWidth = 250,
        slideMargin = 0,
     
     slides.style.width = (slideWidth + slideMargin)*slideCount - slideMargin +'px'; //슬라이드의 넓이
     
     function moveSlide(num){
        slides.style.left = -num * 250 +'px';
        currentIdx = num;
     }
     
     //이미지 슬라이드 버튼이벤트
     nextBtn.addEventListener('click',function(){
        console.log(currentIdx);
        if(currentIdx < slideCount - 1){
           moveSlide(currentIdx + 1);
           if(currentIdx>0){
              prevBtn.style.display = 'block';
           }
           if(currentIdx==slideCount-5){
              nextBtn.style.display = 'none';
           }
        }
     });
     prevBtn.addEventListener('click',function(){
        if(currentIdx >0){
           moveSlide(currentIdx - 1);
           if(currentIdx==0){
              prevBtn.style.display = 'none';
           }
           if(currentIdx==slideCount-5){
              nextBtn.style.display = 'block';
           }
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
<div class="wrap">
 <div class="content">
 	<div id="topDiv">
	 	<div id="dateDiv">
	 	${hVO.writedate } 등록
	 	</div>
	 	<input type="hidden" value="${hVO.userid }"/>
	 	<input type="hidden" value="${logId }"/>
	 	<div id="btnDiv"> <!-- 수정, 삭제는 본인의 글을 볼 경우에만 -->
	 	<c:if test="${logId==hVO.userid }">
 		<a id="hEdit" class="white" href="houseEdit?no=${hVO.no }" >수정</a> 
 		<a class="white" id="houseDel" >삭제</a> 
 		</c:if>
 		<button class="white">찜</button> 
 		<button class="white" id="shareBtn" >공유하기</button> <button class="white" id="reportBtn">신고하기</button>
 		
 		</div>
 		
 	<br/>

 		<div class="controlls">
         	<span class="prev">◀</span>
         	<span class="next">▶</span>
        </div>
    
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

 	</div> <!-- topDiv 종료 -->
 	
	<hr/>
	
	<div id="middle_Div">
	
		<div id="houseExplain">
		<p class="s_title">${hVO.addr }</p> <br/> 
		보증금 ₩ ${rVO.deposit } | 월세 ₩ ${rVO.rent } | 하우스 메이트 ${hVO.searchpeople }명 구해요  <br/>
		House 키워드 <br/>
		<p>Room ${hVO.room } | BathRoom ${hVO.bathroom } | 현재 ${hVO.nowpeople } 명 거주 중 </p> <br/>
		<p>공용 시설 <br/> ${hVO.publicfacility }</p>
		
		Room 키워드 <br/>
		<p>최소 거주 가능 기간 ${rVO.minStay } | 최대 거주 가능 기간 ${rVO.maxStay }</p> <br/>
		<p>기본 포함 가구 ${rVO.incFurniture }</p> <br/>
		우리집 소개 <br/>
		${hVO.houseprofile }
		
		</div> <!-- houseExplain div 종료 -->
		
		<div  id="peopleExplain">
		
		<ul>
			<li ><img src="/home/profilePic/${memProfilePic}" id="profilepic"/> </li>
			<li>응답률 : ㅁㅁ% <br/>
			최근접속 : 1일 전  <br/>
			<button class="green">약속잡기</button></li>
		</ul>
		</div> <!-- peopleExplain div 종료 -->
	<hr/>
		<div id="matching" >
		매칭률 넣어서 
		<!-- 프리미엄 추천 쉐어하우스 -->
	
		</div> <!-- macthing 넣을 div 종료 -->
	</div> <!-- middleFrm div 종료 -->
	
<!-- 	<div id="map_Div"> -->
<!-- 	지도 부분 -->
	<div id="map_Div" style="height:350px"></div> <!-- map_Div div종료 -->
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