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
		</div>
	</li>
	
		<li>
		<label><span class="red_txt">*</span>모임참가 의무</label>
		<div class="checks">
			<input type="radio" id="radio1" name="character1"> 
			<label for="radio1">있음</label>
			
			<input type="radio" id="radio2" name="character1"> 
			<label for="radio2">없음</label>
		</div>
	</li>
	
</ul>		

<!-- 2. 소통정보 <br/> -->
<!-- 분위기 <button class="white">화목함</button> <button class="white">보통</button> <button class="white">독립적</button> <br/> -->
<!-- 소통방식 <button class="white">대화</button> <button class="white">기타</button> <br/> -->
<!-- 모임빈도	<button class="white">없음</button> <button class="white">가끔</button> <button class="white">보통</button> <button class="white">자주</button><br/> -->
<!-- 모인참가 의무 <button class="white">있음</button> <button class="white">없음</button> <br/> -->

<button class="green" >이전</button>
	<button class="green" >다음</button>  
<button class="green" >취소</button> 
	
	</div>
</div>
</body>
</html>