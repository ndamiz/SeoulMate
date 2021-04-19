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
			<input type="radio" id="radio4" name="character2"> 
			<label for="radio4">외향적</label>
			<input type="radio" id="radio5" name="character2"> 
			<label for="radio5">내향적</label>
			<input type="radio" id="radio6" name="character2"> 
			<label for="radio6">보통</label>
			<input type="radio" id="radio7" name="character2"> 
			<label for="radio7">상관없음</label>
		</div>
	</li>
	
	<li>
		<label><span class="red_txt">*</span>반려동물 선호도</label>
		<div class="checks">
			<input type="radio" id="radio8" name="character3"> 
			<label for="radio8">긍정적</label>
			<input type="radio" id="radio9" name="character3"> 
			<label for="radio9">부정적</label>
			<input type="radio" id="radio10" name="character3"> 
			<label for="radio10">상관없음</label>
		</div>
	</li>
	
	<li>
		<label><span class="red_txt">*</span>흡연</label>
		<div class="checks">
			<input type="radio" id="radio11" name="character4"> 
			<label for="radio11">실내흡연</label>
			<input type="radio" id="radio12" name="character4"> 
			<label for="radio12">실외흡연</label>
			<input type="radio" id="radio13" name="character4"> 
			<label for="radio13">비흡연</label>
			<input type="radio" id="radio14" name="character4"> 
			<label for="radio14">상관없음</label>
		</div>
	</li>
	
	<li>
		<label><span class="red_txt">*</span>연령대</label>
		<div class="checks">
			<input type="radio" id="radio15" name="character5"> 
			<label for="radio15">20대</label>
			<input type="radio" id="radio16" name="character5"> 
			<label for="radio16">30대</label>
			<input type="radio" id="radio17" name="character5"> 
			<label for="radio17">40대</label>
			<input type="radio" id="radio18" name="character5"> 
			<label for="radio18">상관없음</label>
		</div>
	</li>	
	
	<li>
		<label><span class="red_txt">*</span>성별</label>
		<div class="checks">
			<input type="radio" id="radio19" name="character6"> 
			<label for="radio19">여성</label>
			<input type="radio" id="radio20" name="character6"> 
			<label for="radio20">남성</label>
			<input type="radio" id="radio21" name="character6"> 
			<label for="radio21">상관없음</label>
		</div>
	</li>	
	
	
	<li>
		<label><span class="red_txt">*</span>외국인입주 가능여부</label>
		<div class="checks">
			<input type="radio" id="radio22" name="character7"> 
			<label for="radio22">가능</label>
			<input type="radio" id="radio23" name="character7"> 
			<label for="radio23">불가능</label>
			<input type="radio" id="radio24" name="character7"> 
			<label for="radio24">상관없음</label>
		</div>
	</li>
	
	<li>
		<label><span class="red_txt">*</span>즉시입주 가능여부</label>
		<div class="checks">
			<input type="radio" id="radio25" name="character8"> 
			<label for="radio25">가능</label>
			<input type="radio" id="radio26" name="character8"> 
			<label for="radio26">불가능</label>
			<input type="radio" id="radio27" name="character8"> 
			<label for="radio27">상관없음</label>
		</div>
	</li>		
	
</ul>	
	<div class="btnclass">
	<button class="green" onclick="location.href='<%=request.getContextPath()%>/houseWrite7'" >이전</button>
	<button class="green" onclick="location.href='<%=request.getContextPath()%>/houseWrite9'" >다음</button>  
	<button class="green" >취소</button>		
	</div>
	</div>
</div>
</body>
</html>