<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="main_wrap">
	<div class="content">
		<h2 class="main_title">
			당신과 가장 잘 맞는<br>
			쉐어하우스 & 메이트
		</h2>
		
		<form class="main_search_form" method="get" action="">
			<div class="checks">
				<input type="radio" id="select_house" name="main_search"> 
				<label for="select_house">쉐어하우스</label>
				
				<input type="radio" id="select_mate" name="main_search"> 
				<label for="select_mate">하우스메이트</label>
			</div>
			<input type="text" placeholder="지역명or지하철역을 입력하세요.">
			<button type="submit" class="green"></button>
		</form>
	</div>
</div>