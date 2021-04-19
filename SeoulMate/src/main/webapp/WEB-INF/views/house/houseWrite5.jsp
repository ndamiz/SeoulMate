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
	<p class="s_title">하우스 성향 등록 </p> 
	
3. 하우스지원 정보 <br/>

<ul class="form_box choice">

	<li>
		<label><span class="red_txt">*</span>하우스 내 지원서비스</label>
		<div class="checks">
			<input type="checkbox" id="check1" name="character1"> 
			<label for="check1">공용공간 청소지원</label>
						
			<input type="checkbox" id="check2" name="character1"> 
			<label for="check2">공용생필품 지원</label> <br/>
						
			<input type="checkbox" id="check3" name="character1"> 
			<label for="check3">기본 식품 지원</label>
			
			<input type="checkbox" id="check4" name="character1"> 
			<label for="check4">미지원</label>
		</div>
	</li>
</ul>
<div class="btnclass">
<button class="green" onclick="location.href='<%=request.getContextPath()%>/houseWrite4'" >이전</button>
	<button class="green" onclick="location.href='<%=request.getContextPath()%>/houseWrite6'" >다음</button>  
<button class="green" >취소</button>
</div>
	</div>
</div>
</body>
</html>