<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	.form_box li{margin:10px 0;}
	.form_box.choice li > label{width:120px;}
	#userpwd, #userpwd2{width:59%;}
	select{width:110px; margin:0 10px;}
	#tel2, #tel3, #bitrh2, #bitrh3, #emailid{width:100px;}
	span{line-height: 47px;}
	.multi{text-align:center; width:13.73px;}
	#emaildomain{width:150px;}
	#emailCheck{width:284px;}
</style>
<script>
	$(function(){
		$("#memNext1").click(function(){
			$("#memDiv1").css("display","none");
			$("#memDiv2").css("display", "block");
		});
		// 2
		$("#memPrev2").click(function(){
			$("#memDiv1").css("display","block");
			$("#memDiv2").css("display", "none");
		});
		$("#memNext2").click(function(){
			$("#memDiv2").css("display","none");
			$("#memDiv3").css("display","block");
		});
		// 3
		$("#memPrev3").click(function(){
			$("#memDiv2").css("display","block");
			$("#memDiv3").css("display", "none");
		});
		$("#memNext3").click(function(){
			$("#memDiv3").css("display","none");
			$("#memDiv4").css("display","block");
		});
		
		
		$(document).ready(function () {
			$('#memNext2').click(function () {
				var radioVal = $('input[name="housemate"]:checked').val();
				
				if(radioVal=="쉐어하우스"){
					$(".houseChoice").css("display","block");
					$(".mateChoice").css("display","none");
				}else if(radioVal=="하우스메이트"){
					$(".houseChoice").css("display","none");
					$(".mateChoice").css("display","block");
				}
			});
		});
	});
