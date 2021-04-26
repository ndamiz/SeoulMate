<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>

/* ul, li{float:left;} */
#topDiv{height:300px; width:100%; position: relative; }
#topDiv>img{height: 200px; width: 200px;}
/* #img4, #img5, #img6{display: none;} */
#dateDiv{float: left; height: 50px; }
#btnDiv{float: right; height: 50px; overflow: auto;}
#imgDiv{ width:100%; height:250px; overflow: hidden; } /*바깥쪽 div*/
#imgDiv img{width:250px; height: 250px; }
/* #imgList{width:1600px; position: relative; } */ /*이미지만 넣어놓는 div*/
#middle_Div{ background-color:lightpink; width:100%; height:400px; }
#middle_Div>div{float:left;}
#houseExplain{width:65%; height:100%; background-color:lightblue; }
#peopleExplain{width:35%; margin:0 auto; background-color:gray; text-align: center;  }
#peopleExplain>ul{ text-align:center; align-items: center;}
#peopleExplain li{ display:inline-block; text-align:center; align-items: center; height: 100%;}

#matching{position: relative;}
#map_Div{background-color:skyblue;}

/* 슬라이드 */
.slideBox{
   height:440px;
   width:1600px;
   margin:0 auto;
}
.slide_wraper{
   height:250px;
   width:100%;
   
   overflow:hidden;
}
.slides{
   position:relative;
   top:0;
   left:0;
   width:1600px;
   height:100%;
   transition: left 0.5s ease-out;
}
.slides>ul>li:not(:last-child){
   float:left;
   margin-right:30px;
}
.slides>ul>li>img{
   width:250px;
   height:250px;
   display:block;
}

.controlls{
   width:100%;
   height:40px;
   position:relative;
   margin:0 auto;

}
.controlls span{
   font-size:25px;
   width:40px;
   height:40px;
   line-height:40px;
   position:absolute;
   left:0;
   top:0;
}
.controlls span.prev{
   display:none;
}
.controlls span.next{
   left:50px;
}

</style>
<script>
    $(function(){
        $('#btnImg1').click(function(){
            $('#img1').animate({"width":"-=200px"}, 2000, function(){ 
                $(this).css('display', 'none');

            })   
       
          
		});
        
        $('#hEdit').click(function(){ //수정하기 버튼
        	location.href="houseWrite1"; //방등록하기 form 으로 이동
        	
        });
        
      
        var slides = document.querySelector('.slides'),
        slide = document.querySelectorAll('.slides li'),
        currentIdx =0,   //현재인덱스
        slideCount = slide.length, //슬라이드의 갯수
        prevBtn = document.querySelector('.prev'),
        nextBtn = document.querySelector('.next');
        slideWidth = 400,
        slideMargin = 30,
     
     slides.style.width = (slideWidth + slideMargin)*slideCount - slideMargin +'px';//슬라이드의 넓이
     
     function moveSlide(num){
        slides.style.left = -num * 430 +'px';
        currentIdx = num;
     }
     
     //버튼이벤트
     nextBtn.addEventListener('click',function(){
        console.log(currentIdx);
        if(currentIdx < slideCount - 4){
           moveSlide(currentIdx + 1);
           if(currentIdx>0){
              prevBtn.style.display = 'block';
           }
           if(currentIdx==slideCount-4){
              nextBtn.style.display = 'none';
           }
        }
     });
     prevBtn.addEventListener('click',function(){
        if(currentIdx >0){
           moveSlide(currentIdx - 1);
           if(currentIdx==0){
              prevBtn.style.display = 'none';
           }
           if(currentIdx==slideCount-5){
              nextBtn.style.display = 'block';
           }
        }
     });

        
    });
</script>
<div class="wrap">
 
 	<div id="topDiv">
	 	<div id="dateDiv">
	 	등록날짜 2021-04-20 등록
	 	</div>
	 	
	 	<div id="btnDiv">
 		<button id="hEdit" class="green">수정</button> <button class="green">삭제</button> <button class="green">찜</button> 
 		<button class="green">공유하기</button> <button class="green" data-target="#md" data-toggle="modal">신고하기</button>
 		</div>
 	

 	

<!--  		<div class="modal fade" id="md"> 전체 div fade 적용시 모달창이 점점 진해지며 나타남 -->
<!--         <div class="modal-dialog">  -->
<!--             <div class="modal-content"> -->
<!--                 Header -->
<!--                 <div class="modal-header"> -->
<!--                     <h4 class="modal-title">모달 제목</h4> -->
<!--                     <button class="close" data-dismiss="modal">&times;</button> X 닫기창 표기됨 -->
<!--                 </div> -->
                
<!--                 Content -->
<!--                 <div class="modal-body"> -->
<!--                     <h3>모달 내용</h3> -->
<!--                     <img src="../img/img1.jpg" width="100%" height="300px"/> -->
<!--                 </div> -->
                
<!--                 Footer -->
<!--                 <div class="modal-footer"> -->
<!--                     <button data-dismiss="modal" class="btn btn-danger">Close</button> -->
<!--                 </div> -->

<!--             </div> -->
<!--         </div> -->
<!--     </div> -->
    
 	<br/>
<!--  		<div id="imgDiv"> -->
<!--  			<div id="imgList"> -->
<%-- 			 	<img src="<%=request.getContextPath()%>/img/ico_search_black.png" id="btnImg1" style="width: 50px; height: 50px;" title="버튼이미지"> --%>
<%-- 			 	<img src="<%=request.getContextPath()%>/img/ico_search_black.png" id="img1" title="전체외관" > --%>
<%-- 			 	<img src="<%=request.getContextPath()%>/img/ico_filter.png" id="img2" title="거실"> --%>
<%-- 			 	<img src="<%=request.getContextPath()%>/img/ico_search_black.png" id="img3" title="방1"> --%>
<%-- 			 	<img src="<%=request.getContextPath()%>/img/ico_search_black.png" id="img4" title="전체외관" > --%>
<%-- 			 	<img src="<%=request.getContextPath()%>/img/ico_filter.png" id="img5" title="거실"> --%>
<%-- 			 	<img src="<%=request.getContextPath()%>/img/ico_search_black.png" id="img6" title="방1"> --%>
<%-- 			 	<img src="<%=request.getContextPath()%>/img/ico_search_black.png" id="btnImg2" style="width: 50px; height: 50px;" title="버튼이미지"> --%>
<!-- 			 </div>	 -->
<!--  	</div> -->
 	
 	   
<!--    <div class="slideBox" trigger-up> 슬라이드 -->
    <div class="controlls">
         <span class="prev">◀</span>
         <span class="next">▶</span>
      </div>
    
      <div class="slide_wraper">
         <div class="slides">
            <ul>
               <li><img src="<%=request.getContextPath()%>/img/ico_filter.png" title="방1"></li>
               <li><img src="<%=request.getContextPath()%>/img/ico_search_black.png"></li>
               <li><img src="<%=request.getContextPath()%>/img/img01.jpg"></li>
               <li><img src="<%=request.getContextPath()%>/img/fi-rr-calendar.svg"></li>
               <li><img src="<%=request.getContextPath()%>/img/fi-rr-stats.svg"></li>
            </ul>
         </div> <!-- "slides" -->
      </div> <!--slide_wraper -->
<!--    </div> slideBox -->
  
 	
 	</div> <!-- topDiv 종료 -->
 	
 	
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