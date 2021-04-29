<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
img{width:250px; height:250px; }
/* ul, li{float:left;} */
#topDiv{height:300px; width:100%; position: relative; margin-bottom: 50px; }
#topDiv>img{height: 200px; width: 200px;}
#dateDiv{float: left; height: 50px; }
#btnDiv{float: right; height: 50px; overflow: auto;}
#middle_Div{  width:100%; height:400px; }
#middle_Div>div{float:left;}
#houseExplain{width:65%; height:100%; }
#peopleExplain{width:35%; margin:0 auto; text-align: center;  }
#peopleExplain>ul{ text-align:center; align-items: center;} 
#peopleExplain li{ /*display:inline-block;*/ text-align:center; align-items: center; height: 100%;}
#profilePic1{width:150px; height:150px; margin-top: 5px;}
#matching{position: relative;}

#middleDiv{ width:100%; height:400px;}
#middleDiv>div{float:left;}
#houseExplain{width:65%; height:100%; }
#peopleExplain{width:35%;   }

/* 슬라이드 */
.slide_wraper{
   height:250px;
   width:750px;
   margin:0 auto;
   overflow:hidden;
   
}
.slides{
   position:relative;
   top:0;
   left:0;
   width:100%;
   height:100%;
   transition: left 0.5s ease-out;
   margin:0 auto;
   text-align: center;
}
.slides>ul>li:not(:last-child){
   float:left;
   
}
.slides>ul>li>img{
   width:250px;
   height:250px;
   display:block;
}

.controlls{
   width:100%;
   height:40px;
   position:absolute;
	z-index: 1;
	top:50%

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
   display:block;
   left:15%;
}
.controlls span.next{
   left:83%;
}

#my_modal {
    display: none;
    width: 500px;
    height:650px;
    padding: 10px 30px;
    background-color: #fefefe;
    border: 1px solid #888;
    border-radius: 3px;
}
#my_modal p{margin: 15px 0;}
#my_modal ul{line-height: 30px;
	height: 30px;
	text-align: center;
	float: left;
	width: 100%;
	margin: 0;
	padding: 0;
}

 .modal_close_btn{
 position: absolute;
 right: 180px;
 bottom: 50px;
 margin: 0 auto;
 }
.report{
    position: absolute;
    right: 250px;
    bottom: 50px;
    margin: 0 auto;
}

#my_modal img{width:250px; height: 250px; text-align: center; }
     
#reportS{width: 135px; height: 35px;}

/* #vIconTw { */
/* 	position: relative; */
/* 	right: 50px; */
/* 	top: 20px; */
/* 	box-shadow: none; */
/* 	border: none; */
/* 	border-radius: inherit; */
/* 	margin: 0; */
/* 	padding: 0; */
/* 	line-height: inherit; */
/* 	height: inherit; */
/* 	width: 40px; */
/* 	height: 40px; */
/* } */

/* #vIconTw::before { */
/* 	content: ""; */
/* 	display: block; */
/* 	position: absolute; */
/* 	width: 30px; */
/* 	height: 30px; */
/* 	top:20px; */
/* 	left: 50px; */
<%-- 	background: url(<%=request.getContextPath()%>/img/house/twt.png) no-repeat; --%>
/* 	background-size: cover; */
/* } */

.modal_wrap{
        display: none;
        width: 550px;
        height: 300px;
        position: absolute;
        top:20%;
        left: 30%;
        margin: 0 auto;
        background: white;
        z-index: 2;
        border:1px solid black; 

    }
.modal_wrap p{text-align: center; left: 180px;}
.share_modal{width:100%; }
.share_modal li{
	line-height: 30px;
	height: 30px;
	float:left;
	width:25%; 
	margin: 0;
	padding: 0;
}
 .share_close_btn{
 position: absolute;
 left: 230px;
 bottom: 50px;
 margin: 0 auto;
 }

