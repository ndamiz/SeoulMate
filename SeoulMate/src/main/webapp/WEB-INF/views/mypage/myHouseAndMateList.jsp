<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/hyun.css">
<script>
	$(function(){
		$(document).on('click', '.popup_Close', function(){
			$('#myPage_popup_FullScreen').addClass('popup_hidden');
			$(".myPage_HouseAndMate_Popup").addClass('popup_hidden');
			$(".alert_pop").addClass('popup_hidden');
			$('body').removeClass('popup_Stop_Scroll');
		});
		//받은신청 승인, 보낸초대 승인
		$(document).on('click','.applyInviteApprove', function(){
			var msg = $('.myPage_HouseAndMate_Popup_Content').children().eq(0).val();
			var no =0;
			var userid = '';
			
			if(msg=='takeApply'){
				//받은 신청  takeApply  (하우스입장에서 확인 )
				//no = 하우스글번호(본인글) , userid = 신청한 사람 아이디 (유동적)
				no = $('.myPage_HouseAndMate_Popup_Content').children().eq(1).val();
				userid =$(this).parent().children().eq(0).val();
			}else if(msg == 'takeInvite'){
				//받은 초대 takeInvite 
				// no = 초대를한글번호 (유동적) , userid = 본인 
				userid = $('.myPage_HouseAndMate_Popup_Content').children().eq(1).val();
				no = $(this).parent().children().eq(0).val();
			}
			
			var url = '/home/applyInviteApprove';
			var data = {'no':no, 'msg':msg, 'userid':userid};
			$.ajax({
				url : url,
				data : data,
				success : function(result){
					userid='<c:out value="${logId }"/>';
		console.log(result);
					if(result==1){
						// 채팅방  insert완료 
						if(msg=='takeApply'){
							$('.alert_pop_Content').html('<p>신청 수락이 완료되었습니다.</p><p>채팅으로 약속을 잡아보세요!</p>');
							$('.alert_pop').removeClass("popup_hidden");
							$('#myPage_popup_FullScreen').removeClass('popup_hidden');
							$('body').addClass('popup_Stop_Scroll');
						}else if(msg=='takeInvite'){
							$('.alert_pop_Content').html('<p>초대 수락이 완료되었습니다.</p><p>채팅으로 약속을 잡아보세요!</p>');
							$('.alert_pop').removeClass("popup_hidden");
							$('#myPage_popup_FullScreen').removeClass('popup_hidden');
							$('body').addClass('popup_Stop_Scroll');
						}
						
					}else if(result==200){
						// 이미 채팅방이있다. 
						$('.alert_pop_Content').html('<p>이미 채팅이 활성화 되어있습니다.</p><p>채팅으로 약속을 잡아보세요!</p>');
						$('.alert_pop').removeClass("popup_hidden");
						$('#myPage_popup_FullScreen').removeClass('popup_hidden');
						$('body').addClass('popup_Stop_Scroll');
							
						userid='<c:out value="${logId }"/>';
						applyInviteList(no, msg, userid);
					}else if(result== -1) {
						console.log('리턴-1- 이미채팅방은있음. name update 실패.');
					}else {
						console.log('리턴0  에러실패');
					}
				}, error : function(){
					console.log('마이페이지 받은신청, 받은초대 DB데이터 승인으로 업데이트 실패');
				}
			});
		});
		//보낸 신청, 보낸 초대 취소 클릭 시에 실행.
		$(document).on('click', '.applyInviteCancel', function(){
			var msg = $('.myPage_HouseAndMate_Popup_Content').children().eq(0).val();
			var no =0;
			var userid = '';
			if(msg='takeApply' || msg == 'sendInvite'){
				// 받은 신청 (userid 변동됨 /no=로그인한사람이 쓴 하우스글번호)
				// 보낸초대 (userid변동됨(mate) / no= 로그인한사람=하우스글쓴이)
				// 글번호는 1개고, 받은신청은 여러개/ 보낸초대 여러개 
				no = $('.myPage_HouseAndMate_Popup_Content').children().eq(1).val();
				userid =$(this).parent().children().eq(0).val();
			}
			if(msg == 'sendApply' || msg == 'takeInvite'){
				// 보낸신청 (userid = 본인  / no = 신청을 한 글번호들)
				// 받은 초대 (userid = 본인 / no = 나한테초대를 누른 하우스글번호)
				// 글번호여러개, 보낸신청 / 받은초대 userid 본인 혼자.  
				userid = $('.myPage_HouseAndMate_Popup_Content').children().eq(1).val();
				no = $(this).parent().children().eq(0).val();
			}
			// ajax로 지운 후, 지웟다고 확인되면, applyInviteList(no, msg, userid) 함수 실행. 
			var url = '/home/mypageApplyInviteCancel';
			var data = {'no':no, 'msg':msg, 'userid':userid};
			$.ajax({
				url : url,
				data : data,
				success : function(result){
					userid='<c:out value="${logId }"/>';
					if(result>0){
						applyInviteList(no, msg, userid);
					}else{
						console.log('리턴0 삭제실패.');
					}
				}, error : function(){
					console.log('마이페이지 보낸신청, 보낸초대 DB데이터 삭제 실패');
				}
			});
		});
		// 리스트 
		function applyInviteList(no, msg, userid){
			var url = '/home/mypagePopup'
			var data = {'no':no, 'msg':msg};
			
			$.ajax({
				url:url,
				data : data,
				success : function(result){
					$mwVOList = $(result.pop_mwVO);
					$hwVOList = $(result.pop_hwVO);
					$aiList = $(result.aiList);
					var tag = '';
					var gender = '';
					if(result.pop_mwVO!=null ){
						
						if(msg == 'takeApply' || msg=='sendInvite'){
							//받은 신청 (리턴값 mate정보 리스트) // //보낸 초대 (리턴값 mate정보 리스트)
							//1. 팝업 내용 초기화 
							$('.myPage_HouseAndMate_Popup').children().eq(1).empty();
							//2. 타이틀 내용 변경. 
							if(msg == 'takeApply'){
								$('.myPage_HouseAndMate_Popup_Title').html('받은 신청<span class="popup_Close">✕</span>');
							}else if(msg=='sendInvite'){
								$('.myPage_HouseAndMate_Popup_Title').html('보낸 초대<span class="popup_Close">✕</span>');	
							}
							tag+='<input type="hidden" name="msg" value="'+msg+'" />';	
							tag+='<input type="hidden" name="no" value="'+no+'" />';
							//3. 반복문돌려서 tag 만들어 넣기. 
							
							$mwVOList.each(function(idx,obj){
								var confirm = '';
								$aiList.each(function(aIdx, aObj){
									if(obj.userid == aObj.userid){
										confirm = aObj.confirm;
									}
								});
								tag+='<div class="myPage_HouseAndMate_Popup_OneBlock">';
								tag+='<div class="myPage_HouseAndMate_Popup_Img">';
								tag+='<a href=""><img alt="" src="/home/matePic/'+obj.matePic1+'" onerror="this.src=\'/home/img/comm/no_mate_pic.png\'"/></a></div>';
								tag+='<ul class="myPage_HouseAndMate_Popup_Info">';
								if(obj.gender==1){ gender = '여성'; }
								else if(obj.gender==2){ gender = '남성';}
								tag+='<li><span class="s_title">'+obj.userid+'</span><span class="s_title">'+gender+'</span><span class="s_title">'+obj.age+'세</span></li>';
								tag+='<li>';
								if(obj.aList[0] != null && obj.aList[0] != ''){ tag += obj.aList[0]; }
								if(obj.aList[1] != null && obj.aList[1] != ''){ tag += ' | '+ obj.aList[1]; }
								if(obj.aList[2] != null && obj.aList[2] != ''){ tag += ' | '+ obj.aList[2]; }
								tag+='</li>';
								tag+='<li>보증금 : '+obj.deposit+'만원 | 월세 : '+obj.rent+'만원</li></ul>';
								tag+='<div class="myPage_HouseAndMate_Popup_Btn">';
								tag+='<input type="hidden" name="userid" value="'+obj.userid+'" />';
								if(msg == 'takeApply'){
									if(confirm=='미승인'){
										tag+='<a href="#" class="b_btn green applyInviteApprove">신청승인</a>';
										tag+='<a href="#" class="b_btn green applyInviteCancel">신청거절</a>';
									}else if(confirm =='승인'){
										tag +='<p>수락 완료</p>'
										tag +='<p>채팅방이 활성화 되었습니다</p>';
									}
								}else if(msg=='sendInvite'){	
									if(confirm=='미승인'){
										tag+='<a href="#" class="b_btn green applyInviteCancel">초대취소</a>';
									}else if(confirm =='승인'){
										tag +='<p>수락 완료</p>';
										tag +='<p>채팅방이 활성화 되었습니다</p>';
									}
										
								}
								tag+='</div></div>';
							});
							$('.myPage_HouseAndMate_Popup').children().eq(1).html(tag);
							$('.myPage_HouseAndMate_Popup').removeClass("popup_hidden");
							$('#myPage_popup_FullScreen').removeClass('popup_hidden');
							$('body').addClass('popup_Stop_Scroll');
						}
					}else if(result.pop_hwVO!=null){
						if(msg=='takeInvite' || msg=='sendApply'){
							//받은 초대 (리턴값 house정보 리스트)  //보낸 신청 (리턴값 house정보 리스트)
							//1. 팝업 내용 초기화 
							$('.myPage_HouseAndMate_Popup').children().eq(1).empty();
							//2. 타이틀 내용 변경. 
							if(msg == 'takeInvite'){
								$('.myPage_HouseAndMate_Popup_Title').html('받은 초대<span class="popup_Close">✕</span>');
							}else if(msg=='sendApply'){
								$('.myPage_HouseAndMate_Popup_Title').html('보낸 신청<span class="popup_Close">✕</span>');
							}
							tag+='<input type="hidden" name="msg" value="'+msg+'" />';	
							tag+='<input type="hidden" name="userid" value="'+userid+'" />';	
							//3. 반복문돌려서 tag 만들어 넣기. 
							$hwVOList.each(function(idx,obj){
								var confirm = '';
								$aiList.each(function(aIdx, aObj){
									if(obj.no == aObj.no){
										confirm = aObj.confirm;
									}
								});
								tag+='<div class="myPage_HouseAndMate_Popup_OneBlock">';
								tag+='<div class="myPage_HouseAndMate_Popup_Img">';
								tag+='<a href=""><img src="/home/housePic/'+obj.housepic1+'" onerror="this.src=\'/home/img/comm/no_house_pic.png\'"/></a></div>';
								tag+='<ul class="myPage_HouseAndMate_Popup_Info">';
								tag+='<li><span class="s_title">'+obj.housename+'</span></li>';
								tag+='<li>'+obj.addr+'</li>';
								tag+='<li>보증금 : '+obj.deposit+'만원 | 월세 : '+obj.rent+'만원</li></ul>';
								tag+='<div class="myPage_HouseAndMate_Popup_Btn">';
								tag+='<input type="hidden" name="no" value="'+obj.no+'" />';						
								if(msg == 'takeInvite'){
									if(confirm=='미승인'){
										tag+='<a href="#" class="b_btn green applyInviteApprove">초대승인</a>';
										tag+='<a href="#" class="b_btn green applyInviteCancel">초대거절</a>';
									}else if(confirm =='승인'){
										tag +='<p>승인완료</p>'
										tag +='<p>채팅방이 활성화 되었습니다</p>';
									}
								}else if(msg=='sendApply'){
									if(confirm=='미승인'){
										tag+='<a href="#" class="b_btn green applyInviteCancel">신청취소</a>';
									}else if(confirm =='승인'){
										tag +='<p>승인완료</p>';
										tag +='<p>채팅방이 활성화 되었습니다</p>';
									}
								}
								tag+='</div></div>';
							});
							$('.myPage_HouseAndMate_Popup').children().eq(1).html(tag);
							$('.myPage_HouseAndMate_Popup').removeClass("popup_hidden");
							$('#myPage_popup_FullScreen').removeClass('popup_hidden');
							$('body').addClass('popup_Stop_Scroll');
						}
					}else{
						if($(".myPage_HouseAndMate_Popup").hasClass('popup_hidden')){
							// 누르지 않은 상태. 
							var alertTag = '';
							if(msg == 'takeApply'){
								alertTag = '<p>받은신청이 없습니다</p>';
							}else if(msg=='sendInvite'){
								alertTag = '<p>보낸 초대가 없습니다</p>';
							}else if(msg=='takeInvite'){
								alertTag = '<p>받은 초대가 없습니다</p>';
							}else if(msg=='sendApply'){
								alertTag = '<p>보낸 신청이 없습니다</p>';
							}
							$('.alert_pop_Content').html(alertTag);
							$('.alert_pop').removeClass("popup_hidden");
							$('#myPage_popup_FullScreen').removeClass('popup_hidden');
							$('body').addClass('popup_Stop_Scroll');
						}else{
							//눌러놓은 상태 
							$('#myPage_popup_FullScreen').addClass('popup_hidden');
							$(".myPage_HouseAndMate_Popup").addClass('popup_hidden');
							$('body').removeClass('popup_Stop_Scroll');
						}
					}
				}, error : function(){
					console.log('마이페이지 팝업 데이터 불러오기 실패');
				}
			});
		}
		
		// house => 받은신청, 보낸초대  ///  mate => 받은초대, 보낸신청 
		$(document).on('click', '.mypage_Popup', function(){
			var no = $(this).parent().children().eq(0).val(); //해당 글 번호
			var msg = ''; 
			var userid = '<c:out value="${logId }"/>';
			// 하우스 기준.
			if($(this).hasClass("takeApply")){ // 받은 신청을 누른 경우
				msg = 'takeApply';
			}else if($(this).hasClass("sendInvite")){ // 보낸 초대를 누른경우
				msg='sendInvite';
			}// 메이트 기준 
			else if($(this).hasClass("takeInvite")){ // 받은 초대를 누른 경우
				msg='takeInvite';
			}else if($(this).hasClass("sendApply")){ // 보낸 신청을 누른경우
				msg='sendApply';
			}
			applyInviteList(no, msg, userid);
		});
	});
	function viewMyHouseAndMateList(msg){
		// msg = house, mate, likemark
		if(msg=='house'){
			$('.mypage_HouseList').addClass('on');
			$('.mypage_Mate').removeClass('on');
			$('.mypage_likeMarkList').removeClass('on');
			
			$('#myPage_HouseList').removeClass('objectHidden');
			$('#myPage_MateList').addClass('objectHidden');
			$('#myPage_LikeMarkerList').addClass('objectHidden');
		}else if(msg=='mate'){
			$('.mypage_HouseList').removeClass('on');
			$('.myPage_MateList').addClass('on');
			$('.mypage_likeMarkList').removeClass('on');
			
			$('#myPage_HouseList').addClass('objectHidden');
			$('#myPage_MateList').removeClass('objectHidden');
			$('#myPage_LikeMarkerList').addClass('objectHidden');
		}else if(msg=='likemark'){
			$('.mypage_HouseList').removeClass('on');
			$('.mypage_Mate').removeClass('on');
			$('.mypage_likeMarkList').addClass('on');
			
			$('#myPage_HouseList').addClass('objectHidden');
			$('#myPage_MateList').addClass('objectHidden');
			$('#myPage_LikeMarkerList').removeClass('objectHidden');
		}
	}
	
	</script>
	<div class="wrap">
		<section class="content" > <!-- id="myPage_HouseAndMate_Content" -->
			<p class="m_title">하우스&메이트 관리</p>
			<ul class="content_menu" id="myPage_HouseAndMate_menu">
			<c:choose>
				<c:when test="${msg=='house'}">
					<li><a href="javascript:viewMyHouseAndMateList('house')" class="mypage_HouseList on">쉐어하우스</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="javascript:viewMyHouseAndMateList('house')" class="mypage_HouseList">쉐어하우스</a></li>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${msg=='mate'}">
					<li><a href="javascript:viewMyHouseAndMateList('mate')" class="mypage_Mate on">하우스메이트</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="javascript:viewMyHouseAndMateList('mate')" class="mypage_Mate">하우스메이트</a></li>
				</c:otherwise>
			</c:choose>
				<li><a href="javascript:viewMyHouseAndMateList('likemark')" class="mypage_likeMarkList">찜목록</a></li>
			</ul>
			<!-- 쉐어 하우스 글을 작성했을 경우 및 클릭 시 -->
			<c:choose>
				<c:when test="${not empty hwList }">
					<div class="myHouseMateList <c:if test="${msg!='house' }">objectHidden</c:if>" id="myPage_HouseList">
					<c:forEach var="hwVO" items="${hwList }">
							<div class="myPage_HouseAndMate_oneBlock" >
								<div class="myPage_HouseAndMate_Img">
									<!-- 글내용보기로 이동시켜야함. -->
									<a href=""><img alt="" src="/home/housePic/${hwVO.housepic1 }" onerror="this.src='/home/img/comm/no_house_pic.png'"/></a>
								</div>
								<ul class="myPage_HouseAndMate_Info">
									<li>${hwVO.housename }</li>
									<li>보증금 : ${hwVO.deposit }만원 | 월세 : ${hwVO.rent }만원</li>
									<li>${hwVO.addr }</li>
									<li>
										<ul class="myPage_HouseAndMate_House">
											<li><p>${hwVO.room }</p></li>
											<li><p>${hwVO.bathroom }</p></li>
											<li><p>${hwVO.searchpeople }</p></li>
										</ul>
									</li>
								</ul>
								<div class="myPage_HouseAndMate_Btn">
									<input type="hidden" name="no" value="${hwVO.no }" />
									<a href="#" class="b_btn white takeApply mypage_Popup">받은신청</a>
									<a href="#" class="b_btn white sendInvite mypage_Popup">보낸초대</a>
									<a href="" class="b_btn white">수정</a>
									<a href="" class="b_btn white">삭제</a>
									<a href="" class="b_btn green">매칭완료</a>
								</div>
							</div>
					</c:forEach>
					</div>
				</c:when>
				<c:when test="${empty hwList}">
					<div class="myHouseMateList <c:if test="${msg!='house' }">objectHidden</c:if>" id="myPage_HouseList">
						<div class="myPage_HouseAndMate_oneBlock" >
							<ul class="myPage_HouseAndMate_empty">
								<li>쉐어하우스로 작성한 글이 없습니다.</li>
								<li>모집글을 작성해 주세요!</li>
							</ul>
						</div>
					</div>
				</c:when>
			</c:choose>
			<!-- 하우스메이트 글을 작성했을 경우 및 클릭시  -->
			<c:choose>
				<c:when test="${mwVO.no!=null }">
					<div class="myHouseMateList <c:if test="${msg=='house' }">objectHidden</c:if>" id="myPage_MateList">
						<div class="myPage_HouseAndMate_oneBlock" >
							<div class="myPage_HouseAndMate_Img">
								<a href=""><img alt="" src="/home/matePic/${mwVO.matePic1 }"/></a>
							</div>
							<ul class="myPage_HouseAndMate_Info">
								<li>${mwVO.userid }</li>
								<li>보증금 : ${mwVO.deposit }만원 | 월세 : ${mwVO.rent }만원</li>
								<li>
									<c:if test="${mwVO.area1 != null && mwVO.area1 != ''}">${mwVO.area1 } </c:if>
									<c:if test="${mwVO.area2 != null && mwVO.area2 != ''}">| ${mwVO.area2 } </c:if>
									<c:if test="${mwVO.area3 != null && mwVO.area3 != ''}">| ${mwVO.area3 } </c:if>
								</li>
								<li>
									<ul class="myPage_HouseAndMate_Mate">
										<li><p>
											<c:choose>
												<c:when test="${mwVO.gender == 1 }">여</c:when>
												<c:when test="${mwVO.gender == 2 }">남</c:when>
											</c:choose>
										</p></li>
										<li><p>${mwVO.age }세</p></li>
										<li><p>
											<c:choose>
												<c:when test="${mwVO.m_now == 1 }">즉시</c:when>
												<c:when test="${mwVO.m_now == 2 }">${mwVO.enterdate }</c:when>
											</c:choose>
										</p></li>
									</ul>
								</li>
							</ul>
							<div class="myPage_HouseAndMate_Btn">
								<input type="hidden" name="no" value="${mwVO.no }" />
								<a href="#" class="b_btn white takeInvite mypage_Popup">받은초대</a>
								<a href="#" class="b_btn white sendApply mypage_Popup">보낸신청</a>
								<a href="" class="b_btn white">수정</a>
								<a href="" class="b_btn white">삭제</a>
								<a href="" class="b_btn green">매칭완료</a>
							</div>
						</div>
					</div>
				</c:when>
				<c:when test="${mwVO.no==null}">
					<div class="myHouseMateList <c:if test="${msg!='mate' }">objectHidden</c:if>" id="myPage_MateList">
						<div class="myPage_HouseAndMate_oneBlock" >
							<ul class="myPage_HouseAndMate_empty">
								<li>하우스메이트로 작성한 글이 없습니다.</li>
								<li>모집글을 작성해 주세요 ! </li>
							</ul>
						</div>
					</div>
				</c:when>
			</c:choose>
			
			<!-- 찜목록  -->
			<div class="myHouseMateList objectHidden " id="myPage_LikeMarkerList">
				<c:if test="${not empty houseLikeList }">
					<c:forEach var="like_hwVO" items="${houseLikeList }">
					<div class="myPage_HouseAndMate_oneBlock" >
						<div class="myPage_HouseAndMate_Img">
							<div>매칭 <br /><span>89</span> %</div>
							<a href=""><img alt="" src="/home/housePic/${like_hwVO.housepic1 }"/></a>
						</div>
						<ul class="myPage_HouseAndMate_Info">
							<li>${like_hwVO.housename }</li>
							<li>보증금 : ${like_hwVO.deposit }만원 | 월세 : ${like_hwVO.rent }만원</li>
							<li>${like_hwVO.addr }</li>
							<li>
								<ul class="myPage_HouseAndMate_House">
									<li><p>${like_hwVO.room }</p></li>
									<li><p>${like_hwVO.bathroom }</p></li>
									<li><p>${like_hwVO.searchpeople }</p></li>
								</ul>
							</li>
						</ul>
						<div class="myPage_HouseAndMate_LikeMarker_Btn">
							<a href="" class="b_btn white">찜 삭제</a>
							<a href="" class="b_btn white">신청하기</a>
						</div>
					</div>
					</c:forEach>
				</c:if>
				<c:if test="${not empty mateLikeList }">
					<c:forEach var="like_mwVO" items="${mateLikeList }"></c:forEach>
					<div class="myPage_HouseAndMate_oneBlock">
						<div class="myPage_HouseAndMate_Img">
							<div>매칭 <br /><span>90</span> %</div>
							<a href=""><img alt="" src="/home/matePic/${like_mwVO.matePic1 }"/></a>
						</div>
						<ul class="myPage_HouseAndMate_Info">
							<li>${like_mwVO.userid }</li>
							<li>보증금 : ${like_mwVO.deposit }만원 | 월세 : ${like_mwVO.rent }만원</li>
							<li>
								<c:if test="${like_mwVO.area1 != null && like_mwVO.area1 != ''}">${mwlike_mwVOVO.area1 } </c:if>
								<c:if test="${like_mwVO.area2 != null && like_mwVO.area2 != ''}">| ${like_mwVO.area2 } </c:if>
								<c:if test="${like_mwVO.area3 != null && like_mwVO.area3 != ''}">| ${like_mwVO.area3 } </c:if>
							</li>
							<li>
								<ul class="myPage_HouseAndMate_Mate">
									<li><p>
										<c:choose>
											<c:when test="${like_mwVO.gender == 1 }">여</c:when>
											<c:when test="${like_mwVO.gender == 2 }">남</c:when>
										</c:choose>
									</p></li>
									<li><p>${like_mwVO.age }세</p></li>
									<li><p>
										<c:choose>
											<c:when test="${like_mwVO.m_now == 1 }">즉시</c:when>
											<c:when test="${like_mwVO.m_now == 2 }">${mwVO.enterdate }</c:when>
										</c:choose>
									</p></li>
								</ul>
							</li>
						</ul>
						<div class="myPage_HouseAndMate_LikeMarker_Btn">
							<a href="" class="b_btn white">찜 삭제</a>
							<a href="" class="b_btn white">초대하기</a>
						</div>
					</div>
				</c:if>
				<c:if test="${empty houseLikeList && empty mateLikeList}">
					<div class="myHouseMateList <c:if test="${msg=='likemark' }">objectHidden</c:if>" id="mypage_likeMarkList">
						<div class="myPage_HouseAndMate_oneBlock" >
							<ul class="myPage_HouseAndMate_empty">
								<li>찜목록이 비어있습니다. </li>
								<li>마음에 드는 모집글에 찜버튼을 눌러주세요 !</li>
							</ul>
						</div>
					</div>
				</c:if>
			</div>
		</section>
		<!-- alert 대신 사용할 팝업 -->
		<div class="alert_pop popup_hidden">
			<div class="alert_pop_Title"><span class="popup_Close">✕</span></div>
			<div class="alert_pop_Content">
			</div>
			<div class="alert_pop_footer">
				<p class="b_btn white popup_Close" >닫기</p>
			</div>
		</div>
		<!--팝업-->
		<div class="myPage_HouseAndMate_Popup popup_hidden">
			<div class="myPage_HouseAndMate_Popup_Title" >받은신청<span class="popup_Close">✕</span></div>
			<div class="myPage_HouseAndMate_Popup_Content">
				
			</div>
			<div class="myPage_HouseAndMate_Popup_footer">
				<p class="b_btn white popup_Close" >닫기</p>
			</div>
		</div>
	</div>	
	<div class="myPage_HouseAndMate_Popup_FullScreen popup_Close popup_hidden" id="myPage_popup_FullScreen"></div>
	