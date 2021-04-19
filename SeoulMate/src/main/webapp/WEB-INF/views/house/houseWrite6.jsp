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
	<p class="s_title">임대료 및 입주정보 </p> <br/>
	
	월세(관리비) <input type="text"/> <button class="white">포함</button> <button class="white">불포함</button> <br/>
	보증금(조율) <input type="text"/> <button class="white">포함</button> <button class="white">불포함</button> <br/>
	입주 가능일 <input type="date"/> <br/>
	최소 거주 기간
		<select>
			<option>1~3 개월</option>
			<option>4~6 개월</option>
			<option>7~12 개월</option>
			<option>1년 이상</option>
		</select> 
	최대 거주 기간
		<select>
			<option>1~3 개월</option>
			<option>4~6 개월</option>
			<option>7~12 개월</option>
			<option>1년 이상</option>
		</select> <br/>
	
	<button class="green" >이전</button>
	<button class="green" >다음</button>  
<button class="green" >취소</button>

	</div>
</div>	
</body>
</html>