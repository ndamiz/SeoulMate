<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/housemate.css">

<script>

$(function() {
    $("#input-image").on('change', function(){
        readURL(this);
    });
});

function readURL(input) {
    if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function (e) {
            $('#housePic1').attr('src', e.target.result);
        }

      reader.readAsDataURL(input.files[0]);
    }
}

</script>
<style>

</style>
<div class="wrap">
<p class="m_title">하우스 등록하기 </p> <br/>
	
	<div class="title_wrap">
	<p class="s_title">사진 등록 </p> <br/>
	
	<ul>
	     
	<li> 이미지 미리보기<img id="housePic1" name="housePic1" src="#" alt="upload image" style="width:400px; height:400px;"/> <br/>
	<input type="file" accept="image/*" id="input-image" onchange="readURL(this);"/> <br/>
			</li>
	
	</ul>
 <br/>
	
	
	<div class="btnclass">
	<button class="green" onclick="location.href='<%=request.getContextPath()%>/houseWrite6'">이전</button>
	<button class="green" onclick="location.href='<%=request.getContextPath()%>/houseWrite8'">다음</button>  
<button class="green" >취소</button>
	</div>
	</div>
</div>	
