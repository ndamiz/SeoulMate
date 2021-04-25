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
			// 희망 지역1
			var area1=$("#gu1").val();
			// alert(area1);
			if(area1=="구를 선택해주세요"){
				area1="";
			}else{
				area1+=" "+$("#dong1").val();
			}
			document.getElementById("area1").value=area1;
			
			// 희망 지역2
			var area2=$("#gu2").val();
			// alert(area2);
			if(area2=="구를 선택해주세요"){
				area2="";
			}else{
				area2+=" "+$("#dong2").val();
			}
			document.getElementById("area2").value=area2;
			
			// 희망 지역3
			var area3=$("#gu3").val();
			// alert(area3);
			if(area3=="구를 선택해주세요"){
				area3="";
			}else{
				area3+=" "+$("#dong3").val();
			}
			document.getElementById("area3").value=area3;
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
	// 희망 지역 1,2,3에 구,동 넣기
	function areaInput(){
		var a1=$("#area1").val().indexOf(" "); // 희망 지역1의 띄어쓰기 위치 구하기
		var a2=$("#area2").val().indexOf(" "); // 희망 지역2의 띄어쓰기 위치 구하기
		var a3=$("#area3").val().indexOf(" "); // 희망 지역3의 띄어쓰기 위치 구하기
		
		// alert(typeof a1); // 변수의 데이터 타입을 확인
		
		if(a1!=-1){ // 희망 지역 1이 있을 때
			var gu1=$("#area1").val().substring(0,a1);
			var dong1=$("#area1").val().substring(a1+1);
			$("#gu1>option[value='"+gu1+"']").attr('selected', true);
			$("#dong1").append("<option value='"+dong1+"' selected>"+dong1+"</option>");
			// $("#dong1>option[value='"+dong1+"']").attr('selected', true);
		}
		if(a2!=-1){ // 희망 지역 2가 있을 때
			var gu2=$("#area2").val().substring(0,a2);
			var dong2=$("#area2").val().substring(a2+1);
			$("#gu2>option[value='"+gu2+"']").attr('selected', true);
			$("#dong2").append("<option value='"+dong2+"' selected>"+dong2+"</option>");
		}
		if(a3!=-1){ // 희망 지역 3이 있을 때
			var gu3=$("#area3").val().substring(0,a3);
			var dong3=$("#area3").val().substring(a3+1);
			$("#gu3>option[value='"+gu3+"']").attr('selected', true);
			$("#dong3").append("<option value='"+dong3+"' selected>"+dong3+"</option>");
		}
	}
	
	$(window).ready(function(){
		areaInput();
	});
	/*
	// body가 실행되고 나중에 실행되게 하기
	window.onload = function() {
		areaInput();
	};
	*/
	
	// 희망 지역
	function areaChange(e) {
		var areaId=e.id;
		var gangnam = ["개포동","논현동","대치동","도곡동","삼성동","세곡동","수서동","신사동","압구정동","역삼동","일원동","청담동"];
		var gangdong = ["강일동","고덕동","길동","둔촌동","명일동","상일동","성내동","암사동","천호동"];
		var gangseo = ["미아동","번동","삼각산동","삼양동","송중동","송천동","수유동","우이동","인수동"];
		
		if(areaId=="gu1"){
			var target = document.getElementById("dong1");
		}else if(areaId=="gu2"){
			var target = document.getElementById("dong2");
		}else if(areaId=="gu3"){
			var target = document.getElementById("dong3");
		}
		if(e.value=="강남구") var d = gangnam;
		else if(e.value=="강동구") var d = gangdong;
		else if(e.value=="강서구") var d = gangseo;
 
		target.options.length = 0;
 
		for (x in d) {
			var opt = document.createElement("option");
			opt.value = d[x];
			opt.innerHTML = d[x];
			target.appendChild(opt);
		}
	}
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
					<input type="text" name="area1" id="area1" value="${vo.area1}" placeholder=""/>
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
					<input type="text" name="area2" id="area2" value="${vo.area2}" placeholder=""/>
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
					<input type="text" name="area3" id="area3" value="${vo.area3}" placeholder=""/>
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