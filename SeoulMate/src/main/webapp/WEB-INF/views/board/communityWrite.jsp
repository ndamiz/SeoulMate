<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/yun.css">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<div class="wrap">
	<div class="content">
		<p class="m_title">글 작성</p>
		<form id="frm" method="post" action="/home/communityWriteOk">
			<ul>
				<li id="comWriteLi">
					<select id="category" name="category">
						<option>우리집 자랑</option>
						<option>중고장터</option>
						<option>쉐어TIP</option>
						<option>자유게시판</option>
					</select>
				</li>		
				<li id="comWriteSubject"><input id="comWriteSubject" name="subject" type="text" placeholder="제목을 입력하세요."></li>
				<li id="comWriteBtn"><button class="green" id="communityWrite">글쓰기</button></li>
			</ul>
			<br>
			<textarea id="summernote"></textarea>
		</form>
		<script>
	  	  $(function(){
	  		 $("#summernote").summernote(); 
	  	  });
	  	  
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
</div>