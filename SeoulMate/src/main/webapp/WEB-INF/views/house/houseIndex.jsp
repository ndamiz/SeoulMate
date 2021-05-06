<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
.boxClass {
	width: 1110px;
	margin : 0 auto;
	height: 228px;
}

input[type="date"] {width: 200px;}
input[type="text"] {width: 100px;}
input[type="number"] {width: 100px;}

#searchBox {width: 300px; position: relative;}
.searchClass ul {display: inline-block;	padding-top: 10px;}

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

button {position: relative;}

.houseSearch_wrap button.search::before {
   content:"";
   display: block;
   margin-left: -2px;
   width: 25px;
   height: 25px;
   background: url(<%=request.getContextPath()%>/img/main/ico_search_white.png) no-repeat;
   background-size: cover;
}

.houseSearch_wrap button.room{margin-top: 30px;}

</style>

<div class="wrap houseSearch_wrap">
<div class="content">
	
	<div class="boxClass"> <!-- 상단부분 div -->

	<ul class="searchClass">
		<li> <img src='<%=request.getContextPath()%>/img/ico_filter.png'/> 조건검색 </li>
		<li>
			
			<ul>	
				<li>
					<ul >
						<li><p>지역</p></li> 
						<li><input type="text" id="searchBox" placeholder="지역명&지하철명을 입력하세요" /> 
						<a id="iconPic1"></a> </li>
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
						<li> 보증금범위 </li>
						<li> <input type="number" name="" id="" min="10" placeholder="0"/> - <input type="number" min="0" placeholder="0"/> 만원 </li>
					</ul>
					<ul>
						<li>
							<button type="submit" class="green search"></button>
						</li>
						
					</ul>
			</ul>
	</ul>		
		
	<button class="green room" onclick="location.href='<%=request.getContextPath()%>/houseWrite1'">방 등록하기</button> <br/>
	</div>
	
	<hr/>


<!-- 프리미엄 추천 쉐어하우스 -->
	<section class="content recommend_list">
		<div class="list_head">
			<p class="m_title">user님과 잘 어울리는 집이예요!</p>
			<a href="">더보기</a>
		</div>
		<ul class="list_content">
			<c:forEach var="i" begin="0" end="2">
				
				<li>
					<div class="list_img">
						<p><span>매칭</span>90<b>%</b></p>
						<button class="btn_star"></button>
						<a href="<%=request.getContextPath()%>/houseView">
							<img alt="" src="<%=request.getContextPath()%>/img/comm/sample_house01.png">
						</a>
					</div>
					<div class="list_title">
						<span class="address">서울시 마포구 서강동</span>
						<span class="pay">￦ 100 / 25</span>
					</div>
					<ol class="list_icon">
						<li><p>1</p></li>
						<li><p>2</p></li>
						<li><p>3</p></li>
					</ol>
				</li>
				
			</c:forEach>
		</ul>
	</section>
	
	<!-- 신규 쉐어하우스 -->
	<section class="content recommend_list">
		<div class="list_head">
			<p class="m_title">NEW 쉐어하우스</p>
			<a href="">더보기</a>
		</div>
		<ul class="list_content">
			<c:forEach var="i" begin="0" end="2">
				<li>
					<div class="list_img">
						
						<button class="btn_star"></button>
						<a href="">
							<img alt="" src="<%=request.getContextPath()%>/img/comm/sample_house02.png">
						</a>
					</div>
					<div class="list_title">
						<span class="address">서울시 마포구 서강동</span>
						<span class="pay">￦ 100 / 25</span>
					</div>
					<ol class="list_icon">
						<li><p>1</p></li>
						<li><p>2</p></li>
						<li><p>3</p></li>
					</ol>
				</li>
			</c:forEach>
		</ul>
	</section>

</div>
</div>
