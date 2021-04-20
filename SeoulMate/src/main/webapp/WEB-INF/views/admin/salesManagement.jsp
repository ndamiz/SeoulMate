<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
$(function(){
	datePicker();
	
});
</script>
		<section>
			<div class="m_title managementTitle">매출 관리</div>
			<div class="managementDatePicker">
				<div class="checks" id="salesDateChoose">
					<span class="managementSpan">필터</span>
					<input type="radio" name="date" id="salesDate1" value="일별" checked/>
					<label for="salesDate1">일별</label>
					<input type="radio" name="date" id="salesDate2" value="월별"/>
					<label for="salesDate2">월별</label>
					<input type="radio" name="date" id="salesDate3" value="년별"/>
					<label  for="salesDate3">년별</label>
				</div>
				<div>
					<span class="managementSpan">기간</span>
					<input type="text" name="payStart" id="datePicker1" readonly="readonly" /> ~
					<input type="text" name="payEnd" id="datePicker2" readonly="readonly" />
				</div>
			</div>
			<div id="salesManagementList" class="table-responsive, managementList">
				<table class="table table-hover table-sm table-bordered">
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
						<c:forEach var="i" begin="1" end="15" step="1">
						<tr>
							<td>${i }${i }${i }${i }${i }${i }${i }${i }</td>
							<td>${i }${i }${i }${i }${i }${i }</td>
							<td>${i }${i }${i }${i }</td>
							<td>${i }${i }${i }${i }</td>
							<td>${i }${i }${i }${i }${i }</td>
						</tr>
						</c:forEach>
						<tr>
							<td>총 계</td>
							<td>00000000</td>
							<td>000건</td>
							<td>000건</td>
							<td>000건</td>
						</tr>
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