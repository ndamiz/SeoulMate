<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<section>
			<div class="m_title managementTitle">문의 관리</div>
			<form method="post" action="/home/admin/houseManagement" class="managementSearchForm">
				<div class="qnaSearch">
					<select name="searchKey" class="custom-select">
						<option selected>전체</option>
						<option>쉐어하우스</option>
						<option>하우스메이트</option>
						<option>커뮤니티</option>
						<option>프리미엄 결제</option>
						<option>기타</option>
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
							<th>카테고리</th>
							<th>아이디</th>
							<th>이름</th>
							<th>이메일</th>
							<th>상태</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>쉐어하우스</td>
							<td>tiger1234</td>
							<td>윤민</td>
							<td>yunyun@gmail.com</td>
							<td>답변완료</td>
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