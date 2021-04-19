<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="main_wrap">
	<div class="content">
		<h2 class="home_title">
			당신과 가장 잘 맞는<br>
			쉐어하우스 & 메이트
		</h2>
		<a href="memberForm">회원가입</a>
		<a href="memberEdit">회원정보 수정</a>
		<a href="memberExit">회원 탈퇴</a>
		<c:if test="${logId!=null}">
			<p class="d_title">${logId}님 환영합니다!</p>
		</c:if>
	</div>
</div>