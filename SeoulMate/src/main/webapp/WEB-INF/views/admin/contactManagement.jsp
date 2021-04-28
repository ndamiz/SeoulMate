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
<!-- 팝업창*********************************************** -->
		<div class="contact_wrap">
			<div class="contact_form report_form ">
				<div class="report_head">문의 관리</div>
				<div class="report_body">
					<div class="contact_list">
						<ul>
							<li><div>아이디</div><input type="text" name="userid"></li>
							<li><div>연락처</div><input type="text" name=""></li>
						</ul>
						<ul>	
							<li><div>답변상태</div>
								<select id="contactState">
									<option>미답변</option>
									<option>답변완료</option>
								</select>
							</li>
							<li><div>이메일</div><input type="text" name="email"></li>
						</ul>
						<ul>	
							<li><div id="divGap">문의 종류</div> <input type="text" name="reportcategory"> </li>
							<li><div>문의 날짜</div> <input type="text" name="qdate"> </li>
						</ul>
						<ul>	
							<li><div>제목</div><input type="text" name="" id="contactTitle"></li>
						</ul>	
						<ul>	
							<li><div>문의 내용</div> <textarea rows="5" name="qContent"></textarea></li>
							<li><div>답변 내용</div> <textarea rows="5" name="aContent"></textarea></li>
						</ul>
						답변 날짜 : 2021-04-30
					</div>
				</div>
				<div class="report_bottom">
					<a href="" class="btn_cancel">닫기</a>
					<a href="" class="btn_save">확인</a>
					<a href="" class="btn_reply">답변하기</a>
				</div>
				<a href="" class="report_btn_close">닫기</a>
			</div>
		</div>
	</body>
</html>