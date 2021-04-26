<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
.boxClass{height:200px;}
input[type="date"] {width:200px;}
input[type="text"] {width:100px;}
input[type="number"] {width:100px;}
#searchBox{width:300px;}
.searchClass ul{display:inline-block; padding-top:10px;}
#searchBox{position:relative;}
#iconPic{    position: absolute;
    right: 2px;
    top: 8px;}
 #iconPic1{position:relative; right:70px; top:18px;}
button{position: relative;}

button::before{
content:"";
display: block;
position: absolute;
width: 14px;
height: 23px;
top: 8px;
right: 0;
background: url(../img/main/ico_search_black.png) no-repeat;
background-size: cover;
}
</style>

<div class="wrap">
	
	<div class="boxClass"> <!-- 상단부분 div -->

	<ul class="searchClass">
		<li> <img src='<%=request.getContextPath()%>/img/ico_filter.png'/> 조건검색 </li>
		<li>
			
			<ul>	
				<li>
					<ul >
						<li><p>지역</p></li> 
						<li><input type="text" id="searchBox" placeholder="지역명&지하철명을 입력하세요" /> 
						<a id="iconPic1"><img id="iconPic" src='<%=request.getContextPath()%>/img/ico_search_black.png'/> </a> </li>
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
						<li> <button type="submit" class="green"></button> </li>
						
					</ul>
			</ul>
	</ul>		
		
	</div>
	
	<button class="green" onclick="location.href='<%=request.getContextPath()%>/houseWrite1'">방 등록하기</button> <br/>
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
						<a href="">
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
						<p><span>매칭</span>90<b>%</b></p>
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
