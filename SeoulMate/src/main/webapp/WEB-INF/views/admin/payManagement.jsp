<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
.nowPageNum{background-color: #ddd;}
</style>
	<script>
		$(function(){
			datePicker();
			//전체 리스트 출력 , paging 
			function payManagementList(){
				var url = "/home/admin/payManagementList";
				var data = $("form[name=payManagementForm]").serialize();
				$.ajax({
					url : url,
					data : data,
					success : function(result){
						var $result = $(result);
						var $payVO = $(result.payVO);
						var $pagingVO = $(result.pagingVO);
						//생성되어있는 자식 태그 지우기  (목록)
						$('#adminPayManagementTable>tbody').empty();
						//새로목록 생성 
						var tag = "";
						$payVO.each(function(idx, obj){
							tag += '<tr class="admin_List_table">';
							tag += '<td>'+obj.no+'</td>';
							tag += '<td>'+obj.userid+'</td>';
							tag += '<td>'+obj.username+'</td>';
							tag += '<td>'+obj.payStart+'</td>';
							tag += '<td>'+obj.payEnd+'</td>';
							tag += '<td>'+obj.payMethod+'</td>';
							if(obj.grade==1){
								tag += '<td>일반</td>';
							}else if(obj.grade==2){
								tag += '<td>프리미엄</td>';
							}
							tag += '<td><input type="button" value="환불" class="btn btn-outline-secondary btn-sm"/></td></tr>';
							
							
						});
						$('#adminPayManagementTable>tbody').html(tag);
						
						// 페이징 새로 
						$('#adminPayManagementPaging').empty();
						var pagingTag ="";
						var cnt = 1;
						if(result.pagingVO.pageNum >1){
							pagingTag += '<a href="javascript:pageClick("first_page")" class="first_page"></a>';
							pagingTag += '<a href="javascript:pageClick("prev_page")"  class="prev_page"></a>';
						}else if(result.pagingVO.pageNum ==1){
							pagingTag += '<a href="#" class="first_page"></a>';
							pagingTag += '<a href="#"  class="prev_page"></a>';
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
						console.log("pay 리스트  데이터가져오기 에러 ");
					}
				});
			}
			// 결제번호,결제일, 결제종료일 오름차순, 내림차순 클릭 시
			$('.orderConditionTable>th').on('click', function(){
				$(".orderConditionTable>th>span:first-of-type").addClass('objectHidden');
				$(".orderConditionTable>th>span:last-of-type").addClass("objectHidden");
				
				if($(this).text().indexOf('결제번호') != -1){
					if($('input[name=orderCondition]').val()=='no'){
						$(this).children().eq(0).removeClass('objectHidden');
						$('input[name=orderUpDown]').attr('value','asc');
					}else{
						$(this).children().eq(1).removeClass('objectHidden');
						$('input[name=orderCondition]').attr('value','no');
						$('input[name=orderUpDown]').attr('value','desc');
					}
				}
				if($(this).text().indexOf('결제일') != -1){
					if($('input[name=orderCondition]').val()=='payStart'){
						$(this).children().eq(0).removeClass('objectHidden');
						$('input[name=orderUpDown]').attr('value','asc');
					}else{
						$(this).children().eq(1).removeClass('objectHidden');
						$('input[name=orderCondition]').attr('value','payStart');
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
				payManagementList();
			});
			$('form[name=payManagementForm]').on('click', function(){
				payManagementList();
			});
		});
		function pageClick(pageStr){
			console.log('pageClick 으로 왔는가 ~ ' +pageStr);
		}
	</script>
		<section class="admin_Section">
			<div class="admin_Content">
				<div class="m_title managementTitle">결제 관리</div>
				<form method="post" action="/home/admin/payManagement" name="payManagementForm">
					<input type="hidden" name="orderCondition" value="no"/>
					<input type="hidden" name="orderUpDown" value="desc"/>
					<div class="managementSearchForm">
						<div class="managementSearch" id="payManagementSearch">
							<div class="managementDatePicker" id="payManageMentDatePicker">
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
							</div>
							<select name="searchKey" id="searchKey" class="custom-select">
								<option value="userid" selected>아이디</option>
								<option value="username">이름</option>
							</select>
							<input type="text" name="searchWord" class="form-control"/>
							<input type="submit" value="Search" class="btn btn-custom"/>
							<div>
								<input type="button" value="엑셀로 출력" id="excelBtn"class="btn btn-custom"/>
							</div>
						</div>	
					</div>	
				</form>
				<div class="table-responsive, managementList">
					<table class="table table-hover table-sm table-bordered, managementTable" id="adminPayManagementTable">
						<thead class="thead-light">
							<tr class="orderConditionTable">
								<th style="cursor:pointer;">결제번호<span class="arrowUp objectHidden">▲</span><span class="arrowDown objectHidden">▼</span></th>
								<th>아이디</th>
								<th>이름</th>
								<th style="cursor:pointer;">결제일<span class="arrowUp objectHidden">▲</span><span class="arrowDown objectHidden">▼</span></th>
								<th style="cursor:pointer;">결제종료일<span class="arrowUp objectHidden">▲</span><span class="arrowDown objectHidden">▼</span></th>
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
					<div class="paging" id="adminPayManagementPaging">
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