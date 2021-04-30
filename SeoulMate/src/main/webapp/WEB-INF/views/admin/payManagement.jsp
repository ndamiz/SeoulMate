<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<script>
		$(function(){
			datePicker();
		});
	</script>
		<section>
			<div class="m_title managementTitle">결제 관리</div>
			<form method="post" action="/home/admin/payManagement" >
				<div class="managementSearchForm">
					<div class="managementDatePicker">
						<div class="checks dateChoose">
							<span class="managementSpan2">필터</span>
							<input type="radio" name="selectYearMonthDate" id="payDate1" value="일별" checked/>
							<label for="payDate1">일별</label>
							<input type="radio" name="selectYearMonthDate" id="payDate2" value="월별"/>
							<label for="payDate2">월별</label>
							<input type="radio" name="selectYearMonthDate" id="payDate3" value="년별"/>
							<label  for="payDate3">년별</label>
						</div>
						<div>
							<span class="managementSpan2">기간</span>
							<input type="text" name="selectStartDate" class="datePicker1" readonly="readonly" /> ~
							<input type="text" name="selectEndDate" class="datePicker2" readonly="readonly" />
						</div>
					</div>
					<div class="managementSearch" id="payManagementSearch">
						<select name="searchKey" id="searchKey" class="custom-select">
							<option value="userid" selected>아이디</option>
							<option value="username">이름</option>
						</select>
						<input type="text" name="searchWord" class="form-control"/>
						<input type="submit" value="Search" class="btn btn-custom"/>
					</div>
					<input type="button" value="엑셀로 출력" id="excelBtn"class="btn btn-custom"/>
				</div>	
			</form>
			<div class="table-responsive, managementList">
				<table class="table table-hover table-sm table-bordered, managementTable">
					<thead class="thead-light">
						<tr>
							<th>날짜</th>
							<th>아이디</th>
							<th>이름</th>
							<th>결제일</th>
							<th>결제종료일</th>
							<th>결제방</th>
							<th>등급</th>
							<th>환불</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="i" begin="1" end="10" step="1">
						<tr>
							<td>${i }</td>
							<td>${i }${i }${i }${i }${i }${i }</td>
							<td>${i }${i }${i }${i }${i }${i }</td>
							<td>${i }${i }${i }${i }${i }${i }${i }${i }${i }${i }</td>
							<td>${i }${i }${i }${i }${i }${i }${i }${i }${i }${i }</td>
							<td>${i }${i }${i }</td>
							<td>${i }${i }</td>
							<td><input type="button" value="환불" class="btn btn-outline-secondary btn-sm"/></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="paging">
					<a href="/home/admin/payManagement?nowPageNum=1" class="first_page"></a>
					<a href=""  class="prev_page"></a>
					<a href="/home/admin/payManagement?nowPageNum=1" >1</a>
					<a href="/home/admin/payManagement?nowPageNum=2">2</a>
					<a href="/home/admin/payManagement?nowPageNum=3">3</a>
					<a href="/home/admin/payManagement?nowPageNum=4">4</a>
					<a href="" class="next_page"></a>
					<a href="" class="last_page"></a>
				</div>
			</div>
		</section>
		
	</body>
</html>