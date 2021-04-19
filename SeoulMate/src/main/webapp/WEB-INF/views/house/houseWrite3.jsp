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
			<input type="radio" id="radio1" name="character1"> 
			<label for="radio1">야행성</label>
			
			<input type="radio" id="radio2" name="character1"> 
			<label for="radio2">주행성</label>
		</div>
	</li>
	
		<li>
		<label><span class="red_txt">*</span>반려동물</label>
		<div class="checks">
			<input type="radio" id="radio1" name="character1"> 
			<label for="radio1">있음</label>
			
			<input type="radio" id="radio2" name="character1"> 
			<label for="radio2">없음</label>
		</div>
	</li>
	
	<li>
		<label><span class="red_txt">*</span>반려동물 거주</label>
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
		</div>
	</li>

<!-- 생활 소음 <button class="white">조용함</button> <button class="white">보통</button> <button class="white">활발함</button> <br/> -->
<!-- 생활 시간 <button class="white">야행성</button> <button class="white">주행성</button> <br/> -->
<!-- 반려 동물	<button class="white">있음</button> <button class="white">없음</button> <br/> -->
<!-- 반려동물 거주 <button class="white">가능</button> <button class="white">불가능</button> <br/> -->
<!-- 흡연 <button class="white">실내흡연</button> <button class="white">실외흡연</button> <button class="white">비흡연</button> <br/> -->

</ul>
<button class="green" >이전</button>
	<button class="green" onclick="document.location.href='<%=request.getContextPath()%>/houseWrite3'">다음</button>  
<button class="green" >취소</button>
	
	</div>
</div>	
</body>
</html>