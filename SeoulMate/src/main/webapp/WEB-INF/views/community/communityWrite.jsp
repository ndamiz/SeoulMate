<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://cdn.ckeditor.com/4.9.0/standard/ckeditor.js"></script>
<div class="content">
	<form id="frm" method="post" action="/home/communityWriteOk">
	카테고리 : 
		<select id="category" name="category">
			<option>우리집 자랑</option>
			<option>중고장터</option>
			<option>쉐어TIP</option>
			<option>자유게시판</option>
		</select><br>
		제목 : <input id="subject" name="subject" type="text" placeholder="제목을 입력하세요." style="width:300px;">
		<button id="write" class="green">글쓰기</button>
		<textarea name="content"></textarea>
	</form>
	<script>
  	  CKEDITOR.replace('content');
	  	
  	  $("#write").click(function(){
			var cate = $("#category").val();
			console.log(cate)
			
			if($("#subject").val()==""){
				alert("제목을 입력하세요.")
				return false;
			}
			if(CKEDITOR.instances.content.getData()==""){
				alert("글 내용을 입력해주세요.")
				return false;
			}

		});
    </script>
</div>