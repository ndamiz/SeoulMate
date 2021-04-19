<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/comm.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
</head>
<body>
<div class="wrap">
<p class="m_title">하우스 등록하기 </p> <br/>
	<div class="title_wrap">
	<p class="s_title">공용 시설 정보 등록 </p> <br/>
	
	
	<ul class="form_box choice">

		<li>
			<label><span class="red_txt">*</span>주방</label>
			<div class="checks">
				<input type="checkbox" id="check1" name="character3"> 
				<label for="check1">냉장고</label>
				<input type="checkbox" id="check2" name="character3"> 
				<label for="check2">정수기</label>
				<input type="checkbox" id="check3" name="character3"> 
				<label for="check3">가스레인지</label>
				<input type="checkbox" id="check3" name="character3"> 
				<label for="check4">밥솥</label> <br/>
				<input type="checkbox" id="check3" name="character3">  
				<label for="check5">식기세척기</label>
				<input type="checkbox" id="check3" name="character3"> 
				<label for="check6">냄비</label>
				<input type="checkbox" id="check3" name="character3"> 
				<label for="check7">프라이팬</label>
				<input type="checkbox" id="check3" name="character3"> 
				<label for="check8">토스트기</label> <br/>
			</div>
		</li> <br/> <br/>
		<hr>
		<li>
			<label><span class="red_txt">*</span>거실</label>
			<div class="checks">
				<input type="checkbox" id="check1" name="character3"> 
				<label for="check1">소파</label>
				<input type="checkbox" id="check2" name="character3"> 
				<label for="check2">티비</label>
				<input type="checkbox" id="check3" name="character3"> 
				<label for="check3">탁자</label>
				<input type="checkbox" id="check3" name="character3"> 
				<label for="check4">카펫</label> <br/>
			</div>
		</li>
		
		<li>
			<label><span class="red_txt">*</span>욕실</label>
			<div class="checks">
				<input type="checkbox" id="check1" name="character3"> 
				<label for="check1">욕조</label>
				<input type="checkbox" id="check2" name="character3"> 
				<label for="check2">비데</label>
				<input type="checkbox" id="check3" name="character3"> 
				<label for="check3">샴푸</label>
				<input type="checkbox" id="check3" name="character3"> 
				<label for="check4">린스</label> <br/>
			</div>
		</li>
		
		<li>
			<label><span class="red_txt">*</span>기타</label>
			<div class="checks">
				<input type="checkbox" id="check1" name="character3"> 
				<label for="check1">세탁기</label>
				<input type="checkbox" id="check2" name="character3"> 
				<label for="check2">건조기</label>
				<input type="checkbox" id="check3" name="character3"> 
				<label for="check3">베란다</label>
				<input type="checkbox" id="check3" name="character3"> 
				<label for="check4">WIFI</label> <br/>
			</div>
		</li>
		
	</ul>	
	
	<button class="green" >이전</button>
	<button class="green" onclick="document.location.href='houseWrite3.jsp'">다음</button> 
<!-- 주방 <br/> -->
<!-- <button class="white">냉장고</button> <button class="white">정수기</button> -->
<!-- <button class="white">가스레인지</button><button class="white">밥솥</button> <br/> -->
<!-- <button class="white">식기세척기</button> <button class="white">냄비</button> -->
<!-- <button class="white">프라이팬</button> <button class="white">토스트기</button> <br/> -->
<!-- 거실 <br/> -->
<!-- <button class="white">소파</button> <button class="white">티비</button> -->
<!-- <button class="white">탁자</button> <button class="white">카펫</button> <br/> -->
<!-- 욕실 <br/> -->
<!-- <button class="white">욕조</button> <button class="white">비데</button> -->
<!-- <button class="white">샴푸</button> <button class="white">린스</button> <br/> -->
<!-- 기타 <br/> -->
<!-- <button class="white">세탁기</button> <button class="white">건조기</button> -->
<!-- <button class="white">베란다</button> <button class="white">WIFI</button> <br/> -->


<!-- <input type="submit" value="다음" onclick="document.location.href='houseWrite3.jsp'"/> <input type="submit" value="취소"/>   -->
	
	</div>
</div>

</body>
</html>