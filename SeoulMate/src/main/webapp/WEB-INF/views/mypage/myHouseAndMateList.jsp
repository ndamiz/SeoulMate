<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/hyun.css">
<script>
	function myPage_Popup(popupId){
		//팝업 클릭시에 popup id를 받아와서 해당 popup div 띄워주기
		$('#myPage_popup_FullScreen').removeClass('popup_hidden');
		$('body').addClass('popup_Stop_Scroll');
		console.log(popupId);
		if(popupId=='popup_TakeApply'){
			$("#popup_TakeApply").removeClass('popup_hidden');
		}if(popupId=='popup_SendApply'){
			$("#popup_SendApply").removeClass('popup_hidden');
		}if(popupId=='popup_TakeInvite'){
			$("#popup_TakeInvite").removeClass('popup_hidden');
		}if(popupId=='popup_SendInvite'){
			$("#popup_SendInvite").removeClass('popup_hidden');
		}
	}
	$(function(){
		$('.popup_Close').on('click',function(){
			$('#myPage_popup_FullScreen').addClass('popup_hidden');
			$(".myPage_HouseAndMate_Popup").addClass('popup_hidden');
			$('body').removeClass('popup_Stop_Scroll');
		});
		
	});
</script>
	<div class="wrap">
		<section class="content" > <!-- id="myPage_HouseAndMate_Content" -->
			<p class="m_title">하우스&메이트 관리</p>
			<ul class="content_menu" id="myPage_HouseAndMate_menu">
				<li><a class="">쉐어하우스</a></li>
				<li><a class="">하우스메이트</a></li>
				<li><a class="likeMarkerList">찜목록</a></li>
			</ul>
			<!-- 페이지 로딩시에 해당 아이디로 작성된 글을 확인하고, 작성된 사항 확인하여 띄워주며, 둘다 있을 경우 하우스메이트를 기본적으로 띄움 -->
			<!-- 둘다 없을 경우,  찜목록을 띄움 -->
			<!-- 셋다 없을경우... .. 가입한 유형을 확인하여 글을 작성하라고 글작성하는 곳으로 링크를 넣기로 하자.  -->
			
			<!-- 쉐어 하우스 글을 작성했을 경우 및 클릭 시 -->
			<div class="myHouseMateList" id="myShareHousePosting">
				<div class="myPage_HouseAndMate_oneBlock" >
					<div class="myPage_HouseAndMate_Img">
						<a href=""><img alt="" src="<%=request.getContextPath()%>/img/comm/sample_house03.png"/></a>
					</div>
					<ul class="myPage_HouseAndMate_Info">
						<li>집이름지어논거 ? </li>
						<li>보증금 : 200만원 | 월세 : 30만원</li>
						<li>서울시 마포구 아현동</li>
						<li>
							<ul class="myPage_HouseAndMate_House">
								<li><p>1</p></li>
								<li><p>2</p></li>
								<li><p>3</p></li>
							</ul>
						</li>
					</ul>
					<div class="myPage_HouseAndMate_Btn">
						<a href="javascript:myPage_Popup('popup_TakeApply')" class="b_btn white">받은신청</a>
						<a href="javascript:myPage_Popup('popup_SendInvite')" class="b_btn white">보낸초대</a>
						<a href="" class="b_btn white">수정</a>
						<a href="" class="b_btn white">삭제</a>
						<a href="" class="b_btn green">매칭완료</a>
					</div>
				</div>
			</div>
			
			<!-- 하우스메이트 글을 작성했을 경우 및 클릭시  -->
			<div class="myHouseMateList" id="myHouseMatePosting">
				<div class="myPage_HouseAndMate_oneBlock" >
					<div class="myPage_HouseAndMate_Img">
						<a href=""><img alt="" src="<%=request.getContextPath()%>/img/comm/sample_mate01.png"/></a>
					</div>
					<ul class="myPage_HouseAndMate_Info">
						<li>본인아이디</li>
						<li>보증금 : 300만원 | 월세 : 25만원</li>
						<li>대흥동 | 공덕동 | 북아현동</li>
						<li>
							<ul class="myPage_HouseAndMate_Mate">
								<li><p>여</p></li>
								<li><p>27세</p></li>
								<li><p>즉시</p></li>
							</ul>
						</li>
					</ul>
					<div class="myPage_HouseAndMate_Btn">
						<a href="javascript:myPage_Popup('popup_TakeInvite')" class="b_btn white">받은초대</a>
						<a href="javascript:myPage_Popup('popup_SendApply')" class="b_btn white">보낸신청</a>
						<a href="" class="b_btn white">수정</a>
						<a href="" class="b_btn white">삭제</a>
						<a href="" class="b_btn green">매칭완료</a>
					</div>
				</div>
			</div>
			
			
			
			<!-- 찜목록  -->
			<div class="myHouseMateList" id="myHouseMateLikeMarkerList">
				<div class="myPage_HouseAndMate_oneBlock" >
					<div class="myPage_HouseAndMate_Img">
						<div>매칭 <br /><span>89</span> %</div>
						<a href=""><img alt="" src="<%=request.getContextPath()%>/img/comm/sample_house03.png"/></a>
					</div>
					<ul class="myPage_HouseAndMate_Info">
						<li>집이름지어논거 ? </li>
						<li>보증금 : 200만원 | 월세 : 30만원</li>
						<li>서울시 마포구 아현동</li>
						<li>
							<ul class="myPage_HouseAndMate_House">
								<li><p>1</p></li>
								<li><p>2</p></li>
								<li><p>3</p></li>
							</ul>
						</li>
					</ul>
					<div class="myPage_HouseAndMate_LikeMarker_Btn">
						<a href="" class="b_btn white">찜 삭제</a>
						<a href="" class="b_btn white">약속잡기</a>
					</div>
				</div>
				
				<div class="myPage_HouseAndMate_oneBlock" >
					<div class="myPage_HouseAndMate_Img">
						<div>매칭 <br /><span>92</span> %</div>
						<a href=""><img alt="" src="<%=request.getContextPath()%>/img/comm/sample_house02.png"/></a>
					</div>
					<ul class="myPage_HouseAndMate_Info">
						<li>집이름지어논거 ? </li>
						<li>보증금 : 300만원 | 월세 : 25만원</li>
						<li>서울시 마포구 아현동</li>
						<li>
							<ul class="myPage_HouseAndMate_House">
								<li><p>1</p></li>
								<li><p>2</p></li>
								<li><p>3</p></li>
							</ul>
						</li>
					</ul>
					<div class="myPage_HouseAndMate_LikeMarker_Btn">
						<a href="" class="b_btn white">찜 삭제</a>
						<a href="" class="b_btn white">약속잡기</a>
					</div>
				</div>
				<div class="myPage_HouseAndMate_oneBlock">
					<div class="myPage_HouseAndMate_Img">
						<div>매칭 <br /><span>90</span> %</div>
						<a href=""><img alt="" src="<%=request.getContextPath()%>/img/comm/sample_mate01.png"/></a>
					</div>
					<ul class="myPage_HouseAndMate_Info">
						<li>유저아이디</li>
						<li>보증금 : 200만원 | 월세 : 30만원</li>
						<li>아현동 | 공덕동 | 대흥동</li>
						<li>
							<ul class="myPage_HouseAndMate_Mate">
								<li><p>여</p></li>
								<li><p>27세</p></li>
								<li><p>즉시</p></li>
							</ul>
						</li>
					</ul>
					<div class="myPage_HouseAndMate_LikeMarker_Btn">
						<a href="" class="b_btn white">찜 삭제</a>
						<a href="" class="b_btn white">초대하기</a>
					</div>
				</div>
				<div class="myPage_HouseAndMate_oneBlock">
					<div class="myPage_HouseAndMate_Img">
						<div>매칭 <br /><span>91</span> %</div>
						<a href=""><img alt="" src="<%=request.getContextPath()%>/img/comm/sample_mate02.png"/></a>
					</div>
					<ul class="myPage_HouseAndMate_Info">
						<li>유저아이디</li>
						<li>보증금 : 300만원 | 월세 : 25만원</li>
						<li>대흥동 | 공덕동 | 북아현동</li>
						<li>
							<ul class="myPage_HouseAndMate_Mate">
								<li><p>여</p></li>
								<li><p>21세</p></li>
								<li><p>5/1</p></li>
							</ul>
						</li>
					</ul>
					<div class="myPage_HouseAndMate_LikeMarker_Btn">
						<a href="" class="b_btn white">찜 삭제</a>
						<a href="" class="b_btn white">초대하기</a>
					</div>
				</div>
			</div>
		</section>
		
		<!--받은신청 -  팝업 (하우스에서 클릭 할 경우/ 띄우는건 신청을 한 메이트의 정보-->
		<div class="myPage_HouseAndMate_Popup popup_hidden" id="popup_TakeApply">
			<div class="myPage_HouseAndMate_Popup_Title">받은신청<span class="popup_Close">✕</span></div>
			<div class="myPage_HouseAndMate_Popup_Content">
				<div class="myPage_HouseAndMate_Popup_OneBlock">
					<div class="myPage_HouseAndMate_Popup_Img">
						<a href=""><img alt="" src="<%=request.getContextPath()%>/img/comm/sample_mate02.png"/></a>
					</div>
					<ul class="myPage_HouseAndMate_Popup_Info">
						<li><span class="s_title">user1</span><span class="s_title">남성</span><span class="s_title">31세</span></li>
						<li>대흥동 | 공덕동 | 북아현동</li>
						<li>보증금 : 300만원 | 월세 : 25만원</li>
					</ul>
					<div class="myPage_HouseAndMate_Popup_Btn">
						<a href="" class="b_btn green">승인</a>
						<a href="" class="b_btn green">메세지</a>
						<a href="" class="b_btn green">거절</a>
					</div>
				</div>
				<div class="myPage_HouseAndMate_Popup_OneBlock">
					<div class="myPage_HouseAndMate_Popup_Img">
						<a href=""><img alt="" src="<%=request.getContextPath()%>/img/comm/sample_mate03.png"/></a>
					</div>
					<ul class="myPage_HouseAndMate_Popup_Info">
						<li><span class="s_title">user1</span><span class="s_title">남성</span><span class="s_title">31세</span></li>
						<li>대흥동 | 공덕동 | 북아현동</li>
						<li>보증금 : 300만원 | 월세 : 25만원</li>
					</ul>
					<div class="myPage_HouseAndMate_Popup_Btn">
						<a href="" class="b_btn green">승인</a>
						<a href="" class="b_btn green">메세지</a>
						<a href="" class="b_btn green">거절</a>
					</div>
				</div>
			</div>
			<div class="myPage_HouseAndMate_Popup_footer">
				<p class="b_btn white popup_Close" >닫기</p>
			</div>
		</div>
		
		<!--보낸초대 -  팝업 (하우스에서 클릭 할 경우 / 띄우는건 내가 초대를 보낸 메이트의 정보-->
		<div class="myPage_HouseAndMate_Popup popup_hidden" id="popup_SendInvite">
			<div class="myPage_HouseAndMate_Popup_Title">보낸초대<span class="popup_Close">✕</span></div>
			<div class="myPage_HouseAndMate_Popup_Content">
				<div class="myPage_HouseAndMate_Popup_OneBlock">
					<div class="myPage_HouseAndMate_Popup_Img">
						<a href=""><img alt="" src="<%=request.getContextPath()%>/img/comm/sample_mate02.png"/></a>
					</div>
					<ul class="myPage_HouseAndMate_Popup_Info">
						<li><span class="s_title">user1</span><span class="s_title">남성</span><span class="s_title">31세</span></li>
						<li>대흥동 | 공덕동 | 북아현동</li>
						<li>보증금 : 300만원 | 월세 : 25만원</li>
					</ul>
					<div class="myPage_HouseAndMate_Popup_Btn">
							<a href="" class="b_btn green">메세지</a>
							<a href="" class="b_btn green">취소</a>
						</div>
				</div>
			</div>
			<div class="myPage_HouseAndMate_Popup_footer">
				<p class="b_btn white popup_Close" >닫기</p>
			</div>
		</div>
		
		<!-- 받은초대  (메이트일 경우에 나옴)집의 정보  -->
		<div class="myPage_HouseAndMate_Popup popup_hidden" id="popup_TakeInvite">
			<div class="myPage_HouseAndMate_Popup_Title">받은초대<span class="popup_Close">✕</span></div>
			<div class="myPage_HouseAndMate_Popup_Content">
				<div class="myPage_HouseAndMate_Popup_OneBlock">
					<div class="myPage_HouseAndMate_Popup_Img">
						<a href=""><img alt="" src="<%=request.getContextPath()%>/img/comm/sample_house01.png"/></a>
					</div>
					<ul class="myPage_HouseAndMate_Popup_Info">
						<li><span class="s_title">집이름</span></li>
						<li>서울시 마포구 아현동</li>
						<li>보증금 : 300만원 | 월세 : 25만원</li>
					</ul>
					<div class="myPage_HouseAndMate_Popup_Btn">
						<a href="" class="b_btn green">승인</a>
						<a href="" class="b_btn green">메세지</a>
						<a href="" class="b_btn green">거절</a>
					</div>
				</div>
				<div class="myPage_HouseAndMate_Popup_OneBlock">
					<div class="myPage_HouseAndMate_Popup_Img">
						<a href=""><img alt="" src="<%=request.getContextPath()%>/img/comm/sample_house02.png"/></a>
					</div>
					<ul class="myPage_HouseAndMate_Popup_Info">
						<li><span class="s_title">집이름</span></li>
						<li>서울시 마포구 대흥동</li>
						<li>보증금 : 300만원 | 월세 : 30만원</li>
					</ul>
					<div class="myPage_HouseAndMate_Popup_Btn">
						<a href="" class="b_btn green">승인</a>
						<a href="" class="b_btn green">메세지</a>
						<a href="" class="b_btn green">거절</a>
					</div>
				</div>
			</div>
			<div class="myPage_HouseAndMate_Popup_footer">
				<p class="b_btn white popup_Close" >닫기</p>
			</div>
		</div>
		
		
		<!-- 보낸신청 -->
		<div class="myPage_HouseAndMate_Popup popup_hidden" id="popup_SendApply">
			<div class="myPage_HouseAndMate_Popup_Title">보낸신청<span class="popup_Close">✕</span></div>
			<div class="myPage_HouseAndMate_Popup_Content">
				<div class="myPage_HouseAndMate_Popup_OneBlock">
					<div class="myPage_HouseAndMate_Popup_Img">
						<a href=""><img alt="" src="<%=request.getContextPath()%>/img/comm/sample_house02.png"/></a>
					</div>
					<ul class="myPage_HouseAndMate_Popup_Info">
						<li><span class="s_title">집이름</span></li>
						<li>서울시 마포구 대흥동</li>
						<li>보증금 : 300만원 | 월세 : 30만원</li>
					</ul>
					<div class="myPage_HouseAndMate_Popup_Btn">
							<a href="" class="b_btn green">메세지</a>
							<a href="" class="b_btn green">취소</a>
						</div>
				</div>
			</div>
			<div class="myPage_HouseAndMate_Popup_footer">
				<p class="b_btn white popup_Close" >닫기</p>
			</div>
		</div>
	</div>	
		<div class="myPage_HouseAndMate_Popup_FullScreen popup_Close popup_hidden" id="myPage_popup_FullScreen"></div>
	