<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<section class="admin_Section">
			<div class="admin_Content">
				<div class="m_title managementTitle">메이트 관리</div>
				<form method="post" action="/home/admin/mateManagement" class="managementSearchForm">
					<div class="management_houseSearch">
						<div class="management_houseSelect management_houseStateSelect">
							<span class="managementSpan3">글 개제 상태</span>
								<select name="matestate" id="matestate" class="custom-select">
								<option value="" selected>전체</option>
								<option value="모집중">모집중</option>
								<option value="매칭완료">매칭완료</option>
								<option value="기간만료">기간만료</option>
								<option value="비공개">비공개</option>
							</select>
							<span class="managementSpan3">멤버십 상태</span>
							<select name="grade" id="grade" class="custom-select">
								<option value="0" selected>전체</option>
								<option value="1">일반</option>
								<option value="2">프리미엄</option>
							</select>
						</div>
						<div class="managementSearch">
							<select name="searchKey" class="custom-select">
								<option value="userid" selected>아이디</option>
								<option value="area">희망지역</option>
							</select>
							<input type="text" name="searchWord" class="form-control"/>
							<input type="submit" value="Search" class="btn btn-custom"/>
						</div>
					</div>
					
				</form>
				<div class="table-responsive, managementList">
					<table class="table table-hover table-sm table-bordered">
						<thead class="thead-light">
							<tr>
								<th>No.</th>
								<th>이름</th>
								<th>아이디</th>
								<th>희망지역</th>
								<th>등급</th>
								<th>신고누적수</th>
								<th>글 개제 상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="mateVO" items="${mateWriteList }">
							<tr>
								<td>${mateVO.no }</td>
								<td>${mateVO.username }</td>
								<td>${mateVO.userid }</td>
								<td>${mateVO.aList[0] } <c:if test="${mateVO.aList[1]!=null }"> / ${mateVO.aList[1] }</c:if><c:if test="${mateVO.aList[2]!=null }"> / ${mateVO.aList[2] }</c:if>  </td>
								<td><c:if test="${mateVO.grade==1}">일반</c:if><c:if test="${mateVO.grade==2}">프리미엄</c:if></td>
								<td>${mateVO.reportNum }</td>
								<td>${mateVO.matestate }</td>
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
		<div class="admin_Management_popup">
			<div class="admin_Management_popup_head">메이트 관리 상세 정보</div>
				<div class="admin_Management_popup_body">
					<div class="admin_Management_popup_title"> [userid] 님의 메이트 게재 정보</div>
					<ul class="admin_Management_popup_table">
						<li class="admin_Management_popup_table_title" style="padding-left: 20px;">메이트 정보</li>
						<li>
							<ul class="admin_Management_popup_table_inner1">
								<li>이름</li>
								<li>도동개</li>
							</ul>
							<ul class="admin_Management_popup_table_inner0">
								<li>등급</li>
								<li>프리미엄</li>
								<li>신고수</li>
								<li>0 건</li>
							</ul>
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
							<ul class="admin_Management_popup_table_inner0">
								<li>이메일</li>
								<li>do_dong7H@gamil.com</li>
								<li>연락처</li>
								<li>010-0000-1111</li>
							</ul>
							<ul class="admin_Management_popup_table_inner2">
								<li>선택한 성향</li>
								<li>성격 : 외향적</li>
								<li>애완동물 : 긍정적</li>
								<li>흡연여부 : 흡연</li>
								<li>나이대 : 상관없음</li>
								<li>성별 : 여성전용</li>
								<li>외국인 여부 : 가능</li>
							</ul>
						</li>
						<li class="admin_Management_popup_table_title" style="padding-left: 20px;">희망하는 하우스 정보 </li>
						<li>
							<ul class="admin_Management_popup_table_inner1">
								<li>희망 지역</li>
								<li>마포구 아현동 / 마포구 공덕동</li>
							</ul>
							<ul class="admin_Management_popup_table_inner0">
								<li>희망 보증금</li>
								<li>3,000,000 원 이하</li>
								<li>희망 월세</li>
								<li>300,000 원 이하</li>
							</ul>
							<ul class="admin_Management_popup_table_inner0">
								<li>룸 인원</li>
								<li>1인실</li>
								<li>입주가능일</li>
								<li>2021-5-10 이후 </li>
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
								<li style="width: 84%;">원하는 가구 목록 뽑아내얋...</li>
							</ul>
						</li>
						<li class="admin_Management_popup_table_title" style="padding-left: 20px;">희망하는 하우스 성향</li>
						<li>
							<ul class="admin_Management_popup_table_inner2">
								<li>생활</li>
								<li>생활소음 : 조용하지않음</li>
								<li>생활시간 : 주행성</li>
								<li>흡연 : 실외흡연</li>
								<li style="width: 42%;">하우스 내 애완동물 여부 : 있음</li>
								<li style="width: 42%;">애완동물 동반입실(거주) 여부 : 가능</li>
							</ul>
							<ul class="admin_Management_popup_table_inner2">
								<li>소통</li>
								<li>분위기 : 화목함</li>
								<li>소통방식 : 대화</li>
								<li>모임 빈도 : 가끔</li>
								<li>모임 참가 의무 : 없음</li>
							</ul>
							<ul class="admin_Management_popup_table_inner1">
								<li>지원 서비스</li>
								<li>공용공간 청소 지원 : O</li>
								<li>공용 생필품 지원 : O</li>
								<li>기본 식품 지원 : O</li>
							</ul>
							<ul class="admin_Management_popup_table_inner1">
								<li>기타</li>
								<li>보증금 조절 가능 여부 : O</li>
								<li>즉시입주 가능 여부 : O</li>
							</ul>
						</li>
						<li class="admin_Management_popup_table_title" style="padding-left: 20px;">메이트 사진</li>
						<li class="admin_Management_popup_table_img">
							사진들어가는 자리 ~
						</li>
					</ul>
				</div>
				<div class="admin_Management_popup_table_btn">
					<a href="" class="btn btn-custom">수정</a> <a href="" class="btn btn-custom">닫기</a>
				</div>
			</div>
	</body>
</html>