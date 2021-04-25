<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="wrap">
<p class="m_title">메이트 등록하기 </p> <br/>
	<div class="title_wrap">
	<p class="s_title">원하는 하우스 성향 등록 </p> <br/>
2. 소통정보 <br/>

<ul class="form_box choice">

	<li>
		<label><span class="red_txt">*</span>분위기</label>
		<div class="checks">
			<input type="radio" id="radio1" name="character1"> 
			<label for="radio1">화목함</label>
			
			<input type="radio" id="radio2" name="character1"> 
			<label for="radio2">보통</label>
			
			<input type="radio" id="radio3" name="character1"> 
			<label for="radio3">독립적</label>
			
			<input type="radio" id="radio3" name="character1"> 
			<label for="radio4">상관없음</label>
		</div>
	</li>
	
		<li>
		<label><span class="red_txt">*</span>소통방식</label>
		<div class="checks">
			<input type="radio" id="radio1" name="character1"> 
			<label for="radio1">대화</label>
			
			<input type="radio" id="radio2" name="character1"> 
			<label for="radio2">기타</label>
		</div>
	</li>
	
		<li>
		<label><span class="red_txt">*</span>모임빈도</label>
		<div class="checks">
			<input type="radio" id="radio1" name="character1"> 
			<label for="radio1">없음</label>
			
			<input type="radio" id="radio2" name="character1"> 
			<label for="radio2">가끔</label>
			
			<input type="radio" id="radio3" name="character1"> 
			<label for="radio3">보통</label>
			
			<input type="radio" id="radio3" name="character1"> 
			<label for="radio4">자주</label>
			
			<input type="radio" id="radio3" name="character1"> 
			<label for="radio5">상관없음</label>
		</div>
	</li>
	
		<li>
		<label><span class="red_txt">*</span>모임참가 의무</label>
		<div class="checks">
			<input type="radio" id="radio1" name="character1"> 
			<label for="radio1">있음</label>
			
			<input type="radio" id="radio2" name="character1"> 
			<label for="radio2">없음</label>
			
			<input type="radio" id="radio3" name="character1"> 
			<label for="radio3">상관없음</label>
		</div>
	</li>
	
</ul>		

<button class="green" onclick="location.href='<%=request.getContextPath()%>/mateWrite2'">이전</button>
	<button class="green" onclick="location.href='<%=request.getContextPath()%>/mateWrite4'">다음</button>  
<button class="green" >취소</button> 
	</div>
</div>
</body>
</html>