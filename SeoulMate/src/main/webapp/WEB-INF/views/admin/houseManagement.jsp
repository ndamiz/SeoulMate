<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
							<col width="5%">
							<col width="10%">
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
							<tr>
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
	</body>
</html>