<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/home/css/choi.css"/>
<script>
<<<<<<< HEAD
	$(function(){
		$("#birth1").val("1995").attr("selected", true);
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
		var popupWidth=600;
		var popupHeight=230;
		var popupX=(window.screen.width/2)-(popupWidth/2);
		// 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음
=======
   $(function(){
      $("#birth1").val("1995").attr("selected", true);
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
      var popupWidth=600;
      var popupHeight=230;
      var popupX=(window.screen.width/2)-(popupWidth/2);
      // 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음
>>>>>>> refs/remotes/origin/yeonju

<<<<<<< HEAD
		var popupY=(window.screen.height/2)-(popupHeight/2);
		
		$("#idCheck").click(function(){
			if($("#userid").val()!=""){
				window.open("idCheck?userid="+$("#userid").val(), "idchk", 'height='+popupHeight+', width='+popupWidth+', left='+ popupX + ', top='+ popupY);
			}else{
				alert("아이디를 입력 후 중복 검사를 눌러주세요");
			}
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
			if($("#birth1").val()==""){
				alert("연도를 선택하세요");
				return false;
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
		
		// 하우스를 선택했는지 메이트를 선택했는지 구분
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
			// 월
			var regBirth2=/(0[1-9]|1[012])$/;
			var Birth2=document.getElementById("birth2").value;
			if(document.getElementById("birth2").value.length==1){
				Birth2="0"+Birth2;
				document.getElementById("birth2").value=Birth2;
			} 
			if(!regBirth2.test(Birth2)){ // 월
				alert("월을 정확하게 입력해주세요.");
				return false;
			}
			// 일
			var regBirth3=/(0[1-9]|[12][0-9]|3[0-1])$/;
			var Birth3=document.getElementById("birth3").value;
			if(document.getElementById("birth3").value.length==1){
				Birth3="0"+Birth3;
				document.getElementById("birth3").value=Birth3;
			} 
			if(!regBirth3.test(Birth3)){ // 월
				alert("일을 정확하게 입력해주세요.");
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
=======
      var popupY=(window.screen.height/2)-(popupHeight/2);
      
      $("#idCheck").click(function(){
         if($("#userid").val()!=""){
            window.open("idCheck?userid="+$("#userid").val(), "idchk", 'height='+popupHeight+', width='+popupWidth+', left='+ popupX + ', top='+ popupY);
         }else{
            alert("아이디를 입력 후 중복 검사를 눌러주세요");
         }
      });
      // 1
      $("#memNext1").click(function(){
         // 희망 지역1
         var area1=$("#gu1").val();
         // alert(area1);
         if(area1=="구를 선택해주세요"){
            area1="";
         }else{
            area1+=" "+$("#dong").val();
         }
         document.getElementById("area1").value=area1;
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
         if($("#birth1").val()==""){
            alert("연도를 선택하세요");
            return false;
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
      
      // 하우스를 선택했는지 메이트를 선택했는지 구분
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
         // 월
         var regBirth2=/(0[1-9]|1[012])$/;
         var Birth2=document.getElementById("birth2").value;
         if(document.getElementById("birth2").value.length==1){
            Birth2="0"+Birth2;
            document.getElementById("birth2").value=Birth2;
         } 
         if(!regBirth2.test(Birth2)){ // 월
            alert("월을 정확하게 입력해주세요.");
            return false;
         }
         // 일
         var regBirth3=/(0[1-9]|[12][0-9]|3[0-1])$/;
         var Birth3=document.getElementById("birth3").value;
         if(document.getElementById("birth3").value.length==1){
            Birth3="0"+Birth3;
            document.getElementById("birth3").value=Birth3;
         } 
         if(!regBirth3.test(Birth3)){ // 월
            alert("일을 정확하게 입력해주세요.");
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
      // 상단으로 스크롤 이동
      function goTop(){
         $('html').scrollTop(0);
      }
      
      // 프로필 사진
      $("#inProfile").on('change', function(){
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
   // 희망 지역 1
   function areaChange(e) {
      var gangnam = ["개포동","논현동","대치동","도곡동","삼성동","세곡동","수서동","신사동","압구정동","역삼동","일원동","청담동"];
      var gangdong = ["강일동","고덕동","길동","둔촌동","명일동","상일동","성내동","암사동","천호동"];
      var gangseo = ["미아동","번동","삼각산동","삼양동","송중동","송천동","수유동","우이동","인수동"];
      var target = document.getElementById("dong");
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
   
>>>>>>> refs/remotes/origin/yeonju
</script>
<style>
#proli{height:125px;}
</style>
<div class="wrap">
<<<<<<< HEAD
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
						<select name="birth1" id="birth1">
							<option value="">연도</option>
							<c:forEach var="i" begin="0" end="${year-1930}">
								<c:set var="yearOption" value="${year-i}"/>
								<option value="${yearOption}">${yearOption}</option>
							</c:forEach>
						</select><span>년</span> 
						<input type="text" name="birth2" id="birth2" value="1" maxlength="2"/><span>월</span>
						<input type="text" name="birth3" id="birth3" value="1" maxlength="2"/><span>일</span>
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
						<div style="margin:5px 0 0 20px;">
							<img id="profileImg" name="profileImg" src="<%=request.getContextPath()%>/img/choi/pepe_1.png" alt="upload image" style="width:150px; height:107px;"/>
							<input type="file" accept="image/*" name="profilePic" id="profilePic" />
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
							<input type="radio" name="housemate" id="housemate1" value="쉐어하우스" checked/>
							<label for="housemate1">쉐어하우스</label>
							<p class="d_title">우리집에 입주할 메이트를 찾아요!</p>
						</div>
					</div>
					<div class="half">
						<div class="checks">
							<input type="radio" name="housemate" id="housemate2" value="하우스메이트"/>
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
				<p class="m_title mateChoice">원하는 하우스의 성향 등록</p>
				<p class="d_title mateChoice">원하는 하우스의 라이프 스타일을 선택해주세요.</p>
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
						<div class="checks">
							<input type="checkbox" name="h_supportArr" id="h_support1" value="1">
							<label for="h_support1">공용공간 청소 지원</label>
							<input type="checkbox" name="h_supportArr" id="h_support2" value="2">
							<label for="h_support2">공용 생필품 지원</label><br/>
							<input type="checkbox" name="h_supportArr" id="h_support3" value="3">
							<label for="h_support3">기본 식품 지원</label>
						</div>
					</li>
					<li><label></label></li>
					<li><label><span class="red_txt">*</span>기타</label>
						<div class="checks">
							<input type="checkbox" name="h_etcArr" id="h_etc1" value="1"/>
							<label for="h_etc1">보증금 조절 가능</label>
							<input type="checkbox" name="h_etcArr" id="h_etc3" value="3"/>
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
				<p class="m_title houseChoice">희망 성향 등록</p>
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
=======
   <div class="member_wrap">
      <form method="post" id="memId" action="memberOk">
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
                  <select name="birth1" id="birth1">
                     <option value="">연도</option>
<%--                      <c:forEach var="i" begin="0" end="${year-1930}"> --%>
<%--                         <c:set var="yearOption" value="${year-i}"/> --%>
<%--                         <option value="${yearOption}">${yearOption}</option> --%>
<%--                      </c:forEach> --%>
                  </select><span>년</span> 
                  <input type="text" name="birth2" id="birth2" value="1" maxlength="2"/><span>월</span>
                  <input type="text" name="birth3" id="birth3" value="1" maxlength="2"/><span>일</span>
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
                  <div style="margin:5px 0 0 20px;">
                     <img id="profileImg" name="profilePic" src="<%=request.getContextPath()%>/img/choi/pepe_1.png" alt="upload image" style="width:150px; height:107px;"/>
                     <input type="file" accept="image/*" id="inProfile" />
                  </div>
               </li>
               <li><label>&nbsp;희망 지역1</label>
                  <select id="gu1" onchange="areaChange(this)">
                     <option>구를 선택해주세요</option>
                     <option value="강남구">강남구</option>
                     <option value="강동구">강동구</option>
                     <option value="강서구">강서구</option>
                  </select>
 
                  <select id="dong">
                     <option>동을 선택해주세요</option>
                  </select>

                  <input type="text" name="area1" id="area1" placeholder=""/>
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
                     <input type="radio" name="housemate" id="housemate1" value="쉐어하우스" checked/>
                     <label for="housemate1">쉐어하우스</label>
                     <p class="d_title">우리집에 입주할 메이트를 찾아요!</p>
                  </div>
               </div>
               <div class="half">
                  <div class="checks">
                     <input type="radio" name="housemate" id="housemate2" value="하우스메이트"/>
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
            <p class="m_title mateChoice">원하는 하우스의 성향 등록</p>
            <p class="d_title mateChoice">원하는 하우스의 라이프 스타일을 선택해주세요.</p>
         </div>
         <div id="memDiv3">
            <div class="title_wrap">
               <p class="s_title">생활</p>
            </div>
            <ul class="form_box choice">
               <li><label><span class="red_txt">*</span>생활 소음</label>
                  <div class="checks">
                     <input type="radio" name="h_noise" id="h_noise1" value="1" checked/>
                     <label for="h_noise1">자주</label>
                     <input type="radio" name="h_noise" id="h_noise2" value="2"/>
                     <label for="h_noise2">가끔</label>
                     <input type="radio" name="h_noise" id="h_noise3" value="3"/>
                     <label for="h_noise3">없음</label>
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
                     <label for="h_enter1">매우 조용함</label>
                     <input type="radio" name="h_enter" id="h_enter2" value="2"/>
                     <label for="h_enter2">보통</label>
                     <input type="radio" name="h_enter" id="h_enter3" value="3"/>
                     <label for="h_enter3">조용하지 않음</label>
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
                  <div class="checks">
                     <input type="checkbox" name="h_support" id="h_support1">
                     <label for="h_support1">공용공간 청소 지원</label>
                     <input type="checkbox" name="h_support" id="h_support2">
                     <label for="h_support2">공용 생필품 지원</label><br/>
                     <input type="checkbox" name="h_support" id="h_support3">
                     <label for="h_support3">기본 식품 지원</label>
                  </div>
               </li>
               <li><label></label></li>
               <li><label><span class="red_txt">*</span>기타</label>
                  <div class="checks">
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
            <p class="m_title houseChoice">희망 성향 등록</p>
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
                     <input type="radio" name="m_global" id="m_global" value="3" checked/>
                     <label for="m_global3">가능</label>
                     <input type="radio" name="m_global" id="m_global" value="1"/>
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
>>>>>>> refs/remotes/origin/yeonju
</div>
</body>
</html>