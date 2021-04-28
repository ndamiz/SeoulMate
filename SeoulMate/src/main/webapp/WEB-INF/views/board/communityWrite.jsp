<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/comm.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/yun.css">
<div class="wrap">
	<div class="content">
		<p class="m_title">글 작성</p>
		<br>
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
			<textarea id="summernote" name="content"></textarea>
		</form>
		<script>
			// 4월28일 추가 + summernote에디터 사용할때 제이쿼리 버전 출동로 인해서 추가된 부분////
			jQuery.curCSS = function(element, prop, val) {
			    return jQuery(element).css(prop, val);
			};
			/////
	  	  $(document).ready(function(){
	  		 $("#summernote").summernote({
	  			 height : 500
	  		 });
	  	  });
	    </script>
	</div>
</div>