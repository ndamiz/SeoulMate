<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	// 테이블의 행 클릭 시 팝업 이벤트
	$(function(){
		$("#tableMain>tr").click(function(){
			$("#memberInfo").css("display", "block");
			$(document.body).css("overflow","hidden");
			$('.pup_body').scrollTop(0);
			var selectId=$(this).children().eq(1).text(); // 선택한 행의 userid
			
			var url="/home/admin/memberInfo";
			var params="userid="+selectId;
			$.ajax({
				url:url,
				data:params,
				success:function(data){
					var info=[data.userid, data.userpwd, data.username, data.birth, data.tel, data.email, data.reportCnt, data.state];
					
					$("#profileImg").attr('src', "/home/profilePic/"+data.profilePic);
					$("#delFile").attr('value', data.profilePic);
					for(var i=1; i<=7; i++){
						$("ul>li").eq(i).children('input').attr('value', info[i-1]);	
					}
					
					if(data.state=='블랙'){
						$("ul>li").eq(8).children('.toggle_cont').children('input[name=state]').prop('checked', true);
					}else{
						$("ul>li").eq(8).children('.toggle_cont').children('input[name=state]').prop('checked', false);
					}
					
				}, error:function(){
					console.log("회원 관리에서 회원 정보 가져오기 실패");
				}
			});
		});
		// 팝업창 닫기 이벤트
		$(".pup_btn_close, .btn_cancel").click(function(){
			pupClose();
		});
		
		$("#InfoSaveBtn").click(function(){
			if($("#infoReportCnt").val()==""){
				alert("신고 누적 수는 공백일 수 없습니다.");
				$("#infoReportCnt").focus();
				
				return false;
			}
			// 신고 누적 수 정규식 표현
			var regCnt=/^[0-9]$/;
			if(!regCnt.test(document.getElementById("infoReportCnt").value)){
				alert("신고 누적 수는 숫자만 입력할 수 있습니다.");
				return false;
			}
		});
		
		// 프로필 사진
		$("#profilePic").on('change', function(){
			$("#delFile").attr('name', 'delFile');
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
	function pupClose(){
		$("#memberInfo").css("display", "none");
		$(document.body).css("overflow","visible");
		for(var i=1; i<=7; i++){
			$("ul>li").eq(i).children().eq(1).attr("value","");
		}
		$("ul>li").eq(8).children('.toggle_cont').children('input[name=state]').prop('checked', false);
	}
</script>
	<section>
		<div class="m_title managementTitle">회원 관리</div>
		<form method="post" action="/home/admin/memberManagement" class="managementSearchForm">
			<div class="memberRadio">
				<div class="checks">
					<span class="managementSpan">등급</span>
					<input type="radio" name="grade" id="memberGrade1" checked/>
					<label for="memberGrade1">전체</label>
					<input type="radio" name="grade" id="memberGrade2"/>
					<label for="memberGrade2">일반</label>
					<input type="radio" name="grade" id="memberGrade3"/>
					<label for="memberGrade3">프리미엄</label>
				</div>
				<div class="checks">
					<span class="managementSpan">상태</span>
					<input type="radio" name="state" id="memberState1" checked/>
					<label for="memberState1">전체</label>
					<input type="radio" name="state" id="memberState2"/>
					<label for="memberState2">일반</label>
					<input type="radio" name="state" id="memberState3"/>
					<label for="memberState3">블랙리스트</label>
					<input type="radio" name="state" id="memberState4"/>
					<label for="memberState4">탈퇴</label>
				</div>
			</div>
			<div class="managementSearch">
				<select name="searchKey" class="custom-select">
					<option value="userid">아이디</option>
					<option value="username">이름</option>
					<option value="tel">연락처</option>
					<option value="email">이메일</option>
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
							<td><c:if test="${vo.grade==1}">일반</c:if><c:if test="${vo.grade==2}">프리미엄</c:if></td>
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
	<div class="pup_wrap" id="memberInfo">
		<div class="pup_form">
			<div class="pup_head">회원 정보</div>
			<form method="post" id="memInfoForm" action="memInfoSave" enctype="multipart/form-data">
				<div class="pup_body">
					<div class="pup_list">
							<ul>
								<li class="pup_long"><div>프로필 사진</div>
									<img class="profile_img" id="profileImg" name="profileImg" src="" alt="upload image"/>
									<input id="delFile" type="hidden" name="" value=""/>
									<input class="profile_input profile_left" type="file" accept="image/*" name="filename" id="profilePic" />
								</li>
								<li><div>아이디</div><input type="text" name="userid" id="infoId" value="" readonly/></li>
								<li><div>비밀번호</div><input type="text" name="userpwd" id="infoPwd" value="" readonly/></li>
								<li><div>이름</div><input type="text" name="username" id="infoName" value="" readonly/></li>
								<li><div>생년월일</div><input type="text" name="birth" id="infoBirth" value="" readonly/></li>
								<li><div>연락처</div><input type="text" name="tel" id="infoTel" value="" readonly/></li>
								<li><div>email</div><input type="text" name="email" id="infoEmail" value="" readonly/></li>
								<li><div>신고 누적 수</div><input type="text" name="reportCnt" id="infoReportCnt" value=""/></li>
								<li><div>블랙리스트</div>
									<div class="toggle_cont">
										<input id="infoState" class="cmn_toggle cmn_toggle_round" type="checkbox" name="state">
										<label for="infoState"></label>
									</div><br>
								</li>
							</ul>
						
					</div>
				</div>
				<div class="pup_bottom">
					<a class="btn_cancel">닫기</a>
					<button class="btn_save" id="InfoSaveBtn">수정</button>
				</div>
			</form>
			<a class="pup_btn_close">닫기</a>
		</div>
	</div>
</body>
</html>