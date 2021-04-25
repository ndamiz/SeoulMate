<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="wrap">
<p class="m_title">하우스 등록하기 </p> <br/>
	<div class="title_wrap">
	<p class="s_title">하우스 성향 등록 </p> <br/>
	

1. 생활정보 <br/>

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
		</div>
	</li>
	
	<li>
		<label><span class="red_txt">*</span>생활시간</label>
		<div class="checks">
			<input type="radio" id="radio4" name="character2"> 
			<label for="radio4">야행성</label>
			
			<input type="radio" id="radio5" name="character2"> 
			<label for="radio5">주행성</label>
		</div>
	</li>
	
		<li>
		<label><span class="red_txt">*</span>반려동물</label>
		<div class="checks">
			<input type="radio" id="radio6" name="character3"> 
			<label for="radio6">있음</label>
			
			<input type="radio" id="radio7" name="character3"> 
			<label for="radio7">없음</label>
		</div>
	</li>
	
	<li>
		<label><span class="red_txt">*</span>반려동물 거주</label>
		<div class="checks">
			<input type="radio" id="radio8" name="character4"> 
			<label for="radio8">가능</label>
			
			<input type="radio" id="radio9" name="character4"> 
			<label for="radio9">불가능</label>
		</div>
	</li>
	
	<li>
		<label><span class="red_txt">*</span>흡연</label>
		<div class="checks">
			<input type="radio" id="radio10" name="character5"> 
			<label for="radio10">실내흡연</label>
			
			<input type="radio" id="radio11" name="character5"> 
			<label for="radio11">실외흡연</label>
			
			<input type="radio" id="radio12" name="character5"> 
			<label for="radio12">비흡연</label>
		</div>
	</li>

</ul>

<div class="btnclass">
<button class="green" onclick="location.href='<%=request.getContextPath()%>/houseWrite2'">이전</button>
	<button class="green" onclick="location.href='<%=request.getContextPath()%>/houseWrite4'">다음</button>  
<button class="green" >취소</button>
	</div>
	
	</div>
</div>	
</body>
</html>