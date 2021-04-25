<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	            $('#inImg').attr('src', e.target.result).css.('width', '100px');
	            
	        }
	
	      reader.readAsDataURL(input.files[0]);
	    }
	}

</script>
</head>
<body>

<div class="wrap">
<p class="m_title">메이트 등록하기 </p> <br/>
	<div class="title_wrap">
	<p class="s_title">사진 등록 </p> <br/>
	
	사진 올리기 <input type="file" accept="image/*" id="input-image" /> <br/>
			<img id="inImg" src="#" alt="upload image" />
			
	
	<button class="green" onclick="location.href='<%=request.getContextPath()%>/mateWrite4'">이전</button>
	<button class="green" onclick="location.href='<%=request.getContextPath()%>/mateWrite6'">다음</button>  
<button class="green" >취소</button>
	
	</div>
</div>	

</body>
</html>