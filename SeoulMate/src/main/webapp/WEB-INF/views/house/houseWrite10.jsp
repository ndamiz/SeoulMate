<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/comm.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/reset.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
</head>
<body>
<div class="wrap">
<p class="m_title">하우스 등록하기 </p> <br/>
	
	<div class="title_wrap">
	<p class="s_title">선호하는 메이트성향 선택 </p> <br/>
	

<ul class="form_box choice">

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
		<label><span class="red_txt">*</span>성격</label>
		<div class="checks">
			<input type="radio" id="radio1" name="character1"> 
			<label for="radio1">외향적</label>
			<input type="radio" id="radio2" name="character1"> 
			<label for="radio2">내향적</label>
			<input type="radio" id="radio3" name="character1"> 
			<label for="radio3">보통</label>
			<input type="radio" id="radio3" name="character1"> 
			<label for="radio4">상관없음</label>
		</div>
	</li>
	
	<li>
		<label><span class="red_txt">*</span>반려동물 선호도</label>
		<div class="checks">
			<input type="radio" id="radio1" name="character1"> 
			<label for="radio1">긍정적</label>
			<input type="radio" id="radio2" name="character1"> 
			<label for="radio2">부정적</label>
			<input type="radio" id="radio3" name="character1"> 
			<label for="radio3">상관없음</label>
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
	
	<li>
		<label><span class="red_txt">*</span>성별</label>
		<div class="checks">
			<input type="radio" id="radio1" name="character1"> 
			<label for="radio1">여성</label>
			<input type="radio" id="radio2" name="character1"> 
			<label for="radio2">남성</label>
			<input type="radio" id="radio3" name="character1"> 
			<label for="radio3">상관없음</label>
		</div>
	</li>	
	
	
	<li>
		<label><span class="red_txt">*</span>외국인입주 가능여부</label>
		<div class="checks">
			<input type="radio" id="radio1" name="character1"> 
			<label for="radio1">가능</label>
			<input type="radio" id="radio2" name="character1"> 
			<label for="radio2">불가능</label>
			<input type="radio" id="radio3" name="character1"> 
			<label for="radio3">상관없음</label>
		</div>
	</li>
	
	<li>
		<label><span class="red_txt">*</span>즉시입주 가능여부</label>
		<div class="checks">
			<input type="radio" id="radio1" name="character1"> 
			<label for="radio1">가능</label>
			<input type="radio" id="radio2" name="character1"> 
			<label for="radio2">불가능</label>
			<input type="radio" id="radio3" name="character1"> 
			<label for="radio3">상관없음</label>
		</div>
	</li>		
	
</ul>	
	<button class="green" >이전</button>
	<button class="green" >미리보기</button>  
	<button class="green" >취소</button>		
	
	</div>
</div>
</body>
</html>