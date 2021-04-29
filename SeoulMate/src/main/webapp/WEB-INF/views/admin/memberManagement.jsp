<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	$(function(){
		$("#tableMain>tr").click(function(){
			$("#memberInfo").css("display", "block");
			var selectId=$(this).children().eq(1).text(); // 선택한 행의 userid
			console.log(selectId);
			
			var url="/home/admin/memberInfo";
			var params="userid="+selectId;
			$.ajax({
				url:url,
				data:params,
				success:function(info){
					var userid="<input type='text' name='userid' value='"+info.userid+"'>";
					var userpwd="<input type='text' name='userpwd' value='"+info.userpwd+"'>";
					var username="<input type='text' name='username' value='"+info.username+"'>";
					var birth="<input type='text' name='birth' value='"+info.birth+"'>";
					var tel="<input type='text' name='tel' value='"+info.tel+"'>";
					var email="<input type='text' name='email' value='"+info.email+"'>";
					var reportCnt="<input type='text' name='reportCnt' value='"+info.reportCnt+"'>";
					
					var info=[userid, userpwd, username, birth, tel, email, reportCnt];
					
					for(var i=1; i<=7; i++){
						$("ul>li").eq(i).append(info[i-1]);	
					}
				}, error:function(){
					console.log("회원 관리에서 회원 정보 가져오기 실패");
				}
			});
		});
		
		$(".pup_btn_close, .btn_cancel").click(function(){
			$("#memberInfo").css("display", "none");
			for(var i=1; i<=7; i++){
				$("ul>li").eq(i).children().eq(1).remove();
			}
		});
		
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
			<table class="table table-hover table-sm table-bordered" id="memberTable">
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
				<tbody id="tableMain">
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
				<a class="prev_page" href=""></a>
				<a class="on" href="">1</a>
				<a class="" href="">2</a>
				<a class="" href="">3</a>
				<a class="" href="">4</a>
				<a class="" href="">5</a>
				<a class="next_page" href=""></a>
			</div>
		</div>
	</section>
	<!--  팝업창///////////////////////////////////////////// -->
<div class="pup_wrap" id="memberInfo">
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
					<li><div>아이디</div></li>
					<li><div>비밀번호</div></li>
					<li><div>이름</div></li>
					<li><div>생년월일</div></li>
					<li><div>연락처</div></li>
					<li><div>email</div></li>
					<li><div>신고 누적 수</div></li>
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
			<a class="btn_cancel">닫기</a>
			<a class="btn_save">확인</a>
			<a class="btn_del">삭제</a>
		</div>
		<a class="pup_btn_close">닫기</a>
	</div>
</div>
</body>
</html>