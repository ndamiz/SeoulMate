<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/home/css/choi.css"/>
<script>
	$(function(){
		$("#memNext1").click(function(){
			// 변경할 비밀번호 정규식 표현
			if($("#userpwd").val()!=""){
				if(regExpCheck()!=false){
					// 비밀번호 확인 유효성 검사
					if($("#userpwd").val()!=$("#userpwd2").val()){
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
		
		$("#profileDel").click(function(){
			$(this).parent().css('display', 'none');
			$(this).next().attr('name', "delFile");
			$("#profileOrg").css('display', 'none');
			$("#profileInput").css('display', 'block');
			$(this).parent().next().children('input').attr('type', 'file');
		});
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
	
	// 희망 지역
	function areaChange(e) {
		var areaId=e.id;
		var gangnam = ["개포동", "논현동", "대치동", "도곡동", "삼성동", "세곡동", "수서동", "신사동", "압구정동", "역삼동", "율현동", "일원동", "자곡동", "청담동"];
		var gangdong = ["강일동", "고덕동", "길동", "둔촌동", "명일동", "상일동", "성내동", "암사동", "천호동"];
		var gangbuk = ["미아동", "번동", "수유동", "우이동"];
		var gangseo = ["등촌동", "염창동", "방화동", "공항동", "개화동", "과해동", "화곡동", "마곡동", "가양동", "내발산동", "오곡동", "오쇠동", "외발산동"];
		var gwanak = ["남현동", " 봉천동", " 신림동"];
		var gwangjin = ["광장동", "구의동", "군자동", "능동", "자양동", "중곡동", "화양동"];
		var guro = ["가리봉동", "개봉동", "고척동", "구로동", "궁동", "신도림동", "오류동", "온수동", "천왕동", "항동"];
		var geumcheon = ["가산동", "독산동", "시흥동"];
		var nowon = ["공릉동", "상계동", "월계동", "중계동", "하계동"];
		var dobong = ["도봉동", "방학동", "쌍문동", "창동"];
		var dongdaemun = ["답십리동", "신설동", "용두동", "이문동", "장안동", "전농동", "제기동", "청량리동", "회기동", "휘경동"];
		var dongjak = ["노량진동", "대방동", "동작동", "본동", "사당동", "상도1동", "상도동", "신대방동", "흑석동"];
		var mapo = ["공덕동", "구수동", "노고산동", "당인동", "대흥동", "도화동", "동교동", "마포동", "망원동", "상수동", "상암동", "서교동", "성산동", "신공덕동", "신수동", "신정동", "아현동", "연남동", "염리동", "용강동", "중동", "창전동", "토정동", "하중동", "합정동", "현석동"];
		var seodaemun = ["남가좌동", "냉천동", "대신동", "대현동", "미근동", "봉원동", "북가좌동", "북아현동", "신촌동", "연희동", "영천동", "옥천동", "창천동", "천연동", "충정로2가", "충정로3가", "합동", "현저동", "홍은동", "홍제동"];
		var seocho = ["내곡동", "반포동", "방배동", "서초동", "신원동", "양재동", "염곡동", "우면동", "원지동", "잠원동"];
		var seongdong = ["금호동1가", "금호동2가", "금호동3가", "금호동4가", "도선동", "마장동", "사근동", "상왕십리동", "성수동1가", "성수동2가", "송정동", "옥수동", "용답동", "응봉동", "하왕십리동", "행당동", "홍익동"];
		var seongbuk = ["길음동", "돈암동", "동선동1가", "동선동2가", "동선동3가", "동선동4가", "동선동5가", "동소문동1가", "동소문동2가", "동소문동3가", "동소문동4가", "동소문동5가", "동소문동6가", "동소문동7가", "보문동1가", "보문동2가", "보문동3가", "보문동4가", "보문동5가", 
			"보문동6가", "보문동7가", "삼선동1가", "삼선동2가", "삼선동3가", "삼선동4가", "삼선동5가", "상월곡동", "석관동", "성북동", "성북동1가", "안암동1가", "안암동2가", 
			"안암동3가", "안암동4가", "안암동5가", "장위동", "정릉동", "종암동", "하월곡동"];
		var songpa = ["가락동", "거여동", "마천동", "문정동", "방이동", "삼전동", "석촌동", "송파동", "신천동", "오금동", "잠실동", "장지동", "풍납동"];
		var yangcheon = ["목동", "신월동", "신정동"];
		var yeongdeungpo = ["당산동", "당산동1가", "당산동2가", "당산동3가", "당산동4가", "당산동5가", "당산동6가", "대림동", "도림동", "문래동1가", 
						"문래동2가", "문래동3가", "문래동4가", "문래동5가", "문래동6가", "신길동", "양평동", "양평동1가", "양평동2가", "양평동3가", 
						"양평동4가", "양평동5가", "양평동6가", "양화동", "여의도동", "영등포동", "영등포동1가", "영등포동2가", "영등포동3가", "영등포동4가", 
						"영등포동5가", "영등포동6가", "영등포동7가", "영등포동8가"];
		var yongsan = ["갈월동", "남영동", "도원동", "동빙고동", "동자동", "문배동", "보광동", "산천동", "서계동", 
			"서빙고동", "신계동", "신창동", "용문동", "용산동1가", "용산동2가", "용산동3가", "용산동4가", "용산동5가", 
			"용산동6가", "원효로1가", "원효로2가", "원효로3가", "원효로4가", "이촌동", "이태원동", "주성동", "청암동", "청파동1가", "청파동2가", 
			"청파동3가", "한강로1가", "한강로2가", "한강로3가", "한남동", "효창동", "후암동"];
		var eunpyeong = ["갈현동", "구산동", "녹번동", "대조동", "불광동", "수색동", "신사동", "역촌동", "응암동", "증산동", "진관동"];
		var jongno = ["가회동", "견지동", "경운동", "계동", "공평동", "관수동", "관철동", "관훈동", "교남동", "교북동", "구기동", "궁정동", "권농동", "낙원동", "내수동", 
			"내자동", "누상동", "누하동", "당주동", "도렴동", "돈의동", "동숭동", "명륜1가", "명륜2가", "명륜3가", "명륜4가", "묘동", "무악동", "봉익동", "부암동", 
			"사간동", "사직동", "삼청동", "서린동", "세종로", "소격동", "송월동", "송현동", "수송동", "숭인동", "신교동", "신문로1가", "신문로2가", "신영동", "안국동", 
			"연건동", "연지동", "예지동", "옥인동", "와룡동", "운니동", "원남동", "원서동", "이화동", "익선동", "인사동", "인의동", "장사동", "재동", "적선동", "종로1가", 
			"종로2가", "종로3가", "종로4가", "종로5가", "종로6가", "중학동", "창성동", "창신동", "청운동", "청진동", "체부동", "충신동", "통의동", "통인동", "팔판동", "평동", 
			"평창동", "필운동", "행촌동", "혜화동", "홍지동", "홍파동", "화동", "효자동", "효제동", "훈정동"]; 
		var jung = ["광희동1가", "광희동2가", "남대문로1가", "남대문로2가", "남대문로3가", "남대문로4가", "남대문로5가", "남산동1가", "남산동2가", "남산동3가", "남창동", "남학동", "다동", 
			"만리동1가", "만리동2가", "명동1가", "명동2가", "무교동", "무학동", "묵정동", "방산동", "봉래동1가", "봉래동2가", "북창동", "산림동", "삼각동", "서소문동", "소공동", 
			"수표동", "수하동", "순화동", "신당동", "쌍림동", "예관동", "예장동", "오장동", "을지로1가", "을지로2가", "을지로3가", "을지로4가", "을지로5가", "을지로6가", "을지로7가", 
			"의주로1가", "의주로2가", "인현동1가", "인현동2가", "입정동", "장교동", "장충동1가", "장충동2가", "저동1가", "저동2가", "정동", "주교동", "주자동", "중림동", "초동", 
			"충무로1가", "충무로2가", "충무로3가", "충무로4가", "충무로5가", "충정로1가", "태평로1가", "태평로2가", "필동1가", "필동2가", "필동3가", "황학동", "회현동1가", 
			"회현동2가", "회현동3가", "흥인동"];
		var jungnang= ["망우동", "면목동", "묵동", "상봉동", "신내동", "중화동"];
		
		if(areaId=="gu1"){
			var target = document.getElementById("dong1");
		}else if(areaId=="gu2"){
			var target = document.getElementById("dong2");
		}else if(areaId=="gu3"){
			var target = document.getElementById("dong3");
		}
		if(e.value=="강남구") var d = gangnam;
		else if(e.value=="강동구") var d = gangdong;
		else if(e.value=="강북구") var d = gangbuk;
		else if(e.value=="강서구") var d = gangseo;
		else if(e.value=="관악구") var d = gwanak;
		else if(e.value=="광진구") var d = gwangjin;
		else if(e.value=="구로구") var d = guro;
		else if(e.value=="금천구") var d = geumcheon;
		else if(e.value=="노원구") var d = nowon;
		else if(e.value=="도봉구") var d = dobong;
		else if(e.value=="동대문구") var d = dongdaemun;
		else if(e.value=="동작구") var d = dongjak;
		else if(e.value=="마포구") var d = mapo;
		else if(e.value=="서대문구") var d = seodaemun;
		else if(e.value=="서초구") var d = seocho;
		else if(e.value=="성동구") var d = seongdong;
		else if(e.value=="성북구") var d = seongbuk;
		else if(e.value=="송파구") var d = songpa;
		else if(e.value=="양천구") var d = yangcheon;
		else if(e.value=="영등포구") var d = yeongdeungpo;
		else if(e.value=="용산구") var d = yongsan;
		else if(e.value=="은평구") var d = eunpyeong;
		else if(e.value=="종로구") var d = jongno;
		else if(e.value=="중구") var d = jung;
		else if(e.value=="중랑구") var d = jungnang;
 
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
	<form method="post" id="memId" action="memberEditOk" enctype="multipart/form-data">
		<div id="memDiv1">
			<ul class="form_box choice" id="mem">
				<li><label>아이디</label>
					<input type="text" name="userid" id="Edituserid" value="${vo.userid}" disabled/>
				</li>
				<li><label>변경할 비밀번호</label>
					<input type="password" name="userpwd" id="userpwd" value=""/></li>
				<li><label>비밀번호 확인</label>
					<input type="password" id="userpwd2" value=""/></li>
				<li><label>이름</label>
					<input type="text" name="username" id="username" value="${vo.username}" disabled/></li>
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
					<input type="date" name="birth" id="birth" value="${vo.birth}" disabled/>
				</li>
				<li><label>성별</label>
					<div class="checks">
						<input type="radio" name="gender" id="gender1" value="1" <c:if test="${vo.gender==1}">checked</c:if> disabled/>
						<label for="gender1">여성</label>
						<input type="radio" name="gender" id="gender2" value="2" <c:if test="${vo.gender==2}">checked</c:if> disabled/>
						<label for="gender2">남성</label>
					</div>
				</li>
				<li id="proli"><span class="red_txt">*</span><label>프로필 사진</label>
					<div class="profile_div">
						<img class="profile_img" id="profileOrg" src="/home/profilePic/${vo.profilePic}"/>
						<div>
							<img class="remove_icon" id="profileDel" src="/home/img/choi/trash-can.png"/>
							<input type="hidden" name="" value="${vo.profilePic}"/><br/>
						</div>
						<div style="display:none;" id="profileInput">
							<img class="profile_img" id="profileImg" name="profileImg" src="/home/img/choi/basic.png" alt="upload image"/><br/>
							<input type="hidden" accept="image/*" name="filename" id="profilePic" />
						</div>
					</div>
				</li>
				<li id="a1"><label>&nbsp;희망 지역1</label>
					<select id="gu1" onchange="areaChange(this)">
						<option>구를 선택해주세요</option>
						<c:forEach var="gu" items="${guArr}">
							<option value="${gu}">${gu}</option>
						</c:forEach>
					</select>

					<select id="dong1">
						<option>동을 선택해주세요</option>
					</select>
					<input type="hidden" name="area1" id="area1" value="${vo.area1}" placeholder=""/>
				</li>
				<li id="a2"><label>&nbsp;희망 지역2</label>
					<select id="gu2" onchange="areaChange(this)">
						<option>구를 선택해주세요</option>
						<c:forEach var="gu" items="${guArr}">
							<option value="${gu}">${gu}</option>
						</c:forEach>
					</select>

					<select id="dong2">
						<option>동을 선택해주세요</option>
					</select>
					<input type="hidden" name="area2" id="area2" value="${vo.area2}" placeholder=""/>
				</li>					
				<li id="a3"><label>&nbsp;희망 지역3</label>
					<select id="gu3" onchange="areaChange(this)">
						<option>구를 선택해주세요</option>
						<c:forEach var="gu" items="${guArr}">
							<option value="${gu}">${gu}</option>
						</c:forEach>
					</select>

					<select id="dong3">
						<option>동을 선택해주세요</option>
					</select>
					<input type="hidden" name="area3" id="area3" value="${vo.area3}" placeholder=""/>
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