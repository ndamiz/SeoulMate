<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<section>
	<div class="m_title managementTitle">회원 관리</div>
	<form method="post" action="/home/admin/memberManagement" class="managementSearchForm">
		<div class="memberSearch">
			<select name="grade" class="custom-select">
				<option value="">전체</option>
				<option value="1">일반</option>
				<option value="2">프리미엄</option>
			</select>
			<select name="state" class="custom-select input">
				<option value="">전체</option>
				<option value="1">화이트리스트</option>
				<option value="2">블랙리스트</option>
				<option value="3">탈퇴</option>
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
					<th>이름</th>
					<th>연락처</th>
					<th>이메일</th>
					<th>등급</th>
					<th>신고 누적 수</th>
					<th>블랙리스트</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="i" begin="1" end="9" step="1">
					<tr>
						<td>${i }</td>
						<td>${i }${i }${i }${i }${i }${i }${i }</td>
						<td>${i }${i }${i }${i }${i }</td>
						<td>${i }${i }${i }${i }</td>
						<td>${i }</td>
						<td>${i }${i }${i }${i }</td>
						<td>${i }${i }${i }</td>
						<td><c:if test="${i==6||i==3}">Y</c:if><c:if test="${i==6||i==3}">Y</c:if></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="paging">
			<a class="first_page" href=""></a>
			<a class="prev_page" href=""></a>
			<a class="on" href="">1</a>
			<a class="" href="">2</a>
			<a class="" href="">3</a>
			<a class="" href="">4</a>
			<a class="next_page" href=""></a>
			<a class="last_page" href=""></a>
		</div>
	</div>
	
	
</section>
	</body>
</html>