</style>
<script>
	$(function(){
		 $('#mEdit').click(function(){ //수정하기 버튼
	        	location.href="mateWrite1"; //메이트등록하기 form 으로 이동
	        	
	        });
		
	       var slides = document.querySelector('.slides'),
	        slide = document.querySelectorAll('.slides li'),
	        currentIdx =0,   //현재인덱스
	        slideCount = slide.length, //슬라이드의 갯수
	        prevBtn = document.querySelector('.prev'),
	        nextBtn = document.querySelector('.next');
	        slideWidth = 250,
	        slideMargin = 0,
	     
	     slides.style.width = (slideWidth + slideMargin)*slideCount - slideMargin +'px';//슬라이드의 넓이
	     
	     function moveSlide(num){
	        slides.style.left = -num * 250 +'px';
	        currentIdx = num;
	     }
	     
	     //버튼이벤트
	     nextBtn.addEventListener('click',function(){
	        console.log(currentIdx);
	        if(currentIdx < slideCount - 3){
	           moveSlide(currentIdx + 1);
	           if(currentIdx>0){
	              prevBtn.style.display = 'block';
	           }
	           if(currentIdx==slideCount-3){
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
		 
	     
	   //모달 팝업창
	     function modal(id) {
	    	    var zIndex = 9999;
	    	    var modal = document.getElementById(id);

	    	    // 모달 div 뒤에 배경 레이어
	    	    var bg = document.createElement('div');
	    	    bg.setStyle({
	    	        position: 'fixed',
	    	        zIndex: zIndex,
	    	        left: '0px',
	    	        top: '0px',
	    	        width: '100%',
	    	        height: '100%',
	    	        overflow: 'auto',
	    	        // 레이어 색갈은 여기서 바꾸면 됨
	    	        backgroundColor: 'rgba(0,0,0,0.4)'
	    	    });
	    	    document.body.append(bg);

	    	    // 닫기 버튼 처리, 배경과 모달 div 지우기
	    	    modal.querySelector('.modal_close_btn').addEventListener('click', function() {
	    	        bg.remove();
	    	        modal.style.display = 'none';
	    	    });

	    	    modal.setStyle({
	    	        position: 'fixed',
	    	        display: 'block',
	    	        boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

	    	        // 배경 보다 한칸 위에 보이기
	    	        zIndex: zIndex + 1,

	    	        // div center 정렬
	    	        top: '50%',
	    	        left: '50%',
	    	        transform: 'translate(-50%, -50%)',
	    	        msTransform: 'translate(-50%, -50%)',
	    	        webkitTransform: 'translate(-50%, -50%)'
	    	    });
	    	}

	    	// Element 에 style 한번에 오브젝트로 설정하는 함수 추가
	    	Element.prototype.setStyle = function(styles) {
	    	    for (var k in styles) this.style[k] = styles[k];
	    	    return this;
	    	};

	    	document.getElementById('reportBtn').addEventListener('click', function() {
	    	    // 모달창 띄우기
	    	    modal('my_modal');
	    	});

	   });
    
	window.onload = function() { //공유하기 모달(팝업)창
 
    function onClick() {
        document.querySelector('.modal_wrap').style.display ='block';
        document.querySelector('.black_bg').style.display ='block';
    }   
    function offClick() {
        document.querySelector('.modal_wrap').style.display ='none';
        document.querySelector('.black_bg').style.display ='none';
    }
 
    document.getElementById('shareBtn').addEventListener('click', onClick);
    document.querySelector('.share_close_btn').addEventListener('click', offClick);
 
};


    $(window).ready(function(){ 	  //공유하기 창
        $(".snsList li a").click(function(){
			shareAct(this);
  		});
  });
    
    function shareAct(a){
  
        var snsCode = $(a).attr('id');
        var cUrl = document.location.href; console.log(cUrl);
  
        switch(snsCode){
  
            case"vIconTw":
                //트위터
                cUrl = 'https://twitter.com/intent/tweet?text=페이지제목:&url='+cUrl;
            break;
  
            case"vIconTg":
                //텔레그램
                cUrl = 'https://telegram.me/share/url?url='+cUrl;
            break;
                  
            case"vIconFb":
                //페이스북
                cUrl = 'http://www.facebook.com/sharer/sharer.php?u='+cUrl;
            break;
  
            case"vIconKs":
                //카카오스토리
                cUrl = 'https://story.kakao.com/share?url='+cUrl;
            break;
  			}
  		window.open(cUrl,'','width=700,height=500,top=300,left=450,scrollbars=yes');
		}

	
</script>
<div class="wrap">

	<div id="topDiv">
	 	<div id="dateDiv">
	 	등록날짜 2021-04-20 등록
	 	</div>
	 	
	 	<div id="btnDiv">
 		<button id="mEdit" class="green">수정</button> <button class="green">삭제</button> <button class="green">찜</button>
 		<a  id="shareBtn" class="green" >공유하기</a> <button class="green" id="reportBtn" >신고하기</button>
 		
 		</div>
 		
<!--  		<div class="black_bg"></div> -->
 		<div class="modal_wrap">
			<div class="share_modal">
			<p class="s_title">SNS 공유하기</p>
	 		<ul id="snsList" class="snsList">
	  
			  	<li><a href="#" id="vIconTw" onclick="return false;">트위터</a></li>
			  	<li><a href="#" id="vIconTg" onclick="return false;">텔레그램<i class="vIconTg"></i></a></li>
			  	<li><a href="#" id="vIconFb" onclick="return false;">페이스북<i class="vIconFb"></i></a></li>
			 	<li><a href="#" id="vIconKs" onclick="return false;">카카오스토리<i class="vIconKs"></i></a></li>
	  
			</ul>
			<br/>
				<a class="share_close_btn" >닫기</a>
	 		</div> <!-- share modal -->
 		</div> <!-- modal_wrap modal 종료 -->
		
 	<br/>
 	
 		<div class="controlls">
         	<span class="prev">◀</span>
         	<span class="next">▶</span>
        </div>
    
      	<div class="slide_wraper">
         	<div class="slides">
            	<ul>
	               <li><img src="<%=request.getContextPath()%>/img/house/mate01.jfif" title="메이트1"></li>
	               <li><img src="<%=request.getContextPath()%>/img/house/mate02.jfif"></li>
	               <li><img src="<%=request.getContextPath()%>/img/house/mate03.jfif"></li>
	               <li><img src="<%=request.getContextPath()%>/img/house/mate01.jfif"></li>
	               <li><img src="<%=request.getContextPath()%>/img/house/mate02.jfif"></li>
	            </ul>
	         </div> <!-- "slides" -->
	      </div> <!--slide_wraper -->
	 	
	 <div id="my_modal">
    	<ul>
    		<li><p class="s_title">신고하기</p></li>
    		<li><img src="<%=request.getContextPath()%>/img/house/mate01.jfif" id="reportPic" /></li>
    		<li>user id | 여성 | 30세</li>
    		<li>지역1 | 지역2 | 지역3 | 지역4 </li>
    		<li>월세 만원 | 즉시 입주 가능 </li>
    		<li> <label>신고 사유 </label><select id="reportS">
						<option value="">허위매물</option>
						<option>기간만료</option>
						<option>광고</option>
						<option>4</option>
					</select> </li>
<!-- 					<p>&nbsp;</p> -->
			<li><label>상세 사유</label>
					 <textarea cols="50"></textarea></li>
		</ul>
    	<a class="report">신고하기</a>
    	<a class="modal_close_btn">닫기</a>
	</div> <!-- 모달 종료 -->
	 	
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
			<li><img src="<%=request.getContextPath()%>/img/house/mate02.jfif" id="profilePic1"/> </li>
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