</script>
<div class="wrap">
	<div class="member_wrap">
		<form method="post" id="memId" action="memberOk">
			<div id="memDiv1">
				<p class="m_title">회원가입</p>
				회원 정보 입력, 이메일 인증, 라이프 스타일을 등록 후 회원가입이 가능합니다.
				<ul class="form_box choice" id="mem">
					<li><label><span  class="red_txt">*</span>아이디</label>
					<input type="text" name="userid" id="userid" maxlength="12" placeholder="영문과 숫자를 조합한 6~12자리"/>
					<a class="white" id="idBtn">중복 확인</a>
					<input type="hidden" name="idCheck" id="idCheck" value="N"/>
					</li>
					<li><label><span  class="red_txt">*</span>비밀번호</label>
					<input type="password" name="userpwd" id="userpwd" placeholder="영문과 숫자, 특수문자를 조합한 8~15자리"/></li>
					<li><label><span  class="red_txt">*</span>비밀번호 확인</label>
					<input type="password" name="userpwd2" id="userpwd2" placeholder="비밀번호를 재입력해주세요"/></li>
					<li><label><span  class="red_txt">*</span>이름</label>
					<input type="text" name="username" id="username" placeholder="이름을 입력해주세요"/></li>
					<li><label><span  class="red_txt">*</span>연락처</label>
						<select name="tel1" id="tel1">
							<c:forEach var="i1" items="${arr1}">
								<option value="${i1}">${i1}</option>
							</c:forEach>
						</select><span class="multi">-</span>
						<input type="text" name="tel2" id="tel2" maxlength="4"/><span class="multi">-</span>
						<input type="text" name="tel3" id="tel3" maxlength="4"/>
					</li>
					<li><label><span  class="red_txt">*</span>생년월일</label>
						<select name="birth1" id="birth1">
							<option value="">연도</option>
							<c:forEach var="i" begin="0" end="${year-1930}">
								<c:set var="yearOption" value="${year-i}"/>
								<option value="${yearOption}">${yearOption}</option>
							</c:forEach>
						</select><span>년</span> 
						<input type="text" name="birth2" id="bitrh2" maxlength="2"/><span>월</span>
						<input type="text" name="birth3" id="bitrh3" maxlength="2"/><span>일</span>
					</li>
					<li><label><span class="red_txt">*</span>성별</label>
						<div class="checks">
							<input type="radio" name="gender" id="gender1" value="1" checked/>
							<label for="gender1">여성</label>
							<input type="radio" name="gender" id="gender2" value="2"/>
							<label for="gender2">남성</label>
						</div>
					</li>
					<li><label><span class="red_txt">*</span>이메일</label>
						<input type="text" name="emailid" id="emailid" placeholder="이메일"/><span>@</span> 
						<select name="emaildomain" id="emaildomain">
							<option value="naver.com">naver.com</option>
							<option value="nate.com">nate.com</option>
							<option value="hanmail.net">hamail.net</option>
							<option value="gmail.com">gmail.com</option>
						</select>
						<a class="green" id="emailBtn">인증번호 전송</a>
					</li>
					<li>
						<label></label>
						<input type="text" name="emailCheck" id="emailCheck" placeholder="인증번호를 입력해주세요"/>
						<a class="green" id="emailCheckBtn">인증번호 확인</a>
					</li>
				</ul>
				<a class="q_btn green" id="memNext1">다음</a>
			</div>
			<div id="memDiv2">
				<h1>가입 유형</h1>
				가입하고자 하는 유형을 선택해주세요.
				<br/><br/>
				<ul>
					<li>
						<input type="radio" name="housemate" value="쉐어하우스" checked/> 쉐어하우스<br>
						우리 집에 입주할 메이트를 찾아요!
					</li>
					<li>
						<input type="radio" name="housemate" value="하우스메이트"/> 하우스메이트<br/>
						쉐어하우스에 입주하고 싶어요!
					</li>
					<li>
						<input type="button" id="memPrev2" value="이전"/>
					</li>
					<li>
						<input type="button" id="memNext2" value="다음"/>
					</li>
				</ul>
			</div>
			<h1 class="houseChoice">원하는 메이트의 성향 등록</h1>
			<span class="houseChoice">원하는 메이트의 라이프 스타일을 선택해주세요.</span>
			<h1 class="mateChoice">나의 성향 등록</h1>
			<span class="mateChoice">나의 라이프 스타일을 선택해주세요.</span>
			<div id="memDiv3">
				<div class="center">
					<h4>생활</h4>
				</div>
				<ul class="width46">
					<li><span  class="red_txt">*</span>생활 소음</li>
					<li>
						<input type="radio" name="h_noise" value="1" checked/> 매우 조용함
						<input type="radio" name="h_noise" value="2"/> 보통
						<input type="radio" name="h_noise" value="3"/> 조용하지 않음
					</li>
					<li><span  class="red_txt">*</span>생활 시간</li>
					<li>
						<input type="radio" name="h_pattern" value="1" checked/> 주행성
						<input type="radio" name="h_pattern" value="3"/> 야행성
					</li>
					<li><span  class="red_txt">*</span>하우스 내 애완동물 여부</li>
					<li>
						<input type="radio" name="h_pet" value="1" checked/> 없음
						<input type="radio" name="h_pet" value="3"/> 있음
					</li>
					<li><span  class="red_txt">*</span>애완동물 동반 입주 여부</li>
					<li>
						<input type="radio" name="h_petwith" value="1" checked/> 불가능
						<input type="radio" name="h_petwith" value="3"/> 가능
					</li>
					<li><span  class="red_txt">*</span>흡연</li>
					<li>
						<input type="radio" name="h_smoke" value="1" checked/> 비흡연
						<input type="radio" name="h_smoke" value="2"/> 실내 흡연
						<input type="radio" name="h_smoke" value="3"/> 실외 흡연
					</li>
				</ul>
				<ul id="mem3">
					<li><input type="button" id="memPrev3" value="이전"/></li>
					<li><input type="button" id="memNext3" value="다음"/></li>
				</ul>
			</div>
			<div id="memDiv4">
				<div class="center">
					<h4>소통</h4>		
				</div>
			</div>
		</form>
	</div>
</div>
</body>
</html>