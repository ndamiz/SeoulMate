<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<section>
			<div class="m_title managementTitle">하우스 관리</div>
			<form method="post" action="/home/admin/houseManagement" class="managementSearchForm">
				<div class="managementRadio">
					<div class="checks">
						<span class="managementSpan">상태</span>
						<input type="radio" name="housestate" id="houseWriteState1" checked/>
						<label for="houseWriteState1" >전체</label>
						<input type="radio" name="housestate" id="houseWriteState2"/>
						<label  for="houseWriteState2">모집중</label>
						<input type="radio" name="housestate" id="houseWriteState3"/>
						<label for="houseWriteState3">매칭완료</label>
						<input type="radio" name="housestate" id="houseWriteState4"/>
						<label for="houseWriteState4">기간만료</label>
						<input type="radio" name="housestate" id="houseWriteState5"/>
						<label for="houseWriteState5">비공개</label>
					</div>
					<div class="checks">
						<span class="managementSpan">일반/프리미엄</span>
						<input type="radio" name="state" id="houseMemberState1" checked/>
						<label for="houseMemberState1">전체</label>
						<input type="radio" name="state" id="houseMemberState2"/>
						<label for="houseMemberState2">일반</label>
						<input type="radio" name="state" id="houseMemberState3"/>
						<label for="houseMemberState3">프리미엄</label>
					</div>
				</div>
				<div class="managementSearch">
					<select name="searchKey" class="custom-select">
						<option value="userid" selected>아이디</option>
						<option value="addr">주소</option>
					</select>
					<input type="text" name="searchWord" class="form-control"/>
					<input type="submit" value="Search" class="btn btn-custom"/>
				</div>
			</form>
			<div class="table-responsive, managementList">
				<table class="table table-hover table-sm table-bordered">
					<thead class="thead-light">
						<tr>
							<th>No.</th>
							<th>아이디</th>
							<th>주소</th>
							<th>등급</th>
							<th>신고 누적 수</th>
							<th>상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="i" begin="1" end="15" step="1">
						<tr>
							<td>${i }</td>
							<td>${i }${i }${i }${i }${i }${i }${i }${i }${i }${i }</td>
							<td>${i }${i }${i }${i }${i }${i }${i }${i }${i }${i }${i }${i }${i }${i }${i }${i }${i }</td>
							<td>${i }${i }${i }${i }</td>
							<td>${i }</td>
							<td>${i }${i }${i }${i }</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="paging">
					<a href="" class="first_page"></a>
					<a href="" class="prev_page"></a>
					<a href="">1</a>
					<a href="">2</a>
					<a href="">3</a>
					<a href="">4</a>
					<a href="" class="next_page"></a>
					<a href="" class="last_page"></a>
				</div>
			</div>
			
			
		</section>
	</body>
</html>