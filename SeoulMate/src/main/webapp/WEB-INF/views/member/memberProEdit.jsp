<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	html>body>.wrap{min-height:550px;}
	.form_box li{margin:10px 0;}
	.form_box.choice li > label{width:130px;}
	span{line-height: 47px;}
	.multi{text-align:center; width:13.73px;}
	#memDiv3, #memDiv4, #memDiv5, #memDiv6, #memDiv7, .houseChoice, .mateChoice, #hopeChoice{display:none;}
	.half{float:left; width:50%; line-height:47px; margin:40px 0;}
	.half>.checks>.d_title{padding:0 10px;}
	#memDiv3>.title_wrap>.s_title, #memDiv4>.title_wrap>.s_title, #memDiv5>.title_wrap>.s_title
	, #memDiv6>.title_wrap>.s_title, #memDiv7>.title_wrap>.s_title{margin:40px 0;}
	#memDiv3>.form_box.choice li > label, #memDiv5>.form_box.choice li > label
	, #memDiv6>.form_box.choice li > label, #memDiv7>.form_box.choice li > label{width:170px;}
	#proList>li{float:right;}
	#proTitle{margin-bottom:60px;}
</style>
<script>
	$(function(){
		// 2
		$("#memPrev2").click(function(){
			$("#memDiv1").css("display","block");
			$("#memDiv2").css("display", "none");
			goTop();
		});
		$("#memNext2").click(function(){
			$("#memDiv2").css("display","none");
			$("#memDiv3").css("display","block");
			$("#housemateChoice").css("display", "block");
			goTop();
		});
		// 3
		$("#memPrev3").click(function(){
			$("#memDiv2").css("display","block");
			$("#memDiv3").css("display", "none");
			$("#housemateChoice").css("display", "none");
			goTop();
		});
		$("#memNext3").click(function(){
			$("#memDiv3").css("display","none");
			$("#memDiv4").css("display","block");
			goTop();
		});
		// 4
		$("#memPrev4").click(function(){
			$("#memDiv3").css("display","block");
			$("#memDiv4").css("display","none");
			goTop();
		});
		$("#memNext4").click(function(){
			$("#memDiv4").css("display","none");
			$("#memDiv5").css("display","block");
			goTop();
		});
		// 5
		$("#memPrev5").click(function(){
			$("#memDiv4").css("display","block");
			$("#memDiv5").css("display","none");
			$("#hopeChoice").css("display", "none");
			goTop();
		});
		$("#memNext5").click(function(){
			$("#memDiv5").css("display","none");
			$("#memDiv6").css("display","block");
			$("#housemateChoice").css("display", "none");
			$("#hopeChoice").css("display", "block");
			goTop();
		});
		// 6
		$("#memPrev6").click(function(){
			$("#memDiv5").css("display","block");
			$("#memDiv6").css("display","none");			
			$("#housemateChoice").css("display", "block");
			$("#hopeChoice").css("display", "none");
			goTop();
		});
		$("#memNext6").click(function(){
			$("#memDiv6").css("display","none");
			$("#memDiv7").css("display","block");
			$("#housemateChoice").css("display", "none");
			$("#hopeChoice").css("display", "block");
			goTop();
		});
		// 7
		$("#memPrev7").click(function(){
			$("#memDiv6").css("display","block");
			$("#memDiv7").css("display","none");			
			$("#housemateChoice").css("display", "none");
			$("#hopeChoice").css("display", "block");
			goTop();
		});
		// 하우스를 선택했는지 메이트를 선택했는지 구분
		$(document).ready(function () {
			$('#memNext2').click(function () {
				var radioVal = $('input[name="housemate"]:checked').val();
				
				if(radioVal=="쉐어하우스"){
					$(".houseChoice").css("display","block");
					$(".mateChoice").css("display","none");
				}else if(radioVal=="하우스메이트"){
					$(".houseChoice").css("display","none");
					$(".mateChoice").css("display","block");
				}
			});
		});
		
		// 상단으로 스크롤 이동
		function goTop(){
			$('html').scrollTop(0);
		}
	});
</script>
<div class="wrap">
	<div class="member_wrap">
		<div class="title_wrap">
			<p class="s_title" id="proTitle">성향 수정</p>
		</div>
		<ul id="proList">
			<!-- c:forEach start -->
			<c:forEach var="i" begin="1" end="4">
				<li><a href="#">성향 ${i}</a></li>
			</c:forEach>
			<!-- c:forEach end -->
		</ul>
	</div>
</div>
</body>
</html>