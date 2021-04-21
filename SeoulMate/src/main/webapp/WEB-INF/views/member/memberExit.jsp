<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	input[type=text]{width:250px;}
	.center{text-align:center;}
	.center>button{width:250px;}
</style>
<script>
	function pwdCheck(){
		if($("#userpwd").val()==""){
			alert("비밀번호를 입력하세요");
			return false;
		}
		if(confirm("탈퇴하시겠습니까?")){
			alert("그동안 서울 메이트를 이용해주셔서 감사합니다.");
		}else{
			return false;
		}
	}
</script>
<div class="wrap">
	<div class="member_wrap">
		<div class="title_wrap">
			<p class="s_title">회원 탈퇴</p>
		</div>
		<br/><br/>
		<div class="title_wrap">
			<form method="post" action="memberExitOk" id="memberExitForm" onsubmit="return pwdCheck()">
				<input type="password" name="userpwd" id="userpwd" maxlength="12" placeholder="비밀번호를 입력해주세요"/><br/><br/><br/>
				<div class="center">
					<button class="h_btn green" id="editBtn">회원 탈퇴하기</button>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>