<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>

	$(function(){
		CKEDITOR.replace("content"); //설명글 name 설정 필요
		
		$("#write").on('submit', function(){
			if(CKEDITOR.instances.content.getData()==""){
				alert("내용을 입력해주세요");
				return false;
			}return true;
		});
		
	});
</script>
</head>
<body>
<div class="wrap">
<p class="m_title">메이트 등록하기 </p> <br/>
	
	<div class="title_wrap">
	<p class="s_title">내 소개 등록 </p> <br/>
	
		<form method="post" id="write" action="">
		<textarea name="content"></textarea><br/>
	<button class="green" onclick="location.href='<%=request.getContextPath()%>/mateWrite5'" >이전</button>
	<button class="green" >미리보기</button>  
<button class="green" >취소</button>	
	</form>
	
	
	</div>
</div>	

</body>
</html>