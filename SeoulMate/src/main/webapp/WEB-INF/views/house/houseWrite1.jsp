<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쉐어하우스 등록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/comm.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/housemate.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/script.js"></script>
<style>

</style>
</head>
<body>
<div class="wrap">
<!-- <div class="content"> -->
<p class="m_title">하우스 등록하기 </p> <br/>
	<div class="title_wrap">
	<p class="s_title">집 기본 정보 등록 </p> <br/>
</div>
<div class="content">
<ul>
	<li>
<p class="d_title">게재 기간</p> <input type="date" width="100px"/> </li>
	<li>주소 <input type="text"/> </li>
<li>총 방 개수 <select>
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
		</select> <br/></li>
<li>현재 인원 <select>
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
		</select> <br/> </li>
</ul>
	
<button class="green" >방 추가등록 </button> <br/>
	
	<div class="btnclass">
	<button class="green" onclick="location.href='<%=request.getContextPath()%>/houseIndex'">이전</button>
	<button class="green" onclick="location.href='<%=request.getContextPath()%>/houseWrite2'" >다음</button> 
	</div>
</div>

</div>
</body>
</html>