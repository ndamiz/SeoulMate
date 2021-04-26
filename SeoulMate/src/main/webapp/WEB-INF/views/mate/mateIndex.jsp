<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
img{width:250px; height:250px; }
ul, li{float:left;}
#topDiv{height:300px; width:100%; position: relative; }
#topDiv>img{height: 200px; width: 200px;}\
#dateDiv{float: left; height: 50px; }
#btnDiv{float: right; height: 50px; overflow: auto;}
#imgDiv{ width:100%; height:250px; overflow: hidden; }
#imgDiv img{width:250px; height: 250px; }
#imgList{width:1600px; position: relative; }
#middle_Div{ background-color:lightpink; width:100%; height:400px; }
#middle_Div>div{float:left;}
#houseExplain{width:65%; height:100%; background-color:lightblue; }
#peopleExplain{width:35%; margin:0 auto; background-color:gray; text-align: center;  }
#peopleExplain>ul{ text-align:center; align-items: center;}
#peopleExplain li{ display:inline-block; text-align:center; align-items: center; height: 100%;}

#matching{position: relative;}



#middleDiv{ background-color:lightpink; width:100%; height:400px;}
#middleDiv>div{float:left;}
#houseExplain{width:65%; height:100%; background-color:lightblue;}
#peopleExplain{width:35%;  background-color:gray;  }

</style>
<script>
	$(function(){
		 $('#mEdit').click(function(){
	        	location.href="mateWrite1"; //메이트등록하기 form 으로 이동
	        	
	        });
		
	});
</script>
<div class="wrap">

	<div id="topDiv">
	 	<div id="dateDiv">
	 	등록날짜 2021-04-20 등록
	 	</div>
	 	
	 	<div id="btnDiv">
 		<button id="mEdit" class="green">수정</button> <button class="green">삭제</button> <button class="green">찜</button> <button class="green">공유하기</button> <button class="green">신고하기</button>
 		</div>
 	<br/>
 		<div id="imgDiv">
 			<div id="imgList">
			 	<img src="<%=request.getContextPath()%>/img/ico_search_black.png" id="btnImg1" style="width: 50px; height: 50px;" title="버튼이미지">
			 	<img src="<%=request.getContextPath()%>/img/ico_search_black.png" id="img1" title="전체외관" >
			 	<img src="<%=request.getContextPath()%>/img/ico_filter.png" id="img2" title="거실">
			 	<img src="<%=request.getContextPath()%>/img/ico_search_black.png" id="img3" title="방1">
			 	<img src="<%=request.getContextPath()%>/img/ico_search_black.png" id="img4" title="전체외관" >
			 	<img src="<%=request.getContextPath()%>/img/ico_filter.png" id="img5" title="거실">
			 	<img src="<%=request.getContextPath()%>/img/ico_search_black.png" id="img6" title="방1">
			 	<img src="<%=request.getContextPath()%>/img/ico_search_black.png" id="btnImg2" style="width: 50px; height: 50px;" title="버튼이미지">
			 </div>	
 	</div>
 	
 	</div> <!-- topDiv 종료 -->
 	
	<hr/>
	
	<div id="middleDiv">
		<div id="houseExplain">
		<p class="s_title">이름 | 성별 | 나이</p> <br/>
		원하는지역1 | 원하는지역2 | 원하는지역3 | 원하는지역4 | 원하는지역5 <br/>
		<p> 월세 얼마 | 즉시입주가능 </p><br/>
		원하는 House 키워드 <br/>
		<p>원하는 집 키워드 보여주기 ~ ~ </p><br/>
		나의 성향 키워드 <br/>
		<p>나의 성향 키워드 보여주기 ~ ~</p> <br/>
		내 소개 <br/>
		소개글 불러오기 ~ ~ 
		
		</div> <!-- 방소개 div 종료 -->
		
		<div  id="peopleExplain">
		<ul>
			<li><img style="width:80px; height:80px;" src="<%=request.getContextPath()%>/img/ico_filter.png" id="profilePic1"/> </li>
			<li>응답률 : ㅁㅁ% <br/>
				최근접속 : 1일 전  <br/>
				<button class="green">초대하기</button></li>
		</ul>
		</div> <!-- peopleExplain div 종료 -->
	<hr/>
		<div id="matching">
		매칭률 넣어서 보여주기
		</div> <!-- matching div 종료 -->
	
	</div> <!-- middleFrm div 종료 -->

</div>