<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/home/css/choi.css"/>
<script>
	function memberCheck(e){
		if(e.id=="memberFindId"){
			if($("#usernameCheck").val()==""){
				alert("이름을 입력하세요");
				return false;
			}
			if($("#idEmailCheck").val()==""){
				alert("이메일을 입력하세요");
				return false;
<<<<<<< HEAD
			}else{
				if(regExp()!=false){
					return true;
				}else{
					return false;
				}
			}
		}else{
			if($("#useridCheck").val()==""){
				alert("아이디를 입력하세요");
				return false;
			}
			if($("#pwdEmailCheck").val()==""){
				alert("이메일을 입력하세요");
				return false;
			}	
		}
	}
	function findResultId(){
		if("${findId}"!=""){ // 찾은 아이디가 있을 경우
			alert("아이디는 ${findId}입니다.");
		}
		if("${findNotId}"=="no"){ // 찾은 아이디가 없는 경우
			alert("아이디를 찾을 수 없습니다.");
		}
	}
	findResultId();
	function regExp(){
		var regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if(!regEmail.test(document.getElementById("idEmailCheck").value)){
			alert("이메일 형식은 아이디@도메인 입니다.");
			return false;
		}
	}
=======
			}
		}else{
			if($("#useridCheck").val()==""){
				alert("아이디를 입력하세요");
				return false;
			}
			if($("#pwdEmailCheck").val()==""){
				alert("이메일을 입력하세요");
				return false;
			}	
		}
	}
	function findResultId(){
		if("${findId}"!=""){ // 찾은 아이디가 있을 경우
			alert("아이디는 ${findId}입니다.");
		}
		if("${findNotId}"=="no"){ // 찾은 아이디가 없는 경우
			alert("아이디를 찾을 수 없습니다.");
		}
	}
	findResultId();
>>>>>>> refs/remotes/origin/doo
</script>
<style>
	.title_wrap>.s_title.margin-bottom50.margin-top50{margin:50px 0;}
	.wrap>.member_wrap>hr{margin:50px 0 0 0;}
</style>
<div class="wrap">
	<div class="member_wrap">
		<div class="title_wrap">
			<p class="s_title margin-bottom50 margin-top50">아이디 찾기</p>
		</div>
		<div class="title_wrap">
			<form method="post" id="memberFindId" action="memberFindId" onsubmit="return memberCheck(this)">
				<input type="text" name="username" id="usernameCheck" maxlength="4" placeholder="이름을 입력해주세요"/><br/><br/><br/>
				<input type="text" name="email" id="idEmailCheck" placeholder="이메일을 입력해주세요"/><br/><br/><br/>
				<div class="center">
					<button class="h_btn green" id="FindIdBtn">아이디 찾기</button>
				</div>
			</form>
		</div>
		<hr/>
		<div class="title_wrap">
			<p class="s_title margin-bottom50 margin-top50">비밀번호 찾기</p>
		</div>
		<div class="title_wrap">
			<form method="post" id="memberFindPwd" action="memberFindPwd" onsubmit="return memberCheck(this)">
				<input type="text" name="userid" id="useridCheck" maxlength="4" placeholder="아이디를 입력해주세요"/><br/><br/><br/>
				<input type="text" name="email" id="pwdEmailCheck" placeholder="이메일을 입력해주세요"/><br/><br/><br/>
				<div class="center">
					<button class="h_btn green" id="FindPwdBtn">비밀번호 찾기</button>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>