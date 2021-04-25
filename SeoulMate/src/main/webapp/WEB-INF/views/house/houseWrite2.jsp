<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="wrap">
<p class="m_title">하우스 등록하기 </p> <br/>
	<div class="title_wrap">
		<p class="s_title">공용 시설 정보 등록 </p>
	</div>
	
	<ul class="form_box choice">

		<li>
			<label><span class="red_txt">*</span>주방</label>
			<div class="checks">
				<input type="checkbox" id="check1" name="character1"> 
				<label for="check1">냉장고</label>
				<input type="checkbox" id="check2" name="character1"> 
				<label for="check2">정수기</label>
				<input type="checkbox" id="check3" name="character1"> 
				<label for="check3">가스레인지</label>
				<input type="checkbox" id="check4" name="character1"> 
				<label for="check4">밥솥</label> <br/>
				<input type="checkbox" id="check5" name="character1">  
				<label for="check5">식기세척기</label>
				<input type="checkbox" id="check6" name="character1"> 
				<label for="check6">냄비</label>
				<input type="checkbox" id="check7" name="character1"> 
				<label for="check7">프라이팬</label>
				<input type="checkbox" id="check8" name="character1"> 
				<label for="check8">토스트기</label> <br/>
			</div>
		</li> <br/> <br/>
		<hr>
		<li>
			<label><span class="red_txt">*</span>거실</label>
			<div class="checks">
				<input type="checkbox" id="check9" name="character2"> 
				<label for="check9">소파</label>
				<input type="checkbox" id="check10" name="character2"> 
				<label for="check10">티비</label>
				<input type="checkbox" id="check11" name="character2"> 
				<label for="check11">탁자</label>
				<input type="checkbox" id="check12" name="character2"> 
				<label for="check12">카펫</label> <br/>
			</div>
		</li>
		
		<li>
			<label><span class="red_txt">*</span>욕실</label>
			<div class="checks">
				<input type="checkbox" id="check13" name="character3"> 
				<label for="check13">욕조</label>
				<input type="checkbox" id="check14" name="character3"> 
				<label for="check14">비데</label>
				<input type="checkbox" id="check15" name="character3"> 
				<label for="check15">샴푸</label>
				<input type="checkbox" id="check16" name="character3"> 
				<label for="check16">린스</label> <br/>
			</div>
		</li>
		
		<li>
			<label><span class="red_txt">*</span>기타</label>
			<div class="checks">
				<input type="checkbox" id="check17" name="character4"> 
				<label for="check17">세탁기</label>
				<input type="checkbox" id="check18" name="character4"> 
				<label for="check18">건조기</label>
				<input type="checkbox" id="check19" name="character4"> 
				<label for="check19">베란다</label>
				<input type="checkbox" id="check20" name="character4"> 
				<label for="check20">WIFI</label> <br/>
			</div>
		</li>
		
	</ul>	
	<div class="btnclass">
	<button class="green" onclick="location.href='<%=request.getContextPath()%>/houseWrite1'" >이전</button>
	<button class="green" onclick="location.href='<%=request.getContextPath()%>/houseWrite3'" >다음</button> 
	<button class="green" >취소</button> 
	</div>
	
	</div>
