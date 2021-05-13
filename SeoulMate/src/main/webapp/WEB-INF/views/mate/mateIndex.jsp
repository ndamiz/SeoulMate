<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
.boxClass {
	width: 1200px;
	margin : 0 auto;
	height: 228px;
}
input[type="date"] {width:200px;}
input[type="text"] {width:100px;}
input[type="number"] {width:100px;}
#searchBox{width:300px; position:relative;}
.searchClass ul{display:inline-block; padding-top:10px; }

#iconPic {
	position: absolute;
	right: 2px;
	top: 8px;
}

#iconPic1 {
	position: relative;
	right: 54px;
	top: 14px;
	box-shadow: none;
	border: none;
	border-radius: inherit;
	margin: 0;
	padding: 0;
	line-height: inherit;
	height: inherit;
	width: 40px;
	height: 40px;
}

#iconPic1::before {
	content: "";
	display: block;
	position: absolute;
	width: 22px;
	height: 23px;
	top:6px;
	right: 9px;
	background: url(<%=request.getContextPath()%>/img/comm/ico_search_black.png) no-repeat;
	background-size: cover;
}
.checks_mate{
 	height: 50px;
    display: inline-block;
    line-height: 50px;
    position: relative;
    
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;}
button{position: relative;}

.mateSearch_wrap button.search::before{
 content:"";
   display: block;
   margin-left: -2px;
   width: 25px;
   height: 25px;
   background: url(<%=request.getContextPath()%>/img/main/ico_search_white.png) no-repeat;
   background-size: cover;
}
.mateSearch_wrap button.mate{
	margin-top: 30px;
	margin-left:35px;
}
</style>
<div class="wrap mateSearch_wrap">
<div class="content">
	<div class="boxClass"> <!-- 상단부분 div -->

	<ul class="searchClass">
			<li> <img src='<%=request.getContextPath()%>/img/ico_filter.png'/> 조건검색 </li>
			<li>
				
				<ul>	
					<li>
						<ul>
							<li><p>지역</p></li> 
							<li><input type="text" id="searchBox" placeholder="지역명&지하철명을 입력하세요" /> 
							<a id="iconPic1"> </a> </li>
						</ul>
						<ul>
							<li> 입주예정일 </li>
							<li> <input class="classDate" type="date"/> </li>
						</ul>
						<ul>
							<li> 월세범위 </li>
							<li> <input type="number" min="0" placeholder="0"/> - <input type="number" min="0" placeholder="0"/> 만원 </li>
						</ul>
						<ul>
							<li> <label> 성별</label> </li>
							<li class="checks_mate"> <div class="checks">
								<input type="radio" id="radio1" name="character1"> 
								 <label for="radio1">전체</label> 
								 <input type="radio" id="radio2" name="character1"> 
								 <label for="radio2">여성</label> 
								 <input type="radio" id="radio3" name="character1"> 
								 <label for="radio3">남성</label> 
								 </div> </li>
						</ul>
						<ul>
							<li> <button class="green search"></button> </li>
							
						</ul>
				</ul>
		</ul>		
		
		<button class="green mate" onclick="location.href='<%=request.getContextPath()%>/mateWrite'">메이트 등록하기</button> <br/>
		</div>
		
		<hr/>
		
	</div> <!-- content div 종료 -->

	<!-- 프리미엄 추천 하우스메이트 -->
	<section class="content recommend_list mate_list">
		<div class="list_head">
			<p class="m_title">${logName}님과 잘 어울리는 메이트예요!</p>
			<a href="">더보기</a>
		</div>
		<ul class="list_content">
			<c:forEach var="i" begin="0" end="2">
				<li>
					<div class="list_img">
						<p><span>매칭</span>90<b>%</b></p>
						<button class="btn_star"></button>
						<a href="<%=request.getContextPath()%>/mateView">
							<img alt="" src="<%=request.getContextPath()%>/img/comm/sample_mate01.png">
						</a>
					</div>
					<div class="list_title">
						<span class="mate_id">USER1</span>
						<span class="pay">￦ 100 / 25</span>
						<span class="address">서강동 | 합정동 | 당산동</span>
					</div>
					<ol class="list_icon">
						<li><p>여</p></li>
						<li><p>27세</p></li>
						<li><p>즉시</p></li>
					</ol>
				</li>
			</c:forEach>
		</ul>
	</section>
	
	<!-- 신규 하우스메이트 -->
	<section class="content recommend_list mate_list">
		<div class="list_head">
			<p class="m_title">NEW 하우스메이트</p>
			<a href="">더보기</a>
		</div>
		<ul class="list_content">
			<c:forEach var="i" begin="0" end="2">
				<li>
					<div class="list_img">
						
						<button class="btn_star"></button>
						<a href="">
							<img alt="" src="<%=request.getContextPath()%>/img/comm/sample_mate02.png">
						</a>
					</div>
					<div class="list_title">
						<span class="mate_id">USER1</span>
						<span class="pay">￦ 100 / 25</span>
						<span class="address">서강동 | 합정동 | 당산동</span>
					</div>
					<ol class="list_icon">
						<li><p>여</p></li>
						<li><p>27세</p></li>
						<li><p>즉시</p></li>
					</ol>
				</li>
			</c:forEach>
		</ul>
	</section>

</div> <!-- 전체 div 종료 -->
