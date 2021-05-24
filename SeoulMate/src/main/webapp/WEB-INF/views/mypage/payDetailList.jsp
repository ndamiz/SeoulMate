<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/hyun.css">
<div class="wrap">
	<div class="content">
		<p class="m_title">결제 내역 확인</p>
		<form action="/home/payDetailList" method="post" id="payForm">
			<input type="hidden" name="pageNum" id="hiddenPageNum" />
			<select id="payYearSelect">
				<option value="0" selected>전체목록</option>
				<c:forEach var="year" items="${payList }">
				<option value="${fn:substring(year.payStart, 0, 4) }">${fn:substring(year.payStart, 0, 4) }년</option>
				</c:forEach>
			</select>
		</form>
		<table class="tb" id="payDetailTable">
			<caption>결제내역</caption>
			<thead>
				<tr>
					<th>결제일</th>
					<th>서비스기간</th>
					<th>결제수단</th>
					<th>금액</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="pVO" items="${payList }">
				<tr>
					<td>${fn:substring(pVO.payStart, 0, 10) }</td>
					<td>${fn:substring(pVO.payStart, 0, 10) } ~ ${fn:substring(pVO.payEnd, 0, 10) }</td>
					<td>
					<c:choose>
						<c:when test="${pVO.payMethod == 'card'}">카드결제</c:when>
						<c:when test="${pVO.payMethod == 'point'}">포인트결제</c:when>
						<c:otherwise>그 외 결제</c:otherwise>
					</c:choose>
					</td>
					<fmt:formatNumber var="amount" value="${pVO.amount}" />
					<td>₩ ${amount }</td>
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
						<a href="javascript:pageClick('${pageNum }')" class="pageBtn">${pageNum }</a>
					</c:if>
				</c:if>
			</c:forEach>
			<c:if test="${pagingVO.pageNum < pagingVO.totalPage }">
				<a href="javascript:pageClick('next_page')" class="next_page pageBtn"></a>
				<a href="javascript:pageClick('last_page')" class="last_page pageBtn"></a>
			</c:if>
			<c:if test="${pagingVO.pageNum == pagingVO.totalPage }">
				<a href="#" class="next_page"></a>
				<a href="#" class="last_page"></a>
			</c:if>
		</div>
	</div>
</div>
<script>
//페이징
function pageClick(msg){
	var pageNum = '<c:out value="${pagingVO.pageNum }"/>';  //현재 눌려있는 페이지
	var startPageNum = '<c:out value="${pagingVO.startPageNum }"/>'; // 페이징 시작 페이지
	var totalPage = '<c:out value="${pagingVO.totalPage }"/>'; //마지막 페이징
	var changePageNum = 0;
	if(msg=='next_page'){
		changePageNum = Number(pageNum)+1;
	}else if(msg=='last_page'){
		changePageNum = Number(totalPage);
	}else if(msg=='first_page'){
		changePageNum = 1;
	}else if(msg=='prev_page'){
		changePageNum = Number(pageNum)-1;
	}else{
		changePageNum = Number(msg);
	}
	// 히든에 값넣고
	$('#hiddenPageNum').val(changePageNum);
	// 서브밋 실행 
	$('#payForm').submit();
}
</script>