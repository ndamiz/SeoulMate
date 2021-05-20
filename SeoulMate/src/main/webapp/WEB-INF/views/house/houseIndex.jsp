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

.searchClass .list_filter{
	margin-right: 30px !important;
}
</style>
<script>
	$(function(){
		$("#searchBox").click(function(){ // 해줘야하나 아직 모르겠음 뒤로가기했을 때 값이 그대로있는지 모름
			$("#searchBox").val("");
		});
	});
</script>
<div class="wrap houseSearch_wrap">
<div class="content">
	<div class="boxClass"> <!-- 상단부분 div -->
		<ul class="searchClass">
			<li> <img src='<%=request.getContextPath()%>/img/ico_filter.png'/> 조건검색 </li>
			<li>
				<ul>	
					<li>
						<form method="get" action="houseIndex">
							<ul>
								<li> 지역 </li> 
								<li><input type="text" name="addr" id="searchBox" value="${addr}" placeholder="지역명을 입력하세요"/> 
									<a id="iconPic1"></a></li>
							</ul>
<!-- 							<ul> -->
<!-- 								<li> 입주예정일 </li> -->
<!-- 								<li><input class="classDate" type="date"/></li> -->
<!-- 							</ul> -->
							<ul class="list_filter">
								<li>최대 월세</li>
<!-- 								<li><input type="number" min="0" placeholder="0"/> - <input type="number" min="0" placeholder="0"/> 만원 </li> -->
								<li><input type="number" min="0" placeholder="0"/> 만원 </li>
							</ul>
							<ul class="list_filter">
								<li>최대 보증금</li>
<!-- 								<li><input type="number" name="" id="" min="10" placeholder="0"/> - <input type="number" min="0" placeholder="0"/> 만원 </li> -->
								<li><input type="number" min="0" placeholder="0"/> 만원 </li>
							</ul>
							<ul>
								<li>
									<button class="green search"></button>
								</li>
							</ul>
						</form>
					</li>
				</ul>
			</li>
		</ul>		
		<button class="green room" onclick="location.href='<%=request.getContextPath()%>/houseWrite'">방 등록하기</button> <br/>
	</div>
	<hr/>
</div> <!-- content 종료 -->
<!-- 프리미엄 추천 쉐어하우스 -->
<c:if test="${logGrade==2}">
	<c:if test="${matePnoCheck>0}">
		<section class="content recommend_list">
			<div class="list_head">
				<p class="m_title">${logName}님과 잘 어울리는 집이예요!</p>
				<a href="">더보기</a>
			</div>
			<c:if test="${phList!=null}">
				<ul class="list_content">
					<c:forEach var="phList" items="${phList}">
						<li>
							<div class="list_img">
								<p><span>매칭</span>${phList.score}<b>%</b></p>
								<c:if test="${logId != null}">
									<button class="btn_star houselike" value="${phList.no}"></button>
								</c:if>
								<a href="houseView?no=${phList.no}">
									<img alt="${phList.housename}" src="<%=request.getContextPath()%>/housePic/${phList.housepic1}" onerror="this.src='<%=request.getContextPath()%>/img/comm/no_house_pic.png'">
								</a>
							</div>
							<div class="list_title">
								<span class="address">${phList.addr}</span>
								<span class="pay">￦ ${phList.deposit} / ${phList.rent}</span>
							</div>
							<ol class="list_icon">
								<li><p>${phList.room}</p></li>
								<li><p>${phList.bathroom}</p></li>
								<li><p>${phList.nowpeople}</p></li>
							</ol>
						</li>
					</c:forEach>
				</ul>
			</c:if>
			<c:if test="${phList==null}">
				<div class="empty_div">
					<img class="empty" src="<%=request.getContextPath()%>/img/empty.png" onerror="this.src='<%=request.getContextPath()%>/img/empty.png'"/>
					<p style="text-align:center;">매칭에 맞는 결과가 없습니다.</p>
				</div>
			</c:if>
		</section>
	</c:if>
</c:if>
	
<!-- 신규 쉐어하우스 -->
<section class="content recommend_list">
	<div class="list_head">
		<p class="m_title">NEW 쉐어하우스</p>
		<a href="#">더보기</a>
	</div>
	<ul class="list_content">
		<c:forEach items="${newHouseList}" var="newHouseVO">
			<li>
				<div class="list_img">
					<c:if test="${logGrade==2}">
						<c:if test="${matePnoCheck>0}"> <!-- 등록된 메이트 성향이 없으면 매칭을 안보여줌 -->
							<p><span>매칭</span>${newHouseVO.score}<b>%</b></p>
						</c:if>
					</c:if>
					<button class="btn_star houselike" value="${newHouseVO.no}"></button>
					<a href="houseView?no=${newHouseVO.no}">
						<img alt="" src="<%=request.getContextPath()%>/housePic/${newHouseVO.housepic1}" onerror="this.src='<%=request.getContextPath()%>/img/comm/no_house_pic.png'">
					</a>
				</div>
				<div class="list_title">
					<span class="address">${newHouseVO.addr}</span>
					<span class="pay">￦ ${newHouseVO.deposit} / ${newHouseVO.rent}</span>
				</div>
				<ol class="list_icon">
					<li><p>${newHouseVO.room}</p></li>
					<li><p>${newHouseVO.bathroom}</p></li>
					<li><p>${newHouseVO.nowpeople}</p></li>
				</ol>
			</li>
		</c:forEach>
	</ul>
</section>
</div>
