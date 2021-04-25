<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
img{width:250px; height:250px; }
/* ul, li{float:left;} */
#topFrm{height:300px; width:100%; position: relative; }
#topFrm>img{height: 200px; width: 200px;}
/* #img4, #img5, #img6{display: none;} */
#dateFrm{float: left; height: 50px; }
#btnFrm{float: right; height: 50px; overflow: auto;}
#imgFrm{ width:100%; height:250px; overflow: hidden; }
#imgList{width:1600px; position: relative; }
#middle_Div{ background-color:lightpink; width:100%; height:400px; }
#middle_Div>div{float:left;}
#houseExplain{width:65%; height:100%; background-color:lightblue; }
#peopleExplain{width:35%; margin:0 auto; background-color:gray; text-align: center;  }
#peopleExplain>ul{ text-align:center; align-items: center;}
#peopleExplain li{ display:inline-block; text-align:center; align-items: center; height: 100%;}

#matching{position: relative;}
#map_Div{background-color:skyblue;}

</style>
<script>
    $(function(){
        $('#btnImg1').click(function(){
            $('#img1').animate({"width":"-=200px"}, 2000, function(){ 
                $(this).css('display', 'none');
//                 $('#img4').css('display', 'block');
            })   
       
          
		});
        
        $('#hEdit').click(function(){
        	location.href="houseWrite1"; //방등록하기 form 으로 이동
        	
        });
    

            
    });
</script>
<div class="wrap">
 
 	<div id="topFrm">
	 	<div id="dateFrm">
	 	등록날짜 2021-04-20 등록
	 	</div>
	 	
	 	<div id="btnFrm">
 		<button id="hEdit" onclick="houseWrite()" class="green">수정</button> <button class="green">삭제</button> <button class="green">찜</button> <button class="green">공유하기</button> <button class="green">신고하기</button>
 		</div>
 	<br/>
 		<div id="imgFrm">
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
 	
 	</div> <!-- topFrm 종료 -->
 	
 	
	<hr/>
	
	<div id="middle_Div">
		<div id="houseExplain">
		<p class="s_title">서울특별시 마포구 백범로</p> <br/> 
		보증금 얼마 | 월세 얼마 | 0명 구해요 | 즉시 입주 가능 <br/>
		<p>방 몇개 | 현재 거주중인 인원 | 욕실 몇개 </p> <br/>
		House 키워드 <br/>
		<p>집 키워드 보여주기 ~ ~ </p> <br/>
		Room 키워드 <br/>
		<p>방 키워드 보여주기 ~ ~ </p> <br/>
		우리집 소개 <br/>
		소개글 불러오기 ~ ~ 
		
		</div> <!-- houseExplain div 종료 -->
		
		<div  id="peopleExplain">
		
		<ul>
			<li ><img style="width:80px; height:80px;" src="<%=request.getContextPath()%>/img/ico_filter.png" id="profilePic1"/> </li>
			<li>응답률 : ㅁㅁ% <br/>
			최근접속 : 1일 전  <br/>
			<button class="green">약속잡기</button></li>
		</ul>
		</div> <!-- peopleExplain div 종료 -->
	<hr/>
		<div id="matching" >
		매칭률 넣어서 보여주기
		</div> <!-- macthing 넣을 div 종료 -->
	</div> <!-- middleFrm div 종료 -->
	
	<div id="map_Div">
	지도 부분
	
	</div> <!-- map_Div div종료 -->

</div>