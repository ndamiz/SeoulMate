<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쉐어하우스 등록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/comm.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<div class="wrap">
<div class="content">
<p class="m_title">하우스 등록하기 </p> <br/>
	<div class="title_wrap">
	<p class="s_title">집 기본 정보 등록 </p> <br/>
	
<p class="d_title">게재 기간</p> <input type="date" width="100px"/> <br/>
주소 <input type="text"/> <br/>
총 방 개수 <select>
			<option>1</option>
			<option>2</option>
			<option>3</option>
			<option>4</option>
		</select> 
총 욕실 수	 <select>
			<option>1</option>
			<option>2</option>
			<option>3</option>
			<option>4</option>
		</select> <br/>
현재 인원 <select>
			<option>1</option>
			<option>2</option>
			<option>3</option>
			<option>4</option>
		</select> 
찾는 인원 <select>
			<option>1</option>
			<option>2</option>
			<option>3</option>
			<option>4</option>
		</select> <br/>
	<input class="green" type="button" value="방 추가등록"/> <br/>
	<div class="btn_wrap">
				<a class="h_btn white">다음</a>
				<a class="h_btn green">취소</a>
	</div>
</div>
</div>

</div>
</body>
</html>