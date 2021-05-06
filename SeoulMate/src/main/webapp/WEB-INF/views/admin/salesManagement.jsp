<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
$(function(){
	datePicker();
	
	//전체 리스트 출력 , paging 
	function salesManagementList(){
		var url = "/home/admin/salesManagementList";
		var data = $("form[name=salesManagementForm]").serialize() ;
		$.ajax({
			url : url,
			data : data,
			success : function(result){
				// pagingVO, payList, total 끌어옴.. 
				var $payList = $(result.payList);
				var $pagingVO = $(result.pagingVO);
				//생성되어있는 자식 태그 지우기  (목록)
				$('#adminManagementTable>tbody').empty();
				// 총계 목록 생성 
				var tag = "";
				tag+= '<tr><td>총계</td>';
				tag+= '<td>'+result.total.amount.toLocaleString('ko-KR')+'</td>';
				tag+= '<td>'+result.total.amountCard.toLocaleString('ko-KR')+'</td>';
				tag+= '<td>'+result.total.amountCash.toLocaleString('ko-KR')+'</td>';
				tag+= '<td>'+(result.total.amount)/15000+'</td></tr>';
				// 기본 리스트 
				$payList.each(function(idx, obj){
					tag += '<tr class="admin_List_table">';
					tag += '<td>'+obj.payStart+'</td>';
					tag += '<td>'+(obj.amount).toLocaleString("ko-KR")+'</td>';
					tag += '<td>'+(obj.amountCard).toLocaleString("ko-KR")+'</td>';
					tag += '<td>'+(obj.amountCash).toLocaleString("ko-KR")+'</td>';
					tag += '<td>'+obj.amount/15000+'</td>';
				});
				$('#adminManagementTable>tbody').html(tag);
				
				// 페이징 새로 
				$('#adminPayManagementPaging').empty();
				var pagingTag ="";
				var cnt = 1;
				if(result.pagingVO.pageNum >1){
					pagingTag += '<a href="javascript:pageClick("first_page")" class="first_page"></a>';
					pagingTag += '<a href="javascript:pageClick("prev_page")"  class="prev_page"></a>';
				}else if(result.pagingVO.pageNum ==1){
					pagingTag += '<a href="#" class="first_page"></a>';
					pagingTag += '<a href="#" class="prev_page"></a>';
				}
				$pagingVO.each(function(idx, obj){
					if(idx<=obj.totalPage ){
						if(idx==obj.pageNum ){
							pagingTag += '<a href="javascript:pageClick("'+cnt+'")">'+cnt+'</a>';
						}else if(idx!=obj.pageNum){
							pagingTag += '<a href="javascript:pageClick("'+cnt+'")">'+cnt+'</a>';
						}
					}
					cnt++;
				});
				if(result.pagingVO.pageNum < result.pagingVO.totalPage ){
					pagingTag += '<a href="javascript:pageClick("next_page")" class="next_page"></a>';
					pagingTag += '<a href="javascript:pageClick("last_page")" class="last_page"></a>';
				}else if(result.pagingVO.pageNum == result.pagingVO.totalPage){
					pagingTag += '<a href="#" class="next_page"></a>';
					pagingTag += '<a href="#" class="last_page"></a>';
				}
				$('#adminPayManagementPaging').html(pagingTag);
				
				$('#adminPayManagementPaging').children('a').each(function(){
					if( $(this).text() == result.pagingVO.pageNum){
						$(this).addClass('nowPageNum');
					}
				});
			}, error :function(){
				console.log("sales 리스트 데이터가져오기 에러 ");
			}
		});
	}
	// 날짜, 총매출액, 결제건수 오름차순, 내림차순 클릭 시
	$('.orderConditionTable>th').on('click', function(){
		$(".orderConditionTable>th>span:first-of-type").addClass('objectHidden');
		$(".orderConditionTable>th>span:last-of-type").addClass("objectHidden");
		
		if($(this).text().indexOf('날짜') != -1){
			if($('input[name=orderCondition]').val()=='payStart'){
				$(this).children().eq(0).removeClass('objectHidden');
				$('input[name=orderUpDown]').attr('value','asc');
			}else{
				$(this).children().eq(1).removeClass('objectHidden');
				$('input[name=orderCondition]').attr('value','payStart');
				$('input[name=orderUpDown]').attr('value','desc');
			}
		}
		if($(this).text().indexOf('총매출액') != -1){
			if($('input[name=orderCondition]').val()=='amount'){
				$(this).children().eq(0).removeClass('objectHidden');
				$('input[name=orderUpDown]').attr('value','asc');
			}else{
				$(this).children().eq(1).removeClass('objectHidden');
				$('input[name=orderCondition]').attr('value','amount');
				$('input[name=orderUpDown]').attr('value','desc');
			}
		}
		if($(this).text().indexOf('결제종료일') != -1){
			if($('input[name=orderCondition]').val()=='payEnd'){
				$(this).children().eq(0).removeClass('objectHidden');
				$('input[name=orderUpDown]').attr('value','asc');
			}else{
				$(this).children().eq(1).removeClass('objectHidden');
				$('input[name=orderCondition]').attr('value','payEnd');
				$('input[name=orderUpDown]').attr('value','desc');
			}
		}
		salesManagementList();
	});
	$('form[name=salesManagementForm]').on('click', function(){
		salesManagementList();
	});
});
</script>
		<section class="admin_Section">
			<div class="admin_Content">
				<div class="m_title managementTitle">매출 관리</div>
				<form method="post" name="salesManagementForm">
					<input type="hidden" name="orderCondition" value="payStart"/>
					<input type="hidden" name="orderUpDown" value="desc"/>
					<div id="salesManagementDiv">
						<div class="managementDatePicker" id="salesDatePicker">
							<div class="dateChoose">
								<span class="managementSpan3">기간 선택</span>
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
					<table class="table table-hover table-sm table-bordered, managementTable" id="adminManagementTable">
						<thead class="thead-light">
							<tr class="orderConditionTable">
								<th style="cursor:pointer;">날짜<span class="arrowUp objectHidden">▲</span><span class="arrowDown objectHidden">▼</span></th>
								<th style="cursor:pointer;">총매출액<span class="arrowUp objectHidden">▲</span><span class="arrowDown objectHidden">▼</span></th>
								<th>카드</th>
								<th>현금</th>
								<th style="cursor:pointer;">결제건수<span class="arrowUp objectHidden">▲</span><span class="arrowDown objectHidden">▼</span></th>
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
							<tr id="adminSalesManagementList">
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
					<div class="paging" id="adminPayManagementPaging">
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