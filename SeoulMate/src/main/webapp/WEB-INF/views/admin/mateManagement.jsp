<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<section class="admin_Section">
			<div class="admin_Content">
				<div class="m_title managementTitle">메이트 관리</div>
				<form method="post" action="/home/admin/mateManagement" class="managementSearchForm">
					<div class="management_houseSearch">
						<div class="management_houseSelect management_houseStateSelect">
							<span class="managementSpan">글 개제 상태</span>
								<select name="matestate" id="matestate" class="custom-select">
								<option value="" selected>전체</option>
								<option value="모집중">모집중</option>
								<option value="매칭완료">매칭완료</option>
								<option value="기간만료">기간만료</option>
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
	</body>
</html>