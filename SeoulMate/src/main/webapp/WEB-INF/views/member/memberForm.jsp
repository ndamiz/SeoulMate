<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/home/css/choi.css"/>
<c:set var="today" value="<%=new java.util.Date()%>"/>
<c:set var="now"><fmt:formatDate value="${today}" pattern="yyyy-MM-dd"/></c:set>
<script>
	$(function(){
		// input 태그에서 엔터키를 입력해 submit 막기
		$('input[type="text"], input[type="password"], input[type=date]').keydown(function(){
			if(event.keyCode === 13){
				event.preventDefault();
			};
		});
		//////////// 회원가입 폼 시작 ////////////
		// 아이디 중복검사 해제
		var userid;
		$("#userid").keyup(function(){ // 키 이벤트가 발생했을 때
			$("#hiddenCheck").val("N");
			userid=$("#userid").val();
		});
		$("#userid").change(function(){ // 마우스로 잘라내기를 했을 경우를 대비
			if(userid!=$("#userid")){
				$("#hiddenCheck").val("N");
			}
		});
		////////////아이디 중복 확인 ////////////
		var popupWidth=630;
		var popupHeight=200;
		var popupX=(window.screen.width/2)-(popupWidth/2); // 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음
		var popupY=(window.screen.height/2)-(popupHeight/2);
		
		$("#idCheck").click(function(){
			if(regExpCheck()==false){
				return false;
			}
			$(document.body).css("overflow","hidden");
			if($("#userid").val()!=""){
				$("#idPopup").css("display", "block");
				var idCheck=$("#userid").val();
				$("#useridChk").val(idCheck);
				ajax();
			}else{
				alert("아이디를 입력 후 중복 검사를 눌러주세요");
			}
		});
		$("#popIdChk").click(function(){
			// 팝업 아이디
			if(regPopCheck()==false){
				return false;
			}else{
				ajax();	
			}
		});
		// 팝업 아이디 사용하기 버튼 이벤트 
		$("#setId").click(function(){
			var useId=$("#useId").text();
			$("#userid").val(useId);
			$("#idPopup").css("display", "none");
			$("#hiddenCheck").val("Y");
			$(document.body).css("overflow","visible");
			
		});
		$("#idPopupClose").click(function(){
			$("#idPopup").css("display", "none");
			$(document.body).css("overflow","visible");
			$("#idResult").empty();
		});
		// 1
		$("#memNext1").click(function(){
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
			
			// 유효성 검사
			if($("#userid").val()==""){
				alert("아이디를 입력하세요");
				return false;
			}
			if($("#hiddenCheck").val()!="Y"){
				alert("아이디 중복 검사를 하세요");
				return false;
			}
			if($("#userpwd").val()==""){
				alert("비밀번호를 입력하세요");
				return false;
			}
			if($("#userpwd2").val()==""){
				alert("비밀번호 확인을 입력하세요");
				return false;
			}
			if($("#userpwd").val()!=$("#userpwd2").val()){
				alert("비밀번호가 다릅니다.");
				return false;
			}
			if($("#username").val()==""){
				alert("이름을 입력하세요");
				return false;
			}
			if($("#tel2").val()==""||$("#tel3").val()==""){
				alert("전화번호를 입력하세요");
				return false;
			}
			if($("#birth").val()==null || $("#birth").val()==""){
				alert("생년월일을 선택하세요");
				return false;
			}
			if($("#area1").val()==null || $("#area1").val()==""){
				alert("희망 지역1을 선택하세요\r\n(하우스인 경우 등록할 하우스의 지역을 선택해주세요.)");
				return false;
			}
			if($("#area3").val()!=null && $("#area3").val()!=""){
				if($("#area2").val()==null || $("#area2").val()==""){
					alert("희망 지역2를 선택하세요");
					return false;
				}
			}
			//////////////////////////////////////
			// 정규식 표현에 통과했을 때
			if(regExpCheck()!=false){
				$("#memDiv1").css("display","none");
				$("#memDiv2").css("display", "block");
			}
			goTop();
		});
		// 2
		$("#memPrev2").click(function(){
			$("#memDiv1").css("display","block");
			$("#memDiv2").css("display", "none");
			goTop();
		});
		$("#memNext2").click(function(){
			$("#memDiv2").css("display","none");
			$("#memDiv3").css("display","block");
			$("#housemateChoice").css("display", "block");
			goTop();
		});
		// 3
		$("#memPrev3").click(function(){
			$("#memDiv2").css("display","block");
			$("#memDiv3").css("display", "none");
			$("#housemateChoice").css("display", "none");
			goTop();
		});
		$("#memNext3").click(function(){
			$("#memDiv3").css("display","none");
			$("#memDiv4").css("display","block");
			goTop();
		});
		// 4
		$("#memPrev4").click(function(){
			$("#memDiv3").css("display","block");
			$("#memDiv4").css("display","none");
			goTop();
		});
		$("#memNext4").click(function(){
			$("#memDiv4").css("display","none");
			$("#memDiv5").css("display","block");
			goTop();
		});
		// 5
		$("#memPrev5").click(function(){
			$("#memDiv4").css("display","block");
			$("#memDiv5").css("display","none");
			$("#hopeChoice").css("display", "none");
			goTop();
		});
		$("#memNext5").click(function(){
			$("#memDiv5").css("display","none");
			$("#memDiv6").css("display","block");
			$("#housemateChoice").css("display", "none");
			$("#hopeChoice").css("display", "block");
			goTop();
		});
		// 6
		$("#memPrev6").click(function(){
			$("#memDiv5").css("display","block");
			$("#memDiv6").css("display","none");			
			$("#housemateChoice").css("display", "block");
			$("#hopeChoice").css("display", "none");
			goTop();
		});
		$("#memNext6").click(function(){
			$("#memDiv6").css("display","none");
			$("#memDiv7").css("display","block");
			$("#housemateChoice").css("display", "none");
			$("#hopeChoice").css("display", "block");
			goTop();
		});
		// 7
		$("#memPrev7").click(function(){
			$("#memDiv6").css("display","block");
			$("#memDiv7").css("display","none");			
			$("#housemateChoice").css("display", "none");
			$("#hopeChoice").css("display", "block");
			goTop();
		});
		$("#memNext7").click(function(){
			if(confirm("회원가입을 하시겠습니까?")){
				return true;
			}else{
				return false;
			}
			goTop();
		});
		
		// ajax
		function ajax(){
			var url="idChk";
			var params="userid="+$("#useridChk").val();
			$.ajax({
				url:url,
				data:params,
				success:function(result){
					var tag="<span class=\"red_txt\" id=\"useId\">"+$("#useridChk").val()+"</span>";
					if(result>0){
						tag+="은 사용 불가능한 아이디입니다.";
						$("#setId").css("display","none");
					}else{
						tag+="은 사용가능한 아이디입니다.";
						$("#setId").css("display","block");
					}
					$("#idResult").empty();
					$("#idResult").append(tag);
				},error:function(){
					console.log("ajax 실패");
				}
			});
		}
		
		// 하우스를 선택했는지 메이트를 선택했는지 구분
		$(document).ready(function () {
			$('#memNext2').click(function () {
				var radioVal = $('input[name="pcase"]:checked').val();
				
				if(radioVal=="h"){
					$(".houseChoice").css("display","block");
					$(".mateChoice").css("display","none");
				}else if(radioVal=="m"){
					$(".houseChoice").css("display","none");
					$(".mateChoice").css("display","block");
				}
			});
		});
		//////////// 정규식 표현 ////////////
		function regExpCheck(){
			// 아이디
			var regId=/^[a-zA-Z]{1}[a-zA-Z0-9]{5,11}$/;
			if(!regId.test(document.getElementById("userid").value)){
				alert("아이디는 영문과 숫자를 조합한 6~12자리여야 합니다.");
				return false;
			}
			// 비밀번호
			var regPwd=/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,15}$/;
			if(!regPwd.test(document.getElementById("userpwd").value)){
				alert("비밀번호는 영문과 숫자, 특수문자를 조합한 8~15자리여야 합니다.");
				return false;
			}
			// 이름
			var regName=/^[가-힣]{2,4}$/;
			if(!regName.test(document.getElementById("username").value)){
				alert("이름은 한글 2~4자리여야 합니다.");
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
			// 이메일 아이디
			var regEmailId=/^\w{3,14}$/;
			if(!regEmailId.test(document.getElementById("emailid").value)){
				alert("이메일을 잘못 입력하셨습니다.");
				return false;
			}
			// 인증 번호
			var regEmailCheck=/[0-9]{6}$/;
			if(!regEmailCheck.test(document.getElementById("emailCheck").value)){
				alert("인증번호는 숫자 6자리를 입력해야 합니다.");
				return false;
			}
		}
		// 팝업 아이디 정규식 표현
		function regPopCheck(){
			var regIdPop=/^[a-zA-Z]{1}[a-zA-Z0-9]{5,11}$/;
			if(!regIdPop.test(document.getElementById("useridChk").value)){
				alert("아이디는 영문과 숫자를 조합한 6~12자리여야 합니다.");
				return false;
			}
		}
		// 상단으로 스크롤 이동
		function goTop(){
			$('html').scrollTop(0);
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
	<div class="member_wrap">
		<form method="post" id="memId" action="memberOk" enctype="multipart/form-data">
			<div id="memDiv1">
				<p class="m_title">회원가입</p>
				<p class="d_title">회원 정보 입력, 이메일 인증, 라이프 스타일을 등록 후 회원가입이 가능합니다.</p>
				<ul class="form_box choice" id="mem">
					<li><label><span class="red_txt">*</span>아이디</label>
						<input type="text" name="userid" id="userid" maxlength="12" value="testtest" placeholder="영문과 숫자를 조합한 6~12자리"/>
						<a class="white" id="idCheck">중복 확인</a>
					<input type="hidden" name="hiddenCheck" id="hiddenCheck" value="Y"/>
					</li>
						<li><label><span class="red_txt">*</span>비밀번호</label>
					<input type="password" name="userpwd" id="userpwd" value="qwer1234!" placeholder="영문과 숫자, 특수문자를 조합한 8~15자리"/></li>
						<li><label><span class="red_txt">*</span>비밀번호 확인</label>
					<input type="password" name="userpwd2" id="userpwd2" value="qwer1234!" placeholder="비밀번호를 재입력해주세요"/></li>
					<li><label><span class="red_txt">*</span>이름</label>
						<input type="text" name="username" id="username" value="홍길동" maxlength="4" placeholder="이름을 입력해주세요"/></li>
					<li><label><span class="red_txt">*</span>연락처</label>
						<select name="tel1" id="tel1">
							<c:forEach var="i1" items="${arr1}">
								<option value="${i1}">${i1}</option>
							</c:forEach>
						</select><span class="multi">-</span>
						<input type="text" name="tel2" id="tel2" value="1111" maxlength="4"/><span class="multi">-</span>
						<input type="text" name="tel3" id="tel3" value="1111" maxlength="4"/>
					</li>
					<li><label><span class="red_txt">*</span>생년월일</label>
						<input type="date" name="birth" id="birth" min="1960-01-01" max="${now}"/>
					</li>
					<li><label><span class="red_txt">*</span>성별</label>
						<div class="checks">
							<input type="radio" name="gender" id="gender1" value="1" checked/>
							<label for="gender1">여성</label>
							<input type="radio" name="gender" id="gender2" value="2"/>
							<label for="gender2">남성</label>
						</div>
					</li>
					<li id="proli"><span class="red_txt">*</span><label>프로필 사진</label>
						<div class="profile_div">
							<img class="profile_img" id="profileImg" name="profileImg" src="/home/img/choi/basic.png" alt="upload image"/><br/>
							<input type="file" accept="image/*" name="filename" id="profilePic" />
						</div>
					</li>
					<li id="a1"><label>&nbsp;희망 지역1</label>
						<select id="gu1" onchange="areaChange(this)">
							<option hidden>구를 선택해주세요</option>
							<c:forEach var="gu" items="${guArr}">
								<option value="${gu}">${gu}</option>
							</c:forEach>
						</select>
						<select id="dong1">
							<option hidden>동을 선택해주세요</option>
						</select>
						<input type="hidden" name="area1" id="area1" placeholder=""/>
					</li>
					<li id="a2"><label>&nbsp;희망 지역2</label>
						<select id="gu2" onchange="areaChange(this)">
							<option hidden>구를 선택해주세요</option>
							<c:forEach var="gu" items="${guArr}">
								<option value="${gu}">${gu}</option>
							</c:forEach>
						</select>
 
						<select id="dong2">
							<option hidden>동을 선택해주세요</option>
						</select>
						<input type="hidden" name="area2" id="area2" placeholder=""/>
					</li>					
					<li id="a3"><label>&nbsp;희망 지역3</label>
						<select id="gu3" onchange="areaChange(this)">
							<option hidden>구를 선택해주세요</option>
							<c:forEach var="gu" items="${guArr}">
								<option value="${gu}">${gu}</option>
							</c:forEach>
						</select>
 
						<select id="dong3">
							<option hidden>동을 선택해주세요</option>
						</select>
						<input type="hidden" name="area3" id="area3" placeholder=""/>
					</li>
					<li><label><span class="red_txt">*</span>이메일</label>
						<input type="text" name="emailid" id="emailid" value="0905cjw" placeholder="이메일"/><span>@</span> 
						<select name="emaildomain" id="emaildomain">
							<option value="naver.com">naver.com</option>
							<option value="nate.com">nate.com</option>
							<option value="hanmail.net">hamail.net</option>
							<option value="gmail.com" selected>gmail.com</option>
						</select>
						<a class="green" id="emailBtn">인증번호 전송</a>
					</li>
					<li>
						<label></label>
						<input type="text" name="emailCheck" id="emailCheck" value="111111" placeholder="인증번호를 입력해주세요"/>
						<a class="green" id="emailCheckBtn">인증번호 확인</a>
					</li>
				</ul>
				<a class="q_btn green" id="memNext1">다음</a>
			</div>
			<div id="memDiv2">
				<p class="m_title">가입 유형</p>
				<p class="d_title">가입하고자 하는 유형을 선택해주세요.</p>
				<div class="form_box">
					<div class="half">
						<div class="checks">
							<input type="radio" name="pcase" id="housemate1" value="h" checked/>
							<label for="housemate1">쉐어하우스</label>
							<p class="d_title">우리집에 입주할 메이트를 찾아요!</p>
						</div>
					</div>
					<div class="half">
						<div class="checks">
							<input type="radio" name="pcase" id="housemate2" value="m"/>
							<label for="housemate2">하우스메이트</label>
							<p class="d_title">쉐어하우스에 입주하고 싶어요!</p>
						</div>
					</div>
					<div class="btn_wrap">
						<a class="h_btn white" id="memPrev2">이전</a>
						<a class="h_btn green" id="memNext2">다음</a>
					</div>
				</div>
			</div>
			<div id="housemateChoice">
				<p class="m_title houseChoice">우리 하우스의 성향 등록</p>
				<p class="d_title houseChoice">우리 하우스의 라이프 스타일을 선택해주세요.</p>
				<p class="m_title mateChoice">희망하는 하우스의 성향 등록</p>
				<p class="d_title mateChoice">희망하는 하우스의 라이프 스타일을 선택해주세요.</p>
			</div>
			<div id="memDiv3">
				<div class="title_wrap">
					<p class="s_title">생활</p>
				</div>
				<ul class="form_box choice">
					<li><label><span class="red_txt">*</span>생활 소음</label>
						<div class="checks">
							<input type="radio" name="h_noise" id="h_noise1" value="1" checked/>
							<label for="h_noise1">매우 조용함</label>
							<input type="radio" name="h_noise" id="h_noise2" value="2"/>
							<label for="h_noise2">보통</label>
							<input type="radio" name="h_noise" id="h_noise3" value="3"/>
							<label for="h_noise3">조용하지 않음</label>
						</div>
					</li>
					<li><label><span class="red_txt">*</span>생활 시간</label>
						<div class="checks">
							<input type="radio" name="h_pattern" id="h_pattern1" value="1" checked/>
							<label for="h_pattern1">주행성</label>
							<input type="radio" name="h_pattern" id="h_pattern3" value="3"/>
							<label for="h_pattern3">야행성</label>
						</div>
					</li>
					<li><label><span  class="red_txt">*</span>하우스 내 애완동물 여부</label>
						<div class="checks">
							<input type="radio" name="h_pet" id="h_pet3" value="3" checked/>
							<label for="h_pet3">있음</label>
							<input type="radio" name="h_pet" id="h_pet1" value="1"/>
							<label for="h_pet1">없음</label>
						</div>
					</li>
					<li><label><span  class="red_txt">*</span>애완동물 동반 입주 여부</label>
						<div class="checks">
							<input type="radio" name="h_petwith" id="h_petwith3" value="3" checked/>
							<label for="h_petwith3">가능</label>
							<input type="radio" name="h_petwith" id="h_petwith1" value="1"/>
							<label for="h_petwith1">불가능</label>
						</div>
					</li>
					<li><label><span  class="red_txt">*</span>흡연</label>
						<div class="checks">
							<input type="radio" name="h_smoke" id="h_smoke1" value="1" checked/>
							<label for="h_smoke1">비흡연</label>
							<input type="radio" name="h_smoke" id="h_smoke2"value="2"/>
							<label for="h_smoke2">실외 흡연</label>
							<input type="radio" name="h_smoke" id="h_smoke3"value="3"/>
							<label for="h_smoke3">실내 흡연</label>
						</div>
					</li>
				</ul>
				<div class="btn_wrap">
					<a class="h_btn white" id="memPrev3">이전</a>
					<a class="h_btn green" id="memNext3">다음</a>
				</div>
			</div>
			<div id="memDiv4">
				<div class="title_wrap">
					<p class="s_title">소통</p>
				</div>
				<ul class="form_box choice">
					<li><label><span class="red_txt">*</span>분위기</label>
						<div class="checks">
							<input type="radio" name="h_mood" id="h_mood1" value="1" checked/>
							<label for="h_mood1">화목함</label>
							<input type="radio" name="h_mood" id="h_mood2" value="2"/>
							<label for="h_mood2">보통</label>
							<input type="radio" name="h_mood" id="h_mood3" value="3"/>
							<label for="h_mood3">독립적</label>
						</div>
					</li>
					<li><label><span class="red_txt">*</span>소통 방식</label>
						<div class="checks">
							<input type="radio" name="h_communication" id="h_communication3" value="3" checked/>
							<label for="h_communication3">대화</label>
							<input type="radio" name="h_communication" id="h_communication1" value="1"/>
							<label for="h_communication1">메신저</label>
							<input type="radio" name="h_communication" id="h_communication2" value="2"/>
							<label for="h_communication2">기타</label>
						</div>
					</li>
					<li><label><span class="red_txt">*</span>모임 빈도</label>
						<div class="checks">
							<input type="radio" name="h_party" id="h_party3" value="3" checked/>
							<label for="h_party3">자주</label>
							<input type="radio" name="h_party" id="h_party2" value="2"/>
							<label for="h_party2">가끔</label>
							<input type="radio" name="h_party" id="h_party1" value="1"/>
							<label for="h_party1">없음</label>
						</div>
					</li>
					<li><label><span class="red_txt">*</span>모임 참가 의무</label>
						<div class="checks">
							<input type="radio" name="h_enter" id="h_enter1" value="1" checked/>
							<label for="h_enter1">없음</label>
							<input type="radio" name="h_enter" id="h_enter2" value="2"/>
							<label for="h_enter2">상관없음</label>
							<input type="radio" name="h_enter" id="h_enter3" value="3"/>
							<label for="h_enter3">있음</label>
						</div>
					</li>
				</ul>
				<div class="btn_wrap">
					<a class="h_btn white" id="memPrev4">이전</a>
					<a class="h_btn green" id="memNext4">다음</a>
				</div>
			</div>
			<div id="memDiv5">
				<div class="title_wrap">
					<p class="s_title">서비스 및 기타</p>
				</div>
				<ul class="form_box choice">
					<li><label><span class="red_txt">*</span>하우스 내 지원 서비스</label>
						<div class="checks checkbox">
							<input type="checkbox" name="h_support" id="h_support1" value="1">
							<label for="h_support1">공용공간 청소 지원</label>
							<input type="checkbox" name="h_support" id="h_support2" value="2">
							<label for="h_support2">공용 생필품 지원</label><br/>
							<input type="checkbox" name="h_support" id="h_support3" value="3">
							<label for="h_support3">기본 식품 지원</label>
						</div>
					</li>
					<li><label></label></li>
					<li><label><span class="red_txt">*</span>기타</label>
						<div class="checks checkbox">
							<input type="checkbox" name="h_etc" id="h_etc1" value="1"/>
							<label for="h_etc1">보증금 조절 가능</label>
							<input type="checkbox" name="h_etc" id="h_etc3" value="3"/>
							<label for="h_etc3">즉시 입주 가능</label>
						</div>
					</li>
				</ul>
				<div class="btn_wrap">
					<a class="h_btn white" id="memPrev5">이전</a>
					<a class="h_btn green" id="memNext5">다음</a>
				</div>
			</div>
			<div id="hopeChoice">
				<p class="m_title houseChoice">희망하는 하우스메이트의 성향 등록</p>
				<p class="d_title houseChoice">희망하는 하우스메이트의 라이프 스타일을 등록해주세요</p>
				<p class="m_title mateChoice">나의 성향 등록</p>
				<p class="d_title mateChoice">나의 라이프 스타일을 선택해주세요.</p>
			</div>
			<div id="memDiv6">
				<div class="title_wrap">
					<p class="s_title">생활</p>
				</div>
				<ul class="form_box choice">
					<li><label><span class="red_txt">*</span>생활 시간</label>
						<div class="checks">
							<input type="radio" name="m_pattern" id="m_pattern1" value="1" checked/>
							<label for="m_pattern1">주행성</label>
							<input type="radio" name="m_pattern" id="m_pattern3" value="3"/>
							<label for="m_pattern3">야행성</label>
						</div>
					</li>
					<li><label><span  class="red_txt">*</span>성격</label>
						<div class="checks">
							<input type="radio" name="m_personality" id="m_personality1" value="1" checked/>
							<label for="m_personality1">내향적</label>
							<input type="radio" name="m_personality" id="m_personality3" value="3"/>
							<label for="m_personality3">외향적</label>
							<input type="radio" name="m_personality" id="m_personality2" value="2"/>
							<label for="m_personality2">상관없음</label>
						</div>
					</li>
					<li><label><span  class="red_txt">*</span>애완동물</label>
						<div class="checks">
							<input type="radio" name="m_pet" id="m_pet1" value="1" checked/>
							<label for="m_pet1">가능</label>
							<input type="radio" name="m_pet" id="m_pet3" value="3"/>
							<label for="m_pet3">불가능</label>
						</div>
					</li>
					<li><label><span  class="red_txt">*</span>흡연</label>
						<div class="checks">
							<input type="radio" name="m_smoke" id="m_smoke1" value="1" checked/>
							<label for="m_smoke1">비흡연</label>
							<input type="radio" name="m_smoke" id="m_smoke2"value="2"/>
							<label for="m_smoke2">실외 흡연</label>
							<input type="radio" name="m_smoke" id="m_smoke3"value="3"/>
							<label for="m_smoke3">실내 흡연</label>
						</div>
					</li>
				</ul>
				<div class="btn_wrap">
					<a class="h_btn white" id="memPrev6">이전</a>
					<a class="h_btn green" id="memNext6">다음</a>
				</div>
			</div>
			<div id="memDiv7">
				<div class="title_wrap">
					<p class="s_title">유형</p>
				</div>
				<ul class="form_box choice">
					<li><label><span class="red_txt">*</span>나이 대</label>
						<div class="checks">
							<input type="radio" name="m_age" id="m_age1" value="1" checked/>
							<label for="m_age1">20~30대</label>
							<input type="radio" name="m_age" id="m_age3" value="3"/>
							<label for="m_age3">40대</label>
							<input type="radio" name="m_age" id="m_age2" value="2"/>
							<label for="m_age2">상관없음</label>
						</div>
					</li>
					<li><label><span  class="red_txt">*</span>성별</label>
						<div class="checks">
							<input type="radio" name="m_gender" id="m_gender1" value="1" checked/>
							<label for="m_gender1">여성</label>
							<input type="radio" name="m_gender" id="m_gender3" value="3"/>
							<label for="m_gender3">남성</label>
							<input type="radio" name="m_gender" id="m_gender2" value="2"/>
							<label for="m_gender2">상관없음</label>
						</div>
					</li>
					<li><label><span  class="red_txt">*</span>외국인 입주 가능 여부</label>
						<div class="checks">
							<input type="radio" name="m_global" id="m_global3" value="3" checked/>
							<label for="m_global3">가능</label>
							<input type="radio" name="m_global" id="m_global1" value="1"/>
							<label for="m_global1">불가능</label>
						</div>
					</li>
					<li><label><span  class="red_txt">*</span>즉시 입주 가능 여부</label>
						<div class="checks">
							<input type="radio" name="m_now" id="m_now1" value="1" checked/>
							<label for="m_now1">가능</label>
							<input type="radio" name="m_now" id="m_now3"value="3"/>
							<label for="m_now3">불가능</label>
						</div>
					</li>
				</ul>
				<div class="btn_wrap">
					<a class="h_btn white" id="memPrev7">이전</a>
					<button class="h_btn green" id="memNext7">등록</button>
				</div>
			</div>
		</form>
	</div>
</div>
<div class="pup_wrap" id="idPopup">
	<div class="pup_form">
		<div class="pup_head">아이디 중복 확인</div>
		<div class="pup_body">
			<div class="member_wrap">
				<p class="s_title" id="distinct">아이디를 입력 후 중복 확인 버튼을 누르세요</p>
				<ul class="form_box choice">
					<li><label>아이디</label>
						<input type="text" id="useridChk" maxlength="12" placeholder="영문과 숫자를 조합한 6~12자리"/>
						<button class="white" id="popIdChk">중복 확인</button>
					</li>
				</ul>
			</div>
			<div class="center">
				<div id="idResult"></div>
				<a class="green" id="setId">아이디 사용하기</a>
			</div>
		</div>
		<a class="btn_close" id="idPopupClose">닫기</a>
	</div>
</div>
</body>
</html>