<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	ul, li{margin:0; padding:0;}
	.main{width:600px; margin:0 auto;}
	.red{color:red;}
	#memId li{float:left; height:50px; padding:10px 0;}
	#mem li, #memDiv2>ul li, #memDiv3>ul li{float:left;}
	#mem>li:nth-child(2n+1){width:20%;}
	#mem>li:nth-child(2n){width:80%;}
	.main>#memBtn{text-align:center;}
	.center{text-align:center;}
	#memDiv2, #memDiv3, #memDiv4{display:none;}
	#memDiv2>ul>li{width:50%;}
	.width46>li:nth-child(2n+1){width:40%;}
	.width46>li:nth-child(2n){width:60%;}
	#memDiv2 input[type=button], #memDiv3 input[type=button]{width:100%; height:40px;}
	#mem3 li{width:50%;}
	.houseChoice, .mateChoice{display:none;}
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
<div class="main">
	<form method="post" id="memId" action="memberOk">
		<div id="memDiv1">
			<h1>회원가입</h1>
			회원 정보 입력, 이메일 인증, 라이프 스타일을 등록 후 회원가입이 가능합니다.
			<ul id="mem">
				<li><span class="red">*</span>아이디</li>
				<li><input type="text" name="userid" id="userid" maxlength="12" placeholder="영문과 숫자를 조합한 6~12자리"/>
					<input type="button" id="idBtn" value="중복 확인"/>
					<input type="hidden" name="idCheck" id="idCheck" value="N"/>
				</li>
				<li><span class="red">*</span>비밀번호</li>
				<li><input type="password" name="userpwd" id="userpwd" placeholder="영문과 숫자, 특수문자를 조합한 8~15자리"/></li>
				<li><span class="red">*</span>비밀번호 확인</li>
				<li><input type="password" name="userpwd2" id="userpwd2" placeholder="비밀번호를 재입력해주세요"/></li>
				<li><span class="red">*</span>이름</li>
				<li><input type="text" name="username" id="username" placeholder="이름을 입력해주세요"/></li>
				<li><span class="red">*</span>연락처</li>
				<li>
					<select name="tel1" id="tel1">
						<c:forEach var="i1" items="${arr1}">
							<option value="${i1}">${i1}</option>
						</c:forEach>
					</select> -
					<input type="text" name="tel2" id="tel2" maxlength="4"/> -
					<input type="text" name="tel3" id="tel3" maxlength="4"/>
				</li>
				<li><span class="red">*</span>생년월일</li>
				<li>
					<select name="birth1" id="birth1">
						<option value="">연도</option>
						<c:forEach var="i" begin="0" end="${year-1930}">
							<c:set var="yearOption" value="${year-i}"/>
							<option value="${yearOption}">${yearOption}</option>
						</c:forEach>
					</select>년 
					<input type="text" name="birth2" id="bitrh2" maxlength="2"/>월 
					<input type="text" name="birth3" id="bitrh3" maxlength="2"/>일
				</li>
				<li><span class="red">*</span>성별</li>
				<li>
					<input type="radio" name="gender" value="1" checked/>여성
					<input type="radio" name="gender" value="2"/>남성
				</li>
				<li><span class="red">*</span>이메일</li>
				<li>
					<input type="text" name="emailid" id="emailid" placeholder="이메일을 입력해주세요"/> @ 
					<select name="emaildomain">
						<option value="naver.com">naver.com</option>
						<option value="nate.com">nate.com</option>
						<option value="hanmail.net">hamail.net</option>
						<option value="gmail.com">gmail.com</option>
					</select>
					<input type="button" id="emailBtn" value="인증번호 전송"/>
				</li>
				<li>&nbsp;</li>
				<li>
					<input type="text" name="emailCheck" id="emailCheck" placeholder="인증번호를 입력해주세요"/>
					<input type="button" id="emailCheckBtn" value="인증번호 확인"/>
				</li>
			</ul>
			<input type="button" id="memNext1" value="다음" style="width:100%; height:40px;"/>
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
				<li><span class="red">*</span>생활 소음</li>
				<li>
					<input type="radio" name="h_noise" value="1" checked/> 매우 조용함
					<input type="radio" name="h_noise" value="2"/> 보통
					<input type="radio" name="h_noise" value="3"/> 조용하지 않음
				</li>
				<li><span class="red">*</span>생활 시간</li>
				<li>
					<input type="radio" name="h_pattern" value="1" checked/> 주행성
					<input type="radio" name="h_pattern" value="3"/> 야행성
				</li>
				<li><span class="red">*</span>하우스 내 애완동물 여부</li>
				<li>
					<input type="radio" name="h_pet" value="1" checked/> 없음
					<input type="radio" name="h_pet" value="3"/> 있음
				</li>
				<li><span class="red">*</span>애완동물 동반 입주 여부</li>
				<li>
					<input type="radio" name="h_petwith" value="1" checked/> 불가능
					<input type="radio" name="h_petwith" value="3"/> 가능
				</li>
				<li><span class="red">*</span>흡연</li>
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
</body>
</html>