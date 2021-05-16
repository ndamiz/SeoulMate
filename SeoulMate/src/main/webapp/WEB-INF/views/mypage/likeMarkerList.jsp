<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/hyun.css">
	<div class="wrap">
		<section class="content" > <!-- id="myPage_HouseAndMate_Content" -->
			<p class="m_title">${logId}님의 찜 목록</p>
			<ul class="content_menu" id="myPage_HouseAndMate_menu">
				<li><a href="likeMarkerList?category=하우스" class="">쉐어하우스</a></li>
				<li><a href="likeMarkerList?category=메이트" class="">하우스메이트</a></li>
			</ul>
			<!-- 페이지 로딩시에 해당 아이디로 작성된 글을 확인하고, 작성된 사항 확인하여 띄워주며, 둘다 있을 경우 하우스메이트를 기본적으로 띄움 -->
			<!-- 둘다 없을 경우,  찜목록을 띄움 -->
			<!-- 셋다 없을경우... .. 가입한 유형을 확인하여 글을 작성하라고 글작성하는 곳으로 링크를 넣기로 하자.  -->
			
			<!-- 찜목록  -->
			<c:if test="${check==1}">
				<c:forEach var="list" items="${house}">
					<div class="myHouseMateList" id="myHouseMateLikeMarkerList">
						<div class="myPage_HouseAndMate_oneBlock" >
							<div class="myPage_HouseAndMate_Img">
								<div>매칭 <br /><span>89</span> %</div>
								<a href=""><img alt="" src="<%=request.getContextPath()%>/img/comm/sample_house03.png"/></a>
							</div>
							<ul class="myPage_HouseAndMate_Info">
								<li>${list.housename}</li>
								<li>보증금 : ${list.deposit}만원 | 월세 : ${list.rent}만원</li>
								<li>${list.addr}</li>
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
					</div>
				</c:forEach>
			</c:if>
			<c:if test="${check==2}">
				<c:forEach var="list" items="${mate}">
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
					</div>
				</c:forEach>
			</c:if>
			<c:if test="${check==0}">
				dddd??
			</c:if>
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