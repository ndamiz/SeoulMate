<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<script>
		$(function(){
			datePicker();
		});
	</script>
		<section>
			<div class="m_title managementTitle">결제 관리</div>
			<div class="managementSearchForm">
				<div class="managementDatePicker">
					<div class="checks dateChoose">
						<span class="managementSpan2">필터</span>
						<input type="radio" name="date" id="salesDate1" value="일별" checked/>
						<label for="salesDate1">일별</label>
						<input type="radio" name="date" id="salesDate2" value="월별"/>
						<label for="salesDate2">월별</label>
						<input type="radio" name="date" id="salesDate3" value="년별"/>
						<label  for="salesDate3">년별</label>
					</div>
					<div>
						<span class="managementSpan2">기간</span>
						<input type="text" name="payStart" class="datePicker1" readonly="readonly" /> ~
						<input type="text" name="payEnd" class="datePicker2" readonly="readonly" />
					</div>
				</div>
				<div class="managementSearch" id="payManagementSearch">
					<select name="searchKey" id="searchKey" class="custom-select">
						<option value="userid" selected>아이디</option>
						<option value="addr">이름</option>
					</select>
					<input type="text" name="searchWord" class="form-control"/>
					<input type="submit" value="Search" class="btn btn-custom"/>
				</div>
				<input type="button" value="엑셀로 출력" id="excelBtn"class="btn btn-custom"/>
			</div>	
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
				<ul class="pagination justify-content-center managementPaging">
					<li class="page-item"><a href="" class="page-link">Prev</a></li>
					<li class="page-item"><a href="" class="page-link">1</a></li>
					<li class="page-item"><a href="" class="page-link">2</a></li>
					<li class="page-item"><a href="" class="page-link">3</a></li>
					<li class="page-item"><a href="" class="page-link">4</a></li>
					<li class="page-item"><a href="" class="page-link">5</a></li>
					<li class="page-item"><a href="" class="page-link">Next</a></li>
				</ul>
			</div>
		</section>
		
	</body>
</html>