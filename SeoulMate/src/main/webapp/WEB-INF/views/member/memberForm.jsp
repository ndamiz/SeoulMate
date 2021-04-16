<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	ul, li{margin:0; padding:0;}
	.main{width:600px; margin:0 auto;}
	#mem>li{float:left;}
	#mem>li:nth-child(2n+1){width:20%;}
	#mem>li:nth-child(2n){width:80%;}
	.main>#memBtn{text-align:center;}
	#memBtnDiv{text-align:center;}
</style>
<script>
	$(function(){
		$("#memBtn").click(function(){
			$("#mem").css("display","none");
		});
	});
</script>
<div class="main">
	<h1>회원가입</h1>
	ex)지금은 ${year}년입니다.<br/>
	회원 정보 입력, 이메일 인증, 라이프 스타일을 등록 후 회원가입이 가능합니다.
	<form method="post" action="memberOk">
		<div id="memDiv">
			<ul id="mem">
				<li><span style="color:red;">*</span>아이디</li>
				<li><input type="text" name="userid" id="userid" placeholder="영문과 숫자를 조합한 6~12자리"/>
					<input type="button" id="idBtn" value="중복 확인"/>
				</li>
				<li><span style="color:red;">*</span>비밀번호</li>
				<li><input type="password" name="userpwd" id="userpwd" placeholder="영문과 숫자, 특수문자를 조합한 8~15자리"/></li>
				<li><span style="color:red;">*</span>비밀번호 확인</li>
				<li><input type="password" name="userpwdcheck" placeholder="비밀번호를 재입력해주세요"/></li>
				<li><span style="color:red;">*</span>이름</li>
				<li><input type="text" name="username" placeholder="이름을 입력해주세요"/></li>
				<li><span style="color:red;">*</span>연락처</li>
				<li>
					<select name="tel1">
						<option>010</option>
						<option>02</option>
					</select>-
					<input type="text" name="tel2"/>-
					<input type="text" name="tel3"/>
				</li>
				<li><span style="color:red;">*</span>생년월일</li>
				<li>
					<select name="year">
						<option value="">연도</option>
						<c:forEach var="i" begin="0" end="${year-1920}">
							<c:set var="yearOption" value="${year-i}"/>
							<option value="${yearOption}">${yearOption}</option>
						</c:forEach>
					</select>
				</li>
				<li><span style="color:red;">*</span>성별</li>
				<li>
					<input type="radio" name="gender" value="1" checked/>여성
					<input type="radio" name="gender" value="2"/>남성
				</li>
				<li><span style="color:red;">*</span>이메일</li>
				<li>
					<input type="text" name="email" placeholder="이메일을 입력해주세요"/>
					<select>
						<option>@naver.com</option>
						<option>@nate.com</option>
					</select>
				</li>
				<li>&nbsp;</li>
				<li>
					<input type="button" id="emailBtn" value="인증번호 전송"/>
					<input type="text" name="emailCheck" id="emailCheck" placeholder="인증번호를 입력해주세요"/>	
				</li>
			</ul>
		</div>
		<div id="memBtnDiv">
			<input type="button" id="memBtn" value="다음"/>
		</div>
	</form>
</div>
</body>
</html>