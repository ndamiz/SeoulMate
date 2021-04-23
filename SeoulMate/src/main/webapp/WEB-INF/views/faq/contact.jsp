<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/yun.css">
<div class="wrap">
	<div class="member_wrap">
		<p class="m_title">문의하기</p>
		<p class="d_title">문의하기전에 FAQ에서 좀 찾아보지그래? <a href="qna" class="d_title faqATag">자주하는질문 보러가기</a></p>
		<br>
		<p class="d_title">고객님의 소중한 의견을 들려주세요.</p>
		<br>
		<form method="post" action="" id="contactForm">
			<input type="text" name="content" placeholder="이름">
			<br>
			<br>
			<input type="text" name="email" placeholder="이메일">
			<br>
			<br>
			<select id="category" name="category">
					<option style="color:#bababa" disabled selected hidden>관련 문의사항을 선택하세요.</option>
					<option>쉐어하우스</option>
					<option>하우스메이트</option>
					<option>커뮤니티</option>
					<option>프리미엄 결제</option>
					<option>기타</option>
			</select>
			<br>
			<br>
			<textarea rows="5" placeholder="문의내용을 입력하세요." id="contact"></textarea>
			<br>
			<br>
			<button class="q_btn green">문의 보내기</button>
		</form>	
	</div>
</div>