<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/comm.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/housemate.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
<script src="//cdn.ckeditor.com/4.16.0/full/ckeditor.js"></script>
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
<p class="m_title">하우스 등록하기 </p> <br/>
	
	<div class="title_wrap">
	<p class="s_title">우리집설명 </p> <br/>
	
		<form method="post" id="write" action="">
		내용 : <textarea name="content"></textarea><br/>
	<div class="btnclass">
	<button class="green" onclick="location.href='<%=request.getContextPath()%>/houseWrite8'" >이전</button>
	<button class="green" >미리보기</button>  
<button class="green" >취소</button>	
	</div>
	</form>
	
	
	</div>
</div>	

</body>
</html>