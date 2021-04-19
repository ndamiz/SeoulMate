<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="wrap">
	<div class="member_wrap">
		<p class="m_title">문의하기</p>
		<p class="d_title">문의하기전에 FAQ에서 좀 찾아보지그래? <a href="faqList">FAQ</a></p>
		<br>
		<p class="d_title">고객님의 소중한 의견을 들려주세요.</p>
		<br>
		<form method="post" action="">
			<textarea rows="5" style="width:100%" placeholder="문의내용을 입력하세요."></textarea>
			<br>
			<br>
			<input type="text" name="content" placeholder="이름" style="width:100%">
			<br>
			<br>
			<input type="text" name="email" placeholder="이메일" style="width:100%">
			<br>
			<br>
			<button class="q_btn green">문의 보내기</button>
		</form>	
	</div>
</div>