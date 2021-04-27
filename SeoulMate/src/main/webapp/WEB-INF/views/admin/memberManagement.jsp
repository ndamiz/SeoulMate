<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	$(function(){
		// 프로필 사진
		$("#profilePic").on('change', function(){
			readURL(this);
		});
		
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function (e) {
					$('#profileImg').attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
	});
</script>
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
					<c:forEach var="vo" items="${list}">
						<tr>
							<td>${vo.no}</td>
							<td>${vo.userid}</td>
							<td>${vo.username}</td>
							<td>${vo.tel}</td>
							<td>${vo.email}</td>
							<td>${vo.grade}</td>
							<td>${vo.reportCnt}</td>
							<td><c:if test="${vo.state=='일반'}">일반</c:if><c:if test="${vo.state=='블랙'}">블랙리스트</c:if><c:if test="${vo.state=='탈퇴'}">탈퇴</c:if></td>
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
	<!--  팝업창///////////////////////////////////////////// -->
<div class="pup_wrap">
	<div class="pup_form">
		<div class="pup_head">회원 정보</div>
		<div class="pup_body">
			<div class="pup_list">
				<ul>
					<li class="pup_long"><div>프로필 사진</div>
						<img class="profile_img" id="profileImg" name="profileImg" src="/home/img/choi/pepe_1.png" alt="upload image"/>
						<img class="remove_icon" src="/home/img/choi/fi-rr-trash.svg"/><br/>
						<input class="profile_input profile_left" type="file" accept="image/*" name="profilePic1" id="profilePic" />
					</li>
					<li><div>아이디</div><input type="text" name="userid" value=""></li>
					<li><div>비밀번호</div><input type="text" name="userpwd" value=""></li>
					<li><div>이름</div><input type="text" name="username" value=""></li>
					<li><div>생년월일</div><input type="text" name="birth" value=""></li>
					<li><div>연락처</div><input type="text" name="tel" value=""></li>
					<li><div>email</div><input type="text" name="email" value=""></li>
					<li><div>신고 누적 수</div><input type="text" name="reportCnt" value=""></li>
					<li><div>블랙리스트</div>
						<div class="toggle_cont">
							<input id="toggle_2" class="cmn_toggle cmn_toggle_round" type="checkbox" name="blacklist">
							<label for="toggle_2"></label>
						</div><br>
					</li>
				</ul>
			</div>
		</div>
		<div class="pup_bottom">
			<a href="" class="btn_cancel">닫기</a>
			<a href="" class="btn_save">확인</a>
			<a href="" class="btn_del">삭제</a>
		</div>
		<a href="" class="pup_btn_close">닫기</a>
	</div>
</div>
</body>
</html>