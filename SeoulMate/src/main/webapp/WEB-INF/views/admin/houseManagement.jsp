<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
$(function(){
	$('.admin_HouseManagement_DetailInfo').on('click', function(){
		var no = $(this).children().eq(0).text();
		var userid = $(this).children().eq(1).text();
		var housename = $(this).children().eq(2).text();
		// 데이터 받은것 json형식으로 보내서 받아오기. 
		var data = {"no" :no, "userid":userid, "housename":housename};
		$.ajax({
			url : "home/admin/houseDetailInfo",
			type : get,
			data : data,
			success : function(result){
				
			}, error :function(){
				console.log(" houseDetailInfo 데이터가져오기 에러 ");
			}
		});
		
		
		
		//팝업 보이도록 클래스 삭제. 
		$('.admin_Management_popup').removeClass('popup_hidden');
	});
	
});
function managementPopupClose(){
	$('.admin_Management_popup').addClass('popup_hidden');
}
</script>
		<section class="admin_Section">
			<div class="admin_Content">
				<div class="m_title managementTitle">하우스 관리</div>
				<form method="post" action="/home/admin/houseManagement" class="managementSearchForm">
					<div class="management_houseSearch">
						<div class="management_houseSelect management_houseStateSelect">
							<span class="managementSpan">글 개제 상태</span>
							<select name="housestate" id="housestate" class="custom-select">
								<option value="" selected>전체</option>
								<option value="모집중">모집중</option>
								<option value="매칭 완료">매칭 완료</option>
								<option value="기간 만료">기간 만료</option>
								<option value="비공개">비공개</option>
							</select>
							<span class="managementSpan">멤버십 상태</span>
							<select name="grade" id="grade" class="custom-select">
								<option value="0" selected>전체</option>
								<option value="1">일반</option>
								<option value="2">프리미엄</option>
							</select>
						</div>
						<div class="managementSearch">
							<select name="searchKey" class="custom-select">
								<option value="userid" selected>아이디</option>
								<option value="housename" >하우스이름</option>
								<option value="addr">주소</option>
							</select>
							<input type="text" name="searchWord" class="form-control"/>
							<input type="submit" value="Search" class="btn btn-custom"/>
						</div>
					</div>
				</form>
				<div class="table-responsive, managementList">
					<table class="table table-hover table-sm table-bordered">
						<colgroup>
							<col width="5%">
							<col width="15%">
							<col width="20%">
							<col width="30%">
							<col width="10%">
							<col width="10%">
							<col width="15%">
						</colgroup>
						<thead class="thead-light">
							<tr>
								<th>No.</th>
								<th>아이디</th>
								<th>하우스이름</th>
								<th>주소</th>
								<th>등급</th>
								<th>신고수</th>
								<th>글 개제 상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="houseVO" items="${houseWriteList }">
							<tr class="admin_HouseManagement_DetailInfo" >
								<td>${houseVO.no }</td>
								<td>${houseVO.userid }</td>
								<td>${houseVO.housename }</td>
								<td>${houseVO.addr }</td>
								<td><c:if test="${houseVO.grade==1}">일반</c:if><c:if test="${houseVO.grade==2}">프리미엄</c:if></td>
								<td>${houseVO.reportNum }</td>
								<td>${houseVO.housestate }</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="paging">
						<c:if test="${pagingVO.pageNum>1 }">
							<a href="javascript:pageClick('first_page')" class="first_page"></a>
							<a href="javascript:pageClick('prev_page')"  class="prev_page"></a>
						</c:if>
						<c:if test="${pagingVO.pageNum==1 }">
							<a href="#" class="first_page"></a>
							<a href="#"  class="prev_page"></a>
						</c:if>
						<c:forEach var="pageNum" begin="${pagingVO.startPageNum }" end="${pagingVO.startPageNum + pagingVO.onePageNum-1 }">
							<c:if test="${pageNum<=pagingVO.totalPage }">
								<c:if test="${pageNum==pagingVO.pageNum }">
									<a href="javascript:pageClick('${pageNum }')" class="nowPageNum">${pageNum }</a>
								</c:if>
								<c:if test="${pageNum!=pagingVO.pageNum }">
									<a href="javascript:pageClick('${pageNum }')">${pageNum }</a>
								</c:if>
							</c:if>
						</c:forEach>
						<c:if test="${pagingVO.pageNum < pagingVO.totalPage }">
							<a href="javascript:pageClick('next_page')" class="next_page"></a>
							<a href="javascript:pageClick('last_page')" class="last_page"></a>
						</c:if>
						<c:if test="${pagingVO.pageNum == pagingVO.totalPage }">
							<a href="#" class="next_page"></a>
							<a href="#" class="last_page"></a>
						</c:if>
					</div>
				</div>
			</div>
		</section>
			<!-- popup   -->
		<div class="admin_Management_popup popup_hidden">
			<div class="admin_Management_popup_head">하우스 관리 상세 정보</div>
				<div class="admin_Management_popup_body">
					<div class="admin_Management_popup_title"> [userid] 님의 하우스 포동포동</div>
					<ul class="admin_Management_popup_table">
						<li class="admin_Management_popup_table_title" style="padding-left: 20px;">하우스 성향</li>
						<li>
							<ul class="admin_Management_popup_table_inner0">
								<li>게재 기간</li>
								<li>2021-05-01 ~ 2021-05-14</li>
								<li>상태</li>
								<li>
									<select name="housestate" class="custom-select" style="height: 28px; padding: 2px 10px; vertical-align: top; margin-top: 1px;">
										<option value="모집중" selected>모집중</option>
										<option value="매칭 완료">매칭 완료</option>
										<option value="기간 만료">기간 만료</option>
										<option value="비공개">비공개</option>
									</select>
								</li>
							</ul>
							<ul class="admin_Management_popup_table_inner1">
								<li>주소</li>
								<li style="width: 84%;">서울시 마포구 아현동 134-32번지 포동빌라 2층</li>
							</ul>
							<ul class="admin_Management_popup_table_inner0">
								<li>등급</li>
								<li>프리미엄</li>
								<li>신고수</li>
								<li>0건</li>
							</ul>
							<ul class="admin_Management_popup_table_inner1">
								<li>룸 기본 정보</li>
								<li style="width: 21%;">총 방 개수 : 3</li>
								<li style="width: 21%;">총 욕실 수 : 2</li>
								<li style="width: 21%;">현재 인원 : 2</li>
								<li style="width: 21%;">찾는 인원 : 1</li>
							</ul>
							<ul class="admin_Management_popup_table_inner0">
								<li>공용시설</li>
								<li>거실, 주방, 에어컨, 세탁기, ... </li>
							</ul>
							<ul class="admin_Management_popup_table_inner2">
								<li>생활</li>
								<li>생활소음 : 조용하지않음</li>
								<li>생활시간 : 주행성</li>
								<li>흡연 : 실외흡연</li>
								<li style="width: 42%;">하우스 내 애완동물 여부 : 있음</li>
								<li style="width: 42%;">애완동물 동반입실(거주) 여부 : 가능</li>
							</ul>
						</li>
						<li>
							<ul class="admin_Management_popup_table_inner2">
								<li>소통</li>
								<li>분위기 : 화목함</li>
								<li>소통방식 : 대화</li>
								<li>모임 빈도 : 가끔</li>
								<li>모임 참가 의무 : 없음</li>
							</ul>
						</li>
						<li>
							<ul class="admin_Management_popup_table_inner1">
								<li>지원 서비스</li>
								<li>공용공간 청소 지원 : O</li>
								<li>공용 생필품 지원 : O</li>
								<li>기본 식품 지원 : O</li>
							</ul>
						</li>
						<li>
							<ul class="admin_Management_popup_table_inner1">
								<li>기타</li>
								<li>보증금 조절 가능 여부 : O</li>
								<li>즉시입주 가능 여부 : O</li>
							</ul>
						</li>
						<li class="admin_Management_popup_table_title" style="padding-left: 20px;">룸 상세 정보</li>
						<li>
							<ul class="admin_Management_popup_table_inner0">
								<li>방이름</li>
								<li>포동1호 룸</li>
								<li>입주가능일</li>
								<li>2021-5-1 </li>
							</ul>
							<ul class="admin_Management_popup_table_inner0">
								<li>보증금 / 월세</li>
								<li>3,000,000 원 / 250,000원</li>
								<li>총 방인원</li>
								<li>2인</li>
							</ul>
							<ul class="admin_Management_popup_table_inner0">
								<li>최소거주기간</li>
								<li>4-6 개월</li>
								<li>최대거주기간</li>
								<li>1년 이상</li>
							</ul>
							<ul class="admin_Management_popup_table_inner2">
								<li>가구</li>
								<li style="width: 84%; border-bottom: 1px solid #dee2e6;">있음</li>
								<li style="width: 84%;">포함된 가구 목록 뽑아내얋...</li>
							</ul>
						</li>
						<li class="admin_Management_popup_table_title" style="padding-left: 20px;">희망하는 메이트의 성향</li>
						<li>
							<ul class="admin_Management_popup_table_inner3">
								<li>생활시간 : 주행성</li>
								<li>나이 : 20~30대</li>
								<li>성별 : 여성</li>
								<li>외국인 여부 : 가능</li>
								<li>즉시입주 : 가능</li>
							</ul>
						</li>
						<li class="admin_Management_popup_table_title" style="padding-left: 20px;">룸 사진</li>
						<li class="admin_Management_popup_table_img">
							사진들어가는 자리 ~
						</li>
					</ul>
				</div>
				<div class="admin_Management_popup_table_btn">
					<a href="" class="btn btn-custom">수정</a> <a href="javascript:managementPopupClose()" class="btn btn-custom">닫기</a>
				</div>
			</div>
	</body>
</html>