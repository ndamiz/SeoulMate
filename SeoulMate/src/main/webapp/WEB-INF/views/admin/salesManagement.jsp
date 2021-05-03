<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
$(function(){
	datePicker();
});
</script>
		<section class="admin_Section">
			<div class="admin_Content">
				<div class="m_title managementTitle">매출 관리</div>
				<form method="post" action="/home/admin/salesManagement" >
					<div id="salesManagementDiv">
						<div class="managementDatePicker" id="salesDatePicker">
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
							<div>
								<input type="submit" value="Search" class="btn btn-custom"/>
							</div>
							<div id="salesGrapeBtn">
								<input type="button" value="엑셀로 출력" id="excelBtn" class="btn btn-custom"/>
								<input type="image" class="btn btn-custom" id="graphBtn" src="<%=request.getContextPath()%>/img/fi-rr-stats.svg" alt="그래프 버튼"/>
							</div>
						</div>
					</div>
				</form>
				<div class="table-responsive, managementList">
					<table class="table table-hover table-sm table-bordered, managementTable" id="salesmanagementTable">
						<thead class="thead-light">
							<tr>
								<th>날짜</th>
								<th>총매출액</th>
								<th>카드</th>
								<th>현금</th>
								<th>결제건수</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>총 계</td>
								<fmt:formatNumber var="totalAmount" value="${totalVO.amount}" />
								<td>${totalAmount }</td>
								<fmt:formatNumber var="totalAmountCard" value="${totalVO.amountCard}" />
								<td>${totalAmountCard }</td>
								<fmt:formatNumber var="totalAmountCash" value="${totalVO.amountCash}" />
								<td>${totalAmountCash }</td>
								<fmt:formatNumber var="totalAmountNum" value="${totalVO.amount/15000 }" />
								<td>${totalAmountNum }</td>
							</tr>
							<c:forEach var="vo" items="${salesList }">
							<tr>
								<td>${vo.payStart }</td>
								<fmt:formatNumber var="amount" value="${vo.amount }" />
								<td><c:out value="${amount}" /></td>
								<fmt:formatNumber var="amountCard" value="${vo.amountCard }" />
								<td>${amountCard}</td>
								<fmt:formatNumber var="amountCash" value="${vo.amountCash }" />
								<td>${amountCash }</td>
								<fmt:formatNumber var="amountNum" type="number" value="${vo.amount/15000 }" />
								<td>${amountNum }</td>
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
						<c:forEach var="pageNum" begin="${pagingVO.startPageNum }" end="${pagingVO.startPageNum+pagingVO.onePageNum-1 }">
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