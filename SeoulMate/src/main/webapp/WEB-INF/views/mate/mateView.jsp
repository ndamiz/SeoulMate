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
   width:250px;
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
   width:80%;
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
   left:37%;
}
.controlls span.next{
   left:75%;
}

.report{
    position: absolute;
    right: 250px;
    bottom: 50px;
    margin: 0 auto;
}

#reportS{width: 135px; height: 35px;}

#pup_wrap_report{display: none;}
#pup_wrap_share{display: none;}
#pup_wrap_share .list_title{width: 100%;}
#snsList li{float: left;}

#vIconTw, #vIconTg, #vIconFb, #vIconKs{
	position: relative;
	box-shadow: none;
	border: none;
	border-radius: inherit;
	margin: 0;
	padding: 0;
	line-height: inherit;
	height: inherit;
	width: 40px;
	height: 40px;
	font-size:0;
}
.snsList li {margin:0 10px;}
.pup_body{height: inherit;}
#pup_wrap_share .list_title{margin: 0 auto; width: max-content}
.snsList li a::before {
	content: "";
	display: block;
	position: absolute;
	width: 40px;
	height: 40px;
}
#vIconTw::before {
	background: url(/home/img/house/twt.png) no-repeat;
	background-size: cover;
}
#vIconTg::before {
	background: url(/home/img/house/telegram.png) no-repeat;
	background-size: cover;
}
#vIconFb::before {
	background: url(/home/img/house/facebook.png) no-repeat;
	background-size: cover;
}
#vIconKs::before {
	background: url(/home/img/house/kakaostory.jpg) no-repeat;
	background-size: cover;
}
</style>
<script>

	$(()=>{
		$("#mateDel").click(()=>{
			if(confirm("삭제하시겠습니까?")){
				location.href="mateDel?no=${mVO.no }" 
			};
		});
	});

	$(function(){
		 $('#mEdit').click(function(){ //수정하기 버튼
	        	location.href="mateEdit"; //메이트등록하기 form 으로 이동
	        	
	        });
		 

			$("#reportBtn").click(function(){
				$("#pup_wrap_report").css("display", "block");
				
			});
			
			
			$("#shareBtn").click(function(){
				$("#pup_wrap_share").css("display", "block");
				
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
	        if(currentIdx < slideCount - 1){
	           moveSlide(currentIdx + 1);
	           if(currentIdx>0){
	              prevBtn.style.display = 'block';
	           }
	           if(currentIdx==slideCount-5){
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
  		window.open(cUrl,'','width=700,height=500,top=300,left=450,scrollbars=yes')
  		}

	
</script>
<div class="wrap">
<div class="content">
	<div id="topDiv">
	 	<div id="dateDiv">
	 	${mVO.writedate } 등록
	 	</div>
	 	
	 	<div id="btnDiv">
	 	<c:if test="${logId==mVO.userid }">
 		<a id="mEdit" class="white" href="mateEdit?no=${mVO.no }" >수정</a> 
 		<a class="white" id="mateDel" >삭제</a> 
 		</c:if>
 		<button class="white">찜</button>
 		<a  id="shareBtn" class="white" >공유하기</a> <button class="white" id="reportBtn" >신고하기</button>
 		
 		</div>
 				
 	<br/>
 	
 		<div class="controlls">
         	<span class="prev">◀</span>
         	<span class="next">▶</span>
        </div>
    
      	<div class="slide_wraper">
         	<div class="slides">
            	<ul>
	               <li><img src="/home/housePic/${mVO.matePic1}" title="메이트1"></li>
	               <li><img src="<%=request.getContextPath()%>/img/house/mate02.jfif"></li>
	               <li><img src="<%=request.getContextPath()%>/img/house/mate03.jfif"></li>
	               <li><img src="<%=request.getContextPath()%>/img/house/mate01.jfif"></li>
	               <li><img src="<%=request.getContextPath()%>/img/house/mate02.jfif"></li>
	            </ul>
	         </div> <!-- "slides" -->
	      </div> <!--slide_wraper -->
	
 	</div> <!-- topDiv 종료 -->
 	
	<hr/>
	
	<div id="middleDiv">
		<div id="houseExplain">
		<p class="s_title">${mVO.userid } | 성별 | 나이</p> <br/>
		${mVO.area1 } | 원하는지역2 | 원하는지역3 <br/>
		<p> 보증금 ₩ ${mVO.deposit } | 월세 ₩ ${mVO.rent } </p><br/>
		원하는 House 키워드 <br/>
		<p>원하는 집 키워드 보여주기 ~ ~ </p><br/>
		나의 성향 키워드 <br/>
		<p>나의 성향 키워드 보여주기 ~ ~</p> <br/>
		소개글 <br/>
		${mVO.mateProfile }
		
		</div> <!-- 방소개 div 종료 -->
		
		<div  id="peopleExplain">
		<ul>
			<li><img src="/home/profilePic/${memProfilePic}" id="profilepic"/> </li>
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
</div> <!-- content div 종료 -->
</div>

		<div class="pup_wrap" id="pup_wrap_report">
		
		<div class="pup_form">
			<div class="pup_head">신고하기</div>
			<div class="pup_body">
			
			<div class="pup_list">
				<div class="list_img">
					<img src="<%=request.getContextPath()%>/img/house/mate01.jfif" id="reportPic" />
				</div>
				<div class="list_title">
						<p class="s_title">user id</p>
						<p class="s_title">여성</p>
						<p class="s_title">30세</p>
						<p class="d_title">서강동 / 망원동 / 합정동</p>
						<p class="d_title">월세 가격 / 보증금or즉시입주 가능</p> 
						<p class="d_title">신고사유 
							<select>
								<option> 허위매물 </option>
								<option> 기간만료 </option>
								<option> 광고물 </option>
							</select> </p>
						<p class="d_title">상세 사유 <textarea cols="30"></textarea></p>
				</div>
			</div>
			<div class="pup_bottom">
				<a href="" class="btn_cancel">닫기</a>
				<a href="" class="btn_save">신고하기</a>
			</div>
		</div>
			<a href="" class="btn_close">닫기</a>
		</div>
	</div>


		<div class="pup_wrap" id="pup_wrap_share">
			<div class="pup_form">
				<div class="pup_head">공유하기</div>
				<div class="pup_body">
						<div class="list_title">
							<ul id="snsList" class="snsList">
							<li><a href="#" id="vIconTw" onclick="return false;">트위터</a></li>
							<li><a href="#" id="vIconTg" onclick="return false;">텔레그램</a></li>
							<li><a href="#" id="vIconFb" onclick="return false;">페이스북</a> </li>
							<li><a href="#" id="vIconKs" onclick="return false;">카카오스토리</a> </li>
							</ul>
						</div>
					</div>
					<div class="pup_bottom">
						<a href="" class="btn_cancel">닫기</a>
						<a href="" class="btn_save">확인</a>
					</div>
				<a href="" class="btn_close">닫기</a>
			</div>
		</div>