<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/housemate.css">
<style>

input[type="date"] {width:200px;}
input[type="text"] {width:100px;}
input[type="number"] {width:100px;}
#searchBox{width:300px;}
.searchClass ul{display:inline-block; padding-top:10px;}
#searchBox{position:relative;}
#searchBox>img{    position: relative;
    top: 10px;
    right: 40px;}



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
						<li><input type="text" id="searchBox" placeholder="지역명&지하철명을 입력하세요" /> <img id="iconPic" src='<%=request.getContextPath()%>/img/ico_search_black.png'/>  </li>
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
						<li> <img src="<%=request.getContextPath()%>/img/ico_search_black.png"/> </li>
						
					</ul>
			</ul>
	</ul>		
		
	</div>
	

	<button class="green" onclick="location.href='<%=request.getContextPath()%>/houseWrite1'">방 등록하기</button> <br/>
	<hr/>
	</div>


