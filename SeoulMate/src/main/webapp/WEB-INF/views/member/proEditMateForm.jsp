<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/home/css/choi.css"/>
<script>
	$(function(){
		// 1
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
			$("#mateChoice").css("display", "none");
			$("#hopeChoice").css("display", "block");
			goTop();
		});
		// 6
		$("#memPrev6").click(function(){
			$("#memDiv5").css("display","block");
			$("#memDiv6").css("display","none");			
			$("#mateChoice").css("display", "block");
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
			var hopeGender=document.form.m_gender.value;
			if(hopeGender==${vo.gender} || hopeGender==2){
				editOk();
			}else if(hopeGender!=${vo.gender} && hopeGender!=2){
				alert("?????? ????????? ????????? ?????? ????????? ??? ????????????.");
				return false;
			}
			return false;
			goTop();
		});
		
		function editOk(){
			if(confirm("????????? ?????????????????????????")){
				$("#proId").submit();
			}
		}
		// ???????????? ????????? ??????
		function goTop(){
			$('html').scrollTop(0);
		}
	});
</script>
<div class="wrap">
	<div class="member_wrap">
		<form method="post" name="form" id="proId" action="proEditMateOk">
			<div id="mateChoice">
				<p class="m_title">???????????? ???????????? ?????? ??????</p>
				<p class="d_title">???????????? ???????????? ????????? ???????????? ??????????????????.</p>
			</div>
			<div id="memDiv3">
				<div class="title_wrap">
					<p class="s_title">??????</p>
				</div>
				<ul class="form_box choice">
					<li><label><span class="red_txt">*</span>?????? ??????</label>
						<div class="checks">
							<input type="radio" name="h_noise" id="h_noise1" value="1" <c:if test="${pVO.h_noise==1}">checked</c:if>/>
							<label for="h_noise1">?????? ?????????</label>
							<input type="radio" name="h_noise" id="h_noise2" value="2" <c:if test="${pVO.h_noise==2}">checked</c:if>/>
							<label for="h_noise2">??????</label>
							<input type="radio" name="h_noise" id="h_noise3" value="3" <c:if test="${pVO.h_noise==3}">checked</c:if>/>
							<label for="h_noise3">???????????? ??????</label>
						</div>
					</li>
					<li><label><span class="red_txt">*</span>?????? ??????</label>
						<div class="checks">
							<input type="radio" name="h_pattern" id="h_pattern1" value="1" <c:if test="${pVO.h_pattern==1}">checked</c:if>/>
							<label for="h_pattern1">?????????</label>
							<input type="radio" name="h_pattern" id="h_pattern3" value="3" <c:if test="${pVO.h_pattern==3}">checked</c:if>/>
							<label for="h_pattern3">?????????</label>
						</div>
					</li>
					<li><label><span  class="red_txt">*</span>???????????? ??????</label>
						<div class="checks">
							<input type="radio" name="h_pet" id="h_pet3" value="3" <c:if test="${pVO.h_pet==3}">checked</c:if>/>
							<label for="h_pet3">??????</label>
							<input type="radio" name="h_pet" id="h_pet1" value="1" <c:if test="${pVO.h_pet==1}">checked</c:if>/>
							<label for="h_pet1">??????</label>
						</div>
					</li>
					<li><label><span  class="red_txt">*</span>???????????? ?????? ?????? ??????</label>
						<div class="checks">
							<input type="radio" name="h_petwith" id="h_petwith3" value="3" <c:if test="${pVO.h_petwith==3}">checked</c:if>/>
							<label for="h_petwith3">??????</label>
							<input type="radio" name="h_petwith" id="h_petwith1" value="1" <c:if test="${pVO.h_petwith==1}">checked</c:if>/>
							<label for="h_petwith1">?????????</label>
						</div>
					</li>
					<li><label><span  class="red_txt">*</span>??????</label>
						<div class="checks">
							<input type="radio" name="h_smoke" id="h_smoke1" value="1" <c:if test="${pVO.h_smoke==1}">checked</c:if>/>
							<label for="h_smoke1">?????????</label>
							<input type="radio" name="h_smoke" id="h_smoke2"value="2" <c:if test="${pVO.h_smoke==2}">checked</c:if>/>
							<label for="h_smoke2">?????? ??????</label>
							<input type="radio" name="h_smoke" id="h_smoke3"value="3" <c:if test="${pVO.h_smoke==3}">checked</c:if>/>
							<label for="h_smoke3">?????? ??????</label>
						</div>
					</li>
				</ul>
				<div class="btn_wrap">
					<a class="q_btn green" id="memNext3">??????</a>
				</div>
			</div>
			<div id="memDiv4">
				<div class="title_wrap">
					<p class="s_title">??????</p>
				</div>
				<ul class="form_box choice">
					<li><label><span class="red_txt">*</span>?????????</label>
						<div class="checks">
							<input type="radio" name="h_mood" id="h_mood1" value="1" <c:if test="${pVO.h_mood==1}">checked</c:if>/>
							<label for="h_mood1">?????????</label>
							<input type="radio" name="h_mood" id="h_mood2" value="2" <c:if test="${pVO.h_mood==2}">checked</c:if>/>
							<label for="h_mood2">??????</label>
							<input type="radio" name="h_mood" id="h_mood3" value="3" <c:if test="${pVO.h_mood==3}">checked</c:if>/>
							<label for="h_mood3">?????????</label>
						</div>
					</li>
					<li><label><span class="red_txt">*</span>?????? ??????</label>
						<div class="checks checkbox">
							<input type="radio" name="h_communication" id="h_communication3" value="3" <c:if test="${pVO.h_communication==3}">checked</c:if>/>
							<label class="amm" for="h_communication3">??????</label>
							<input type="radio" name="h_communication" id="h_communication1" value="1" <c:if test="${pVO.h_communication==1}">checked</c:if>/>
							<label class="amm" for="h_communication1">?????????</label>
							<input type="radio" name="h_communication" id="h_communication2" value="2" <c:if test="${pVO.h_communication==2}">checked</c:if>/>
							<label class="amm" for="h_communication2">??????</label>
						</div>
					</li>
					<li><label><span class="red_txt">*</span>?????? ??????</label>
						<div class="checks">
							<input type="radio" name="h_party" id="h_party3" value="3" <c:if test="${pVO.h_party==3}">checked</c:if>/>
							<label for="h_party3">??????</label>
							<input type="radio" name="h_party" id="h_party2" value="2" <c:if test="${pVO.h_party==2}">checked</c:if>/>
							<label for="h_party2">??????</label>
							<input type="radio" name="h_party" id="h_party1" value="1" <c:if test="${pVO.h_party==1}">checked</c:if>/>
							<label for="h_party1">??????</label>
						</div>
					</li>
					<li><label><span class="red_txt">*</span>?????? ?????? ??????</label>
						<div class="checks">
							<input type="radio" name="h_enter" id="h_enter1" value="1" <c:if test="${pVO.h_enter==1}">checked</c:if>/>
							<label for="h_enter1">??????</label>
							<input type="radio" name="h_enter" id="h_enter2" value="2" <c:if test="${pVO.h_enter==2}">checked</c:if>/>
							<label for="h_enter2">????????????</label>
							<input type="radio" name="h_enter" id="h_enter3" value="3" <c:if test="${pVO.h_enter==3}">checked</c:if>/>
							<label for="h_enter3">??????</label>
						</div>
					</li>
				</ul>
				<div class="btn_wrap">
					<a class="h_btn white" id="memPrev4">??????</a>
					<a class="h_btn green" id="memNext4">??????</a>
				</div>
			</div>
			<div id="memDiv5">
				<div class="title_wrap">
					<p class="s_title">????????? ??? ??????</p>
				</div>
				<ul class="form_box choice">
					<li><label><span class="red_txt">*</span>????????? ??? ?????? ?????????</label>
						<div class="checks checkbox">
							<input type="checkbox" name="h_support" id="h_support1" value="1" <c:forEach var="i" items="${pVO.h_support}"><c:if test="${i=='1'}">checked</c:if></c:forEach>>
							<label for="h_support1">???????????? ?????? ??????</label>
							<input type="checkbox" name="h_support" id="h_support2" value="2" <c:forEach var="i" items="${pVO.h_support}"><c:if test="${i=='2'}">checked</c:if></c:forEach>>
							<label for="h_support2">?????? ????????? ??????</label><br/>
							<input type="checkbox" name="h_support" id="h_support3" value="3" <c:forEach var="i" items="${pVO.h_support}"><c:if test="${i=='3'}">checked</c:if></c:forEach>>
							<label for="h_support3">?????? ?????? ??????</label>
						</div>
					</li>
					<li><label></label></li>
					<li><label><span class="red_txt">*</span>??????</label>
						<div class="checks checkbox">
							<input type="checkbox" name="h_etc" id="h_etc1" value="1" <c:forEach var="i" items="${pVO.h_etc}"><c:if test="${i=='1'}">checked</c:if></c:forEach>/>
							<label for="h_etc1">????????? ?????? ??????</label>
							<input type="checkbox" name="h_etc" id="h_etc3" value="3" <c:forEach var="i" items="${pVO.h_etc}"><c:if test="${i=='3'}">checked</c:if></c:forEach>/>
							<label for="h_etc3">?????? ?????? ??????</label>
						</div>
					</li>
				</ul>
				<div class="btn_wrap">
					<a class="h_btn white" id="memPrev5">??????</a>
					<a class="h_btn green" id="memNext5">??????</a>
				</div>
			</div>
			<div id="hopeChoice">
				<p class="m_title">?????? ?????? ??????</p>
				<p class="d_title">?????? ????????? ???????????? ??????????????????.</p>
			</div>
			<div id="memDiv6">
				<div class="title_wrap">
					<p class="s_title">??????</p>
				</div>
				<ul class="form_box choice">
					<li><label><span class="red_txt">*</span>?????? ??????</label>
						<div class="checks">
							<input type="radio" name="m_pattern" id="m_pattern1" value="1" <c:if test="${pVO.m_pattern==1}">checked</c:if>/>
							<label for="m_pattern1">?????????</label>
							<input type="radio" name="m_pattern" id="m_pattern3" value="3" <c:if test="${pVO.m_pattern==3}">checked</c:if>/>
							<label for="m_pattern3">?????????</label>
						</div>
					</li>
					<li><label><span  class="red_txt">*</span>??????</label>
						<div class="checks">
							<input type="radio" name="m_personality" id="m_personality1" value="1" <c:if test="${pVO.m_personality==1}">checked</c:if>/>
							<label for="m_personality1">?????????</label>
							<input type="radio" name="m_personality" id="m_personality3" value="3" <c:if test="${pVO.m_personality==3}">checked</c:if>/>
							<label for="m_personality3">?????????</label>
							<input type="radio" name="m_personality" id="m_personality2" value="2" <c:if test="${pVO.m_personality==2}">checked</c:if>/>
							<label for="m_personality2">????????????</label>
						</div>
					</li>
					<li><label><span  class="red_txt">*</span>????????????</label>
						<div class="checks">
							<input type="radio" name="m_pet" id="m_pet1" value="1" <c:if test="${pVO.m_pet==1}">checked</c:if>/>
							<label for="m_pet1">?????????</label>
							<input type="radio" name="m_pet" id="m_pet3" value="3" <c:if test="${pVO.m_pet==3}">checked</c:if>/>
							<label for="m_pet3">?????????</label>
						</div>
					</li>
					<li><label><span  class="red_txt">*</span>??????</label>
						<div class="checks">
							<input type="radio" name="m_smoke" id="m_smoke1" value="1" <c:if test="${pVO.m_smoke==1}">checked</c:if>/>
							<label for="m_smoke1">?????????</label>
							<input type="radio" name="m_smoke" id="m_smoke2"value="2" <c:if test="${pVO.m_smoke==2}">checked</c:if>/>
							<label for="m_smoke2">?????? ??????</label>
							<input type="radio" name="m_smoke" id="m_smoke3"value="3" <c:if test="${pVO.m_smoke==3}">checked</c:if>/>
							<label for="m_smoke3">?????? ??????</label>
						</div>
					</li>
				</ul>
				<div class="btn_wrap">
					<a class="h_btn white" id="memPrev6">??????</a>
					<a class="h_btn green" id="memNext6">??????</a>
				</div>
			</div>
			<div id="memDiv7">
				<div class="title_wrap">
					<p class="s_title">??????</p>
				</div>
				<ul class="form_box choice">
					<li><label><span class="red_txt">*</span>?????? ???</label>
						<div class="checks">
							<input type="radio" name="m_age" id="m_age1" value="1" <c:if test="${pVO.m_age==1}">checked</c:if>/>
							<label for="m_age1">20~30???</label>
							<input type="radio" name="m_age" id="m_age3" value="3" <c:if test="${pVO.m_age==3}">checked</c:if>/>
							<label for="m_age3">40???</label>
							<input type="radio" name="m_age" id="m_age2" value="2" <c:if test="${pVO.m_age==2}">checked</c:if>/>
							<label for="m_age2">????????????</label>
						</div>
					</li>
					<li><label><span  class="red_txt">*</span>??????</label>
						<div class="checks">
							<input type="radio" name="m_gender" id="m_gender1" value="1" <c:if test="${pVO.m_gender==1}">checked</c:if>/>
							<label for="m_gender1">??????</label>
							<input type="radio" name="m_gender" id="m_gender3" value="3" <c:if test="${pVO.m_gender==3}">checked</c:if>/>
							<label for="m_gender3">??????</label>
							<input type="radio" name="m_gender" id="m_gender2" value="2" <c:if test="${pVO.m_gender==2}">checked</c:if>/>
							<label for="m_gender2">????????????</label>
						</div>
					</li>
					<li><label><span  class="red_txt">*</span>????????? ?????? ?????? ??????</label>
						<div class="checks">
							<input type="radio" name="m_global" id="m_global3" value="3" <c:if test="${pVO.m_global==3}">checked</c:if>/>
							<label for="m_global3">??????</label>
							<input type="radio" name="m_global" id="m_global1" value="1" <c:if test="${pVO.m_global==1}">checked</c:if>/>
							<label for="m_global1">?????????</label>
						</div>
					</li>
					<li><label><span  class="red_txt">*</span>?????? ?????? ?????? ??????</label>
						<div class="checks">
							<input type="radio" name="m_now" id="m_now1" value="1" <c:if test="${pVO.m_now==1}">checked</c:if>/>
							<label for="m_now1">??????</label>
							<input type="radio" name="m_now" id="m_now3"value="3" <c:if test="${pVO.m_now==3}">checked</c:if>/>
							<label for="m_now3">?????????</label>
						</div>
					</li>
				</ul>
				<div class="btn_wrap">
					<a class="h_btn white" id="memPrev7">??????</a>
					<button class="h_btn green" id="memNext7">??????</button>
				</div>
			</div>
		</form>
	</div>
</div>
</body>
</html>