<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
	$(document).ready(function(){
		var p_body = document.body.innerHTML;
		window.onbeforeprint = function(){
			document.body.innerHTML = document.getElementById('admin_Management_popup_Allprint').innerHTML;	
		}
		window.onafterprint = function(){
			document.body.innerHTML = p_body;
			window.open('','_self').close(); 
		}
		window.print();
	});

</script>
	<div class="table-responsive, managementList" id="admin_Management_popup_Allprint">
		<c:if test="${msg=='mate' }">
		<table class="table table-hover table-sm table-bordered"  >
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
			<c:forEach var="mateVO" items="${mwList }">
				<tr class="admin_HouseManagement_DetailInfo">
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
		</c:if>
		<c:if test="${msg=='house' }">
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
				<c:forEach var="houseVO" items="${hwList }">
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
		</c:if>
		<c:if test="${msg=='pay' }">
		<table class="table table-hover table-sm table-bordered">
			<thead class="thead-light">
				<tr class="orderConditionTable">
					<th>결제번호</th>
					<th>아이디</th>
					<th>이름</th>
					<th>결제일</th>
					<th>결제종료일</th>
					<th>결제방법</th>
					<th>등급</th>
					<th>환불</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="vo" items="${payList}">
				<tr class="admin_List_table">
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
		</c:if>
		<c:if test="${msg=='sales' }">
		<table class="table table-hover table-sm table-bordered">
			<thead class="thead-light">
				<tr class="orderConditionTable">
					<th>날짜</th>
					<th>총매출액</th>
					<th>카드</th>
					<th>현금</th>
					<th>결제건수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="vo" items="${salesList }">
				<tr id="adminSalesManagementList">
					<td>${vo.payStart }</td>
					<fmt:formatNumber var="amount" value="${vo.amount }" />
					<td>${amount}</td>
					<fmt:formatNumber var="amountCard" value="${vo.amountCard }" />
					<td>${amountCard}</td>
					<fmt:formatNumber var="amountCash" value="${vo.amountCash }" />
					<td>${amountCash }</td>
					<fmt:formatNumber var="amountNum" type="number" value="${vo.amount/15000 }" />
					<td>${amountNum }</td>
				</tr>
				</c:forEach>
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
			</tbody>
		</table>
		</c:if>
	</div>
</body>
</html>