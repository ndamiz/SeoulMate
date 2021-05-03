<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<script>
		$(function(){
			datePicker();
		});
		function pageClick(pageStr){
			console.log('pageClick 으로 왔는가 ~ ' +pageStr);
		}
	</script>
		<section class="admin_Section">
			<div class="admin_Content">
				<div class="m_title managementTitle">결제 관리</div>
				<form method="post" action="/home/admin/payManagement" >
					<div class="managementSearchForm">
						<div class="managementSearch" id="payManagementSearch">
							<select name="searchKey" id="searchKey" class="custom-select">
								<option value="userid" selected>아이디</option>
								<option value="username">이름</option>
							</select>
							<input type="text" name="searchWord" class="form-control"/>
							<input type="submit" value="Search" class="btn btn-custom"/>
							<div class="managementDatePicker" id="payManageMentDatePicker">
							<div class="dateChoose">
								<span class="managementSpan">기간 선택</span>
								<select name="selectYearMonthDate" id="selectYearMonthDate" class="custom-select">
									<option value="일별" selected>일별</option>
									<option value="월별">월별</option>
									<option value="년별">년별</option>
								</select>
							</div>
							<div>
								<input type="text" name="selectStartDate" class="datePicker1" readonly="readonly" /> ~
								<input type="text" name="selectEndDate" class="datePicker2" readonly="readonly" />
							</div>
						</div>
						<div>
							<input type="button" value="엑셀로 출력" id="excelBtn"class="btn btn-custom"/>
						</div>
					</div>	
					</div>	
				</form>
				<div class="table-responsive, managementList">
					<table class="table table-hover table-sm table-bordered, managementTable">
						<thead class="thead-light">
							<tr class="orderCondition">
								<th>결제번호<span class="arrowDown">▼</span><span class="arrowUp objectHidden">▲</span></th>
								<th>아이디</th>
								<th>이름</th>
								<th>결제일<span class="arrowDown">▼</span><span class="arrowUp objectHidden">▲</span></th>
								<th>결제종료일<span class="arrowDown">▼</span><span class="arrowUp objectHidden">▲</span></th>
								<th>결제방법</th>
								<th>등급</th>
								<th>환불</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="vo" items="${payList}">
							<tr>
								<td>${vo.no }</td>
								<td>${vo.userid }</td>
								<td>${vo.username }</td>
								<td>${vo.payStart }</td>
								<td>${vo.payEnd }</td>
								<td>${vo.payMethod }</td>
								<td><c:if test="${vo.grade==1}">일반</c:if><c:if test="${vo.grade==2}">프리미엄</c:if></td>
								<td><input type="button" value="환불" class="btn btn-outline-secondary btn-sm"/></td>
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