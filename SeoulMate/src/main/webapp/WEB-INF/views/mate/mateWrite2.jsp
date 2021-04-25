<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="wrap">
<p class="m_title">메이트 등록하기 </p> <br/>
	
	<div class="title_wrap">
	<p class="s_title">선호하는 하우스성향 선택 </p> <br/>
	

<ul class="form_box choice">

	<li>
		<label><span class="red_txt">*</span>생활소음</label>
		<div class="checks">
			<input type="radio" id="radio1" name="character1"> 
			<label for="radio1">조용함</label>
			
			<input type="radio" id="radio2" name="character1"> 
			<label for="radio2">보통</label>
			
			<input type="radio" id="radio3" name="character1"> 
			<label for="radio3">활발함</label>
			
			<input type="radio" id="radio3" name="character1"> 
			<label for="radio4">상관없음</label>
		</div>
	</li>
	
	<li>
		<label><span class="red_txt">*</span>생활 시간</label>
		<div class="checks">
			<input type="radio" id="radio1" name="character1"> 
			<label for="radio1">야행성</label>
			<input type="radio" id="radio2" name="character1"> 
			<label for="radio2">주행성</label>
			<input type="radio" id="radio3" name="character1"> 
			<label for="radio3">상관없음</label>
		</div>
	</li>
	
	<li>
		<label><span class="red_txt">*</span>반려동물</label>
		<div class="checks">
			<input type="radio" id="radio1" name="character1"> 
			<label for="radio1">있음</label>
			<input type="radio" id="radio2" name="character1"> 
			<label for="radio2">없음</label>
			<input type="radio" id="radio3" name="character1"> 
			<label for="radio3">상관없음</label>
		</div>
	</li>
	
	<li>
		<label><span class="red_txt">*</span>반려동물 선호도</label>
		<div class="checks">
			<input type="radio" id="radio1" name="character1"> 
			<label for="radio1">가능</label>
			<input type="radio" id="radio2" name="character1"> 
			<label for="radio2">불가능</label>
		</div>
	</li>
	
	<li>
		<label><span class="red_txt">*</span>흡연</label>
		<div class="checks">
			<input type="radio" id="radio1" name="character1"> 
			<label for="radio1">실내흡연</label>
			<input type="radio" id="radio2" name="character1"> 
			<label for="radio2">실외흡연</label>
			<input type="radio" id="radio3" name="character1"> 
			<label for="radio3">비흡연</label>
			<input type="radio" id="radio3" name="character1"> 
			<label for="radio4">상관없음</label>
		</div>
	</li>
	
	<li>
		<label><span class="red_txt">*</span>연령대</label>
		<div class="checks">
			<input type="radio" id="radio1" name="character1"> 
			<label for="radio1">20대</label>
			<input type="radio" id="radio2" name="character1"> 
			<label for="radio2">30대</label>
			<input type="radio" id="radio3" name="character1"> 
			<label for="radio3">40대</label>
			<input type="radio" id="radio3" name="character1"> 
			<label for="radio4">상관없음</label>
		</div>
	</li>	
	
		
	
</ul>	
	<button class="green" onclick="location.href='<%=request.getContextPath()%>/mateWrite1'" >이전</button>
	<button class="green" onclick="location.href='<%=request.getContextPath()%>/mateWrite3'" >다음</button>  
	<button class="green" >취소</button>		
	
	</div>
</div>

</body>
</html>