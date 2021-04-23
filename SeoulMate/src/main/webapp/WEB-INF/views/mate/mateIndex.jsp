<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
.boxClass{height:100%; }
.boxClass li{line-height:40px; height:40px; }
input[type="date"] {width:200px;}
input[type="text"] {width:100px;}
input[type="number"] {width:100px;}
#searchBox{width:300px;}
.searchClass ul{display:inline-block; padding-top:10px; padding-left:20px;}
#searchBox{position:relative;}
#iconPic{    position: relative;
    right: 50px;
    top: 10px;}

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
						<li><input type="text" id="searchBox" placeholder="지역명&지하철명을 입력하세요" /> <img id="iconPic" src='<%=request.getContextPath()%>/img/ico_search_black.png'/>  </li>
					</ul>
					<ul>
						<li> <p>입주예정일</p> </li>
						<li> <input class="classDate" type="date"/> </li>
					</ul>
					<ul>
						<li> 월세범위 </li>
						<li> <input type="number" min="0" placeholder="0"/> - <input type="number" min="0" placeholder="0"/> 만원 </li>
					</ul>
				
					<ul>
						<li> <label> 성별</label> </li>
						<li> <div class="checks">
							<input type="radio" id="radio1" name="character1"> 
							 <label for="radio1">전체</label> 
							 <input type="radio" id="radio2" name="character1"> 
							 <label for="radio2">여성</label> 
							 <input type="radio" id="radio3" name="character1"> 
							 <label for="radio3">남성</label> 
							 </div> </li>
					</ul>
					<ul>
						<li> <img src="<%=request.getContextPath()%>/img/ico_search_black.png"/> </li>
					</ul>
			</ul>
	</ul>		
	
	</div>	
	
	 <hr/>

	<button class="green" onclick="location.href='<%=request.getContextPath()%>/mateWrite1'">메이트 등록하기</button> <br/>

</div>
