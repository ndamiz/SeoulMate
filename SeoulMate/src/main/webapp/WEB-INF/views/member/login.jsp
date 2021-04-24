<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="member_wrap login_wrap wrap">
	<p class="m_title">로그인</p>
	<p class="d_title">로그인 하시면 더 많은 서비스를 즐길 수 있어요!</p>
	
	<form method="post" action="loginOk">
		<ul class="form_box">
			<li>
				<input type="text" name="userid" placeholder="아이디를 입력해주세요"> 
			</li>
			<li>
				<input type="password" name="userpwd" placeholder="비밀번호를 입력해주세요"> 
			</li>
		</ul>
		<button type="submit" class="q_btn green">로그인</button>
	</form>
	<hr>
	<a class="white" href="memberForm">회원가입</a>
	<a class="white" href="memberFind">아이디/비밀번호 찾기</a>
</div>
