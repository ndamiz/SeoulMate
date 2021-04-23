<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/home/css/choi.css"/>
<script>
	$(function(){
		$("#memNext1").click(function(){
			// 변경할 비밀번호 정규식 표현
			if($("#editUserpwd").val()!=""){
				if(regExpCheck()!=false){
					// 비밀번호 확인 유효성 검사
					if($("#editUserpwd").val()!=$("#editUserpwd2").val()){
						alert("비밀번호가 다릅니다.");
						return false;
					}
				}else{
					return false;
				}
			}else{
				alert("비밀번호 변경 안함");
			}
		});
		function regExpCheck(){
			// 비밀번호
			var regPwd=/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,15}$/;
			if(!regPwd.test(document.getElementById("editUserpwd").value)){
				alert("비밀번호는 영문과 숫자, 특수문자를 조합한 8~15자리여야 합니다.");
				return false;
			}
			// 연락처
			var regTel=/[0-9]{4}$/;
			if(!regTel.test(document.getElementById("tel2").value)){ // 중간 번호
				alert("연락처는 숫자를 4자리씩 입력해야 합니다.");
				return false;
			}
			if(!regTel.test(document.getElementById("tel3").value)){ // 끝 번호
				alert("연락처는 숫자를 4자리씩 입력해야 합니다.");
				return false;
			}
		}
	});
</script>
<div class="wrap">
	<div class="title_wrap editDiv">
		<p class="s_title">회원정보 수정</p>
	</div>
	<form method="post" id="memId" action="memberEditOk">
		<div id="memEditDiv">
			<ul class="form_box choice" id="mem">
				<li><label>아이디</label>
					<input type="text" name="userid" id="editUserid" value="${vo.userid}" disabled/>
				</li>
				<li><label>변경할 비밀번호</label>
					<input type="password" name="userpwd" id="editUserpwd" value=""/></li>
				<li><label>비밀번호 확인</label>
					<input type="password" id="editUserpwd2" value=""/></li>
				<li><label>이름</label>
					<input type="text" name="username" id="editUsername" value="${vo.username}" disabled/></li>
				<li><label>연락처</label>
					<select name="tel1" id="tel1">
						<c:forEach var="i1" items="${arr1}">
							<option value="${i1}">${i1}</option>
						</c:forEach>
					</select><span class="multi">-</span>
					<input type="text" name="tel2" id="tel2" value="${vo.tel2}" maxlength="4"/><span class="multi">-</span>
					<input type="text" name="tel3" id="tel3" value="${vo.tel3}" maxlength="4"/>
				</li>
				<li><label>생년월일</label>
					<input type="text" name="birth1" id="editBirth1" value="${vo.birth1}" disabled/><span>년</span> 
					<input type="text" name="birth2" id="birth2" value="${vo.birth2}" disabled/><span>월</span>
					<input type="text" name="birth3" id="birth3" value="${vo.birth3}" disabled/><span>일</span>
				</li>
				<li><label>성별</label>
					<div class="checks">
						<input type="radio" name="gender" id="gender1" value="1" <c:if test="${vo.gender==1}">checked</c:if> disabled/>
						<label for="gender1">여성</label>
						<input type="radio" name="gender" id="gender2" value="2" <c:if test="${vo.gender==2}">checked</c:if> disabled/>
						<label for="gender2">남성</label>
					</div>
				</li>
				<li><label>&nbsp;희망 지역1</label>
						<select id="gu1" onchange="areaChange(this)">
							<option>구를 선택해주세요</option>
							<option value="강남구">강남구</option>
							<option value="강동구">강동구</option>
							<option value="강서구">강서구</option>
						</select>
 
						<select id="dong1">
							<option>동을 선택해주세요</option>
						</select>
						<input type="text" name="area1" id="area1" placeholder=""/>
					</li>
					<li><label>&nbsp;희망 지역2</label>
						<select id="gu2" onchange="areaChange(this)">
							<option>구를 선택해주세요</option>
							<option value="강남구">강남구</option>
							<option value="강동구">강동구</option>
							<option value="강서구">강서구</option>
						</select>
 
						<select id="dong2">
							<option>동을 선택해주세요</option>
						</select>
						<input type="text" name="area2" id="area2" placeholder=""/>
					</li>					
					<li><label>&nbsp;희망 지역3</label>
						<select id="gu3" onchange="areaChange(this)">
							<option>구를 선택해주세요</option>
							<option value="강남구">강남구</option>
							<option value="강동구">강동구</option>
							<option value="강서구">강서구</option>
						</select>
 
						<select id="dong3">
							<option>동을 선택해주세요</option>
						</select>
						<input type="text" name="area3" id="area3" placeholder=""/>
					</li>
				<li><label>이메일</label>
					<input type="text" name="emailid" id="emailid" value="${vo.emailid}" placeholder="이메일"/><span>@</span> 
					<select name="emaildomain" id="emaildomain">
						<option value="naver.com" <c:if test="${vo.emaildomain=='naver.com'}">selected</c:if>>naver.com</option>
						<option value="nate.com" <c:if test="${vo.emaildomain=='nate.com'}">selected</c:if>>nate.com</option>
						<option value="hanmail.net" <c:if test="${vo.emaildomain=='hanmail.net'}">selected</c:if>>hamail.net</option>
						<option value="gmail.com" <c:if test="${vo.emaildomain=='gmail.com'}">selected</c:if>>gmail.com</option>
					</select>
					<a class="green" id="emailBtn">인증번호 전송</a>
				</li>
				<li>
					<label></label>
					<input type="text" name="emailCheck" id="emailCheck" value="" placeholder="인증번호를 입력해주세요"/>
					<a class="green" id="emailCheckBtn">인증번호 확인</a>
				</li>
				<li>
					<button class="q_btn green" id="memNext1">회원정보 수정</button>
				</li>
			</ul>
			
		</div>
	</form>
</div>
</body>
</html>