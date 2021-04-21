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
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/housemate.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/script.js"></script>
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
			<input type="radio" id="radio4" name="character2"> 
			<label for="radio4">대화</label>
			
			<input type="radio" id="radio5" name="character2"> 
			<label for="radio5">기타</label>
		</div>
	</li>
	
		<li>
		<label><span class="red_txt">*</span>모임빈도</label>
		<div class="checks">
			<input type="radio" id="radio6" name="character3"> 
			<label for="radio6">없음</label>
			
			<input type="radio" id="radio7" name="character3"> 
			<label for="radio7">가끔</label>
			
			<input type="radio" id="radio8" name="character3"> 
			<label for="radio8">보통</label>
			
			<input type="radio" id="radio9" name="character3"> 
			<label for="radio9">자주</label>
		</div>
	</li>
	
		<li>
		<label><span class="red_txt">*</span>모임참가 의무</label>
		<div class="checks">
			<input type="radio" id="radio10" name="character4"> 
			<label for="radio10">있음</label>
			
			<input type="radio" id="radio11" name="character4"> 
			<label for="radio11">없음</label>
		</div>
	</li>
	
</ul>		

<div class="btnclass">
<button class="green" onclick="location.href='<%=request.getContextPath()%>/houseWrite3'">이전</button>
	<button class="green" onclick="location.href='<%=request.getContextPath()%>/houseWrite5'" >다음</button>  
<button class="green" >취소</button> 
</div>
	</div>
</div>
</body>
</html>