<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쉐어하우스</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/comm.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/housemate.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/script.js"></script>
<style>
.boxClass li{float:left;}
input[type="date"] {width:200px;}
input[type="text"] {width:100px;}
</style>
</head>
<body>
<div class="wrap">
	
	<div class="boxClass"> <!-- 상단부분 div -->

	<ul>
		<li> <img src='<%=request.getContextPath()%>/img/ico_filter.png'/> 조건검색 </li>
		<li>
	</ul>		
	<ul>
				<li><p>지역</p></li> 
				<li> <input type="text" placeholder="지역명&지하철명을 입력하세요" src='<%=request.getContextPath()%>/img/ico_search_black.png'/> </li>
				<li> 입주예정일 </li>
				<li> <input class="classDate" type="date"/> </li>
				<li> 월세범위 </li>
				<li> <input type="text"/> - <input type="text"/> 만원 </li>
				<li> 보증금범위 </li>
				<li> <input type="text"/> - <input type="text"/> 만원 </li>
				<li> <img src="<%=request.getContextPath()%>/img/ico_search_black.png"/> </li>
			</ul>
		
		
		
	
	
	<button class="green" onclick="location.href='<%=request.getContextPath()%>/houseWrite1'">방 등록하기</button> <br/>
 <hr/>
	</div>

</div>
</body>
</html>