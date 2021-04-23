<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		</select> <br/>
	최대 거주 기간
		<select>
			<option>1~3 개월</option>
			<option>4~6 개월</option>
			<option>7~12 개월</option>
			<option>1년 이상</option>
		</select> <br/>
	<div class="btnclass">
	<button class="green" onclick="location.href='<%=request.getContextPath()%>/houseWrite5'">이전</button>
	<button class="green" onclick="location.href='<%=request.getContextPath()%>/houseWrite7'" >다음</button>  
<button class="green" >취소</button>
	</div>
	</div>
</div>	
</body>
</html>