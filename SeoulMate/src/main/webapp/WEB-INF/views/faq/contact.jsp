<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/yun.css">
<script>
	$(function(){
		if(${result}!=0){
			alert("문의가 접수되었습니다.");
		}
		$('#contactForm').submit(function(){
			if($('input[name=username]').val()==''){
				alert("이름을 입력해주세요.")
				return false;	
			}
			if($('input[name=email]').val()==''){
				alert("이메일을 입력해주세요.")
				return false;	
			}
			if($("#contactCategory option").index($("#contactCategory option:selected"))==0){
				alert("문의 분류를 선택하세요.");
				return false;
			}
			if($('textarea[name=qContent]').val()==''){
				alert("문의내용을 입력해주세요.")
				return false;	
			}
		});
	});
</script>
<div class="wrap">
	<div class="member_wrap">
		<p class="m_title">문의하기</p>
		<p class="d_title">문의하기전에 FAQ에서 좀 찾아보지그래? <a href="qna" class="d_title faqATag">자주하는질문 보러가기</a></p>
		<br>
		<p class="d_title">고객님의 소중한 의견을 들려주세요.</p>
		<br>
		<form method="post" action="/home/contactInsert" id="contactForm">
			<input type="text" name="userid" placeholder="아이디" value="${logId}" readonly>
			<br>
			<br>
			<input type="text" name="username" placeholder="이름" value="${logName}" readonly>
			<br>
			<br>
			<input type="text" name="email" placeholder="이메일" value="${logEmail}">
			<br>
			<br>
			<input type="text" name="tel" placeholder="연락처" value="${logEmail}">
			<br>
			<br>
			<select id="contactCategory" name="category">
					<option disabled selected hidden>관련 문의사항을 선택하세요.</option>
					<option value="쉐어하우스">쉐어하우스</option>
					<option value="하우스메이트">하우스메이트</option>
					<option value="커뮤니티">커뮤니티</option>
					<option value="프리미엄 결제">프리미엄 결제</option>
					<option value="기타">기타</option>
			</select>
			<br>
			<br>
			<textarea name="qContent" rows="7" placeholder="문의내용을 입력하세요." id="contact"></textarea>
			<br>
			<br>
			<button class="q_btn green contactBtn">문의 보내기</button>
		</form>	
	</div>
</div>