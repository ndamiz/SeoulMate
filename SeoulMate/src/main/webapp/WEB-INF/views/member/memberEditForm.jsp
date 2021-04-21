<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	html>body>.wrap{min-height:550px;}
	/* #memEditDiv>#mem{width:600px;} */
	.form_box li{margin:10px 0;}
	.form_box.choice li > label{width:130px;}
	#userid, #userpwd, #userpwd2, #username{width:338px;}
	select{width:90px; margin:0 10px;}
	#tel2, #tel3, #birth1, #birth2, #birth3{width:90px;}
	#area1, #area2, #area3{width:130px;}
	#emailid, #emaildomain{width:125px;}
	#emailCheck{width:284px;}
	span{line-height: 47px;}
	.multi{text-align:center; width:13.73px;}
	input[type=text]:readonly {background:#ddd;}
	.title_wrap>p{margin:0 0 60px 0; font-size:2rem;}
</style>
<div class="wrap">
	
	<div class="title_wrap">
		<p class="s_title">회원정보 수정</p>
	</div>
	<form method="post" id="memId" action="memberOk">
		<div id="memEditDiv">
			<ul class="form_box choice" id="mem">
				<li><label>아이디</label>
					<input type="text" name="userid" id="userid" value="${vo.userid}" disabled/>
				</li>
					<li><label>비밀번호</label>
				<input type="password" name="userpwd" id="userpwd" value="${vo.userpwd}"/></li>
					<li><label>비밀번호 확인</label>
				<input type="password" name="userpwd2" id="userpwd2" value=""/></li>
				<li><label>이름</label>
					<input type="text" name="username" id="username" value="${vo.username}" disabled/></li>
				<li><label>연락처</label>
					<select name="tel1" id="tel1">
						<c:forEach var="i1" items="${arr1}">
							<option value="${i1}">${i1}</option>
						</c:forEach>
					</select><span class="multi">-</span>
					<input type="text" name="tel2" id="tel2" value="${vo.tel2}"/><span class="multi">-</span>
					<input type="text" name="tel3" id="tel3" value="${vo.tel3}"/>
				</li>
				<li><label>생년월일</label>
					<input type="text" name="birth1" id="birth1" value="${vo.birth1}" disabled/><span>년</span> 
					<input type="text" name="birth2" id="birth2" value="${vo.birth2}" disabled/><span>월</span>
					<input type="text" name="birth3" id="birth3" value="${vo.birth3}" disabled/><span>일</span>
				</li>
				<li><label>성별</label>
					<div class="checks">
						<input type="radio" name="gender" id="gender1" value="1" <c:if test="${vo.gender==1}">checked</c:if> onclick="return false;"/>
						<label for="gender1">여성</label>
						<input type="radio" name="gender" id="gender2" value="2" <c:if test="${vo.gender==2}">checked</c:if>onclick="return false;"/>
						<label for="gender2">남성</label>
					</div>
				</li>
				<li><label>희망 지역(최대 3곳)</label>
					<input type="text" name="area1" id="area1" value="${vo.area1}"/>
					<input type="text" name="area2" id="area2" value="${vo.area2}"/>
					<input type="text" name="area3" id="area3" value="${vo.area3}"/>
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
					<a class="q_btn green" id="memNext1">회원정보 수정</a>
				</li>
			</ul>
			
		</div>
	</form>
</div>
</body>
</html>