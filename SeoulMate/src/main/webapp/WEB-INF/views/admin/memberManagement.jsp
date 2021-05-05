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
		// 이름 고치려했던거 알려줌
		$("#infoName").change(function(){
			var afterName=document.getElementById("infoName").value;
			$(document.getElementById("infoName")).css('backgroundColor','#F0F0F0');
		});
		
		// 연락처 고치려했던거 알려줌
		$("#infoTel").change(function(){
			var afterName=document.getElementById("infoTel").value;
			$(document.getElementById("infoTel")).css('backgroundColor','#F0F0F0');
		});
		
		// 이메일 고치려했던거 알려줌
		$("#infoEmail").change(function(){
			var afterName=document.getElementById("infoEmail").value;
			$(document.getElementById("infoEmail")).css('backgroundColor','#F0F0F0');
		});
		
		// 신고 누적 수 고치려했던거 알려줌
		$("#infoReportCnt").change(function(){
			var afterName=document.getElementById("infoReportCnt").value;
			$(document.getElementById("infoReportCnt")).css('backgroundColor','#F0F0F0');
		});
		
		// 팝업창 닫기 이벤트
		$(".pup_btn_close, .btn_cancel").click(function(){
			pupClose();
		});
		
		$("#InfoSaveBtn").click(function(){
			// 이름 정규식 표현
			var regName=/^[가-힣]{2,4}$/;
			if(!regName.test(document.getElementById("infoName").value)){
				$("#infoName").focus();
				alert("이름은 한글 2~4자리여야 합니다.");
				return false;
			}
			
			// 연락처 정규식 표현
			var regTel=/(010|02|031|032|033|041|042|043|051|052|053|061|062|063)[-][0-9]{3,4}[-][0-9]{4}/;
			if(!regTel.test(document.getElementById("infoTel").value)){
				$("#infoTel").focus();
				alert("전화번호 형식에 맞게 입력해주세요");
				return false;
			}
			
			// 이메일 정규식 표현
			var regEmail=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			if(!regEmail.test(document.getElementById("infoEmail").value)){
				$("#infoEmail").focus();
				alert("이메일을 잘못 입력하셨습니다.");
				return false;
			}
			
			// 신고 누적 수 정규식 표현
			var regCnt=/^[0-9]$/;
			if(!regCnt.test(document.getElementById("infoReportCnt").value)){
				$("#infoReportCnt").focus();
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
		// 팝업창을 닫으면서 수정하려했던 input들의 배경색을 다시 원래대로 되돌림
		$(document.getElementById("infoName")).css('backgroundColor', '');
		$(document.getElementById("infoTel")).css('backgroundColor', '');
		$(document.getElementById("infoEmail")).css('backgroundColor', '');
		$(document.getElementById("infoReportCnt")).css('backgroundColor', '');
	}
	function pageClick(page, searchKey, searchWord){
		var f=document.go;
		f.pageNum.value=page; // post 방식을 넘길 값
		f.searchKey.value=searchKey; // post 방식을 넘길 값
		f.searchWord.value=searchWord; // post 방식을 넘길 값
		f.action="/home/admin/memberManagement"; // 이동할 페이지
		f.method="post"; // post 방식
		f.submit();
	}
	function boardDel(pageNum, searchKey, searchWord){
		alert(pageNum+", "+searchKey+", "+searchWord);
		if(confirm("삭제하시겠습니까?")){
			return false;
		}
	}
</script>
	<section>
		<div class="m_title managementTitle">회원 관리</div>
		<form method="post" action="/home/admin/memberManagement" class="managementSearchForm">
			<div class="management_memberSearch">
				<div class="management_memberSelect">
					<span class="managementSpan" id="gradeSpan">등급</span>
					<select name="grade" id="member_grade" class="custom-select">
						<option value="0" selected>전체</option>						
						<option value="1">일반</option>						
						<option value="2">프리미엄</option>						
					</select>
					<span class="managementSpan" id="stateSpan">상태</span>
					<select name="state" id="member_state" class="custom-select">
						<option value="" selected>전체</option>						
						<option value="일반">일반</option>						
						<option value="블랙">블랙리스트</option>						
						<option value="탈퇴">탈퇴</option>						
					</select>
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
				<form name="go"> <!-- 자바스크립트로 submit 시키려면 form을 추가하고 name을 지정해야 한다. -->
					<input type="hidden" name="pageNum"/> <!-- 폼에 post로 값을 보내주기 위해 hidden -->
					<input type="hidden" name="searchKey"/> <!-- 폼에 post로 값을 보내주기 위해 hidden -->
					<input type="hidden" name="searchWord"/> <!-- 폼에 post로 값을 보내주기 위해 hidden -->
					<c:if test="${pVO.pageNum>1}">
						<a href="javascript:pageClick(1, '${pVO.searchKey}', '${pVO.searchWord}')" class="first_page"></a>
						<a href="javascript:pageClick(${pVO.pageNum-1}, '${pVO.searchKey}', '${pVO.searchWord}')" class="prev_page"></a>
					</c:if>
					<c:if test="${pVO.pageNum==1}">
						<a href="#" class="first_page"></a>
						<a href="#" class="prev_page"></a>
					</c:if>
					<c:forEach var="pageNum" begin="${pVO.startPageNum}" end="${pVO.startPageNum + pVO.onePageNum-1}">
						<c:if test="${pageNum<=pVO.totalPage }">
							<c:if test="${pageNum==pVO.pageNum }">
								<a href="javascript:pageClick(${pageNum}, '${pVO.searchKey}', '${pVO.searchWord}')" class="nowPageNum">${pageNum}</a>
<%-- 								<a href="memberManagement?pageNum=${pageNum}<c:if test="${pVO.searchWord!=null && pVO.searchWord!='' }">&searchKey=${pVO.searchKey}&searchWord=${pVO.searchWord}</c:if>">${pageNum}</a> --%>
							</c:if>
							<c:if test="${pageNum!=pVO.pageNum }">
								<a href="javascript:pageClick(${pageNum}, '${pVO.searchKey}', '${pVO.searchWord}')">${pageNum}</a>
<%-- 								<a href="memberManagement?pageNum=${pageNum}<c:if test="${pVO.searchWord!=null && pVO.searchWord!='' }">&searchKey=${pVO.searchKey}&searchWord=${pVO.searchWord}</c:if>">${pageNum}</a> --%>
							</c:if>
						</c:if>
					</c:forEach>
					<c:if test="${pVO.pageNum < pVO.totalPage}">
						<a href="javascript:pageClick(${pVO.pageNum+1}, '${pVO.searchKey}', '${pVO.searchWord}')" class="next_page"></a>
						<a href="javascript:pageClick(${pVO.totalPage}, '${pVO.searchKey}', '${pVO.searchWord}')" class="last_page"></a>
					</c:if>
					<c:if test="${pVO.pageNum == pVO.totalPage}">
						<a href="#" class="next_page"></a>
						<a href="#" class="last_page"></a>
					</c:if>
				</form>
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
								<li><div>*이름</div><input type="text" name="username" id="infoName" value=""/></li>
								<li><div>생년월일</div><input type="text" name="birth" id="infoBirth" value="" readonly/></li>
								<li><div>*연락처</div><input type="text" name="tel" id="infoTel" value="" maxlength="13"/></li>
								<li><div>*email</div><input type="text" name="email" id="infoEmail" value=""/></li>
								<li><div>*신고 누적 수</div><input type="text" name="reportCnt" id="infoReportCnt" value=""/></li>
								<li><div>*블랙리스트</div>
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