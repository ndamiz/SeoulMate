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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/script.js"></script>
<script type="text/javascript"></script>
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
            $('#inImg').attr('src', e.target.result);
        }

      reader.readAsDataURL(input.files[0]);
    }
}


</script>
</head>
<body>

<div class="wrap">
<p class="m_title">하우스 등록하기 </p> <br/>
	
	<div class="title_wrap">
	<p class="s_title">사진 등록 </p> <br/>
	
	사진 올리기 <input type="file" accept="image/*" id="input-image" /> <br/>
			<img id="inImg" src="#" alt="upload image" />

 <br/>
	
	
	<div class="btnclass">
	<button class="green" onclick="location.href='<%=request.getContextPath()%>/houseWrite6'">이전</button>
	<button class="green" onclick="location.href='<%=request.getContextPath()%>/houseWrite8'">다음</button>  
<button class="green" >취소</button>
	</div>
	</div>
</div>	
</body>
</html>