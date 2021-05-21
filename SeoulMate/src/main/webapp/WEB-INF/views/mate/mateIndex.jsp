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
.searchClass .list_filter{
	margin-right: 30px !important;
}
</style>
<script>
	$(function(){
		$("#searchBox").click(function(){ // 해줘야하나 아직 모르겠음 뒤로가기했을 때 값이 그대로있는지 모름
			$("#searchBox").val("");
		});
		$("#hPnoSelect>a").click(function(){
			var hpno=$(this).attr("id");
			location.href="hpnoDefaultMateIndex?pno="+hpno;
		});
	});
	
 	function search() {
 		var area = '${pVO.area}'
 		var rent = ${pVO.rent}
 		var deposit = ${pVO.deposit}
 		var gender = ${pVO.gender}
 		console.log(area);
 		console.log(rent);
 		console.log(deposit);
 		console.log(gender);
 		console.log('=================');
 		console.log($('#searchBox').val());
 		console.log($('#searchRent').val());
 		console.log($('#searchDeposit').val());
 		console.log($('input[name="gender"]:checked').val());
 		
 		
 		if(area==$("#searchBox").val() && (rent==$("#searchRent").val() || $("#searchRent")==null) && (deposit==$("#searchDeposit").val() || $("#searchDeposit").val()==null) && (gender ==$('input[name="gender"]:checked').val() || $('input[name="gender"]:checked').val()==null)){
 		
 		}else{
			$('#hiddenPageNum').val('1');
 		}
 		
	} 
</script>
<div class="wrap mateSearch_wrap">
<div class="content">
	<div class="boxClass"> <!-- 상단부분 div -->
		<ul class="searchClass">
			<li><img src='<%=request.getContextPath()%>/img/ico_filter.png'/> 조건검색 </li>
			<li>
				<ul>	
					<li>
						<form method="get" action="mateIndex" id="mateIndexForm" onsubmit="return search();">
							<input type="hidden" id="hiddenPageNum" name="pageNum" value="${pVO.pageNum}">
							<ul>
								<li><p>지역</p></li> 
								<li><input type="text" name="area" id="searchBox" value="${pVO.area}" placeholder="지역명을 입력하세요" /> 
									<a id="iconPic1"></a></li>
							</ul>
							<ul class="list_filter">
								<li> 최대 월세 </li>
								<li><input type="number" name="rent" id="searchRent" value="<c:if test='${pVO.rent!=0}'>${pVO.rent}</c:if>" min="0" placeholder="0"/> 만원 </li>
							</ul>
							<ul class="list_filter">
								<li>최대 보증금</li>
								<li><input type="number" name="deposit" id="searchDeposit" value="<c:if test='${pVO.deposit!=0}'>${pVO.deposit}</c:if>" min="0" placeholder="0"/> 만원 </li>
							</ul>
							<ul>
								<li><label> 성별</label></li>
								<li class="checks_mate">
									<div class="checks">
										<input type="radio" id="radio1" name="gender" value="0" <c:if test='${pVO.gender==0}'>checked</c:if>/> 
										<label for="radio1">전체</label> 
										<input type="radio" id="radio2" name="gender" value="1" <c:if test='${pVO.gender==1}'>checked</c:if>/> 
										<label for="radio2">여성</label> 
										<input type="radio" id="radio3" name="gender" value="3" <c:if test='${pVO.gender==3}'>checked</c:if>/> 
										<label for="radio3">남성</label> 
									</div>
								</li>
							</ul>
							<ul>
								<li><button class="green search"></button></li>
							</ul>
						</form>
					</li>
				</ul>
			</ul>		
			<button class="green mate" onclick="location.href='<%=request.getContextPath()%>/mateWrite'">메이트 등록하기</button><br/>
		</div>
		<hr/>
	</div> <!-- content div 종료 -->
	<c:if test="${myHousePnoCnt>0}">
	   <c:if test="${logGrade==2}">
			<div class="title_wrap" id="hPnoSelect">
	   			<p class="s_title">어느 집의 메이트를 구하시나요?</p><br/>
				<c:forEach var="housePno" items="${myHousePno}">
					<a class="<c:if test='${hPno==housePno.pno}'>green</c:if>" id="${housePno.pno}">
						<c:if test="${housePno.housename!=null}">${housePno.housename}</c:if>
						<c:if test="${housePno.housename==null}">성향${housePno.pno}</c:if>
					</a>
				</c:forEach>
			</div>
		   <!-- 프리미엄 추천 하우스메이트 -->
		   <section class="content recommend_list mate_list">
		      <div class="list_head">
		         <p class="m_title">${logName}님과 잘 어울리는 메이트예요!</p>
		         <a href="">더보기</a>
		      </div>
		      <c:if test="${pmList!=null}">
			      <ul class="list_content">
			         <c:forEach var="pmList" items="${pmList}">
			            <li>
			               <div class="list_img">
			                  <p><span>매칭</span>${pmList.score}<b>%</b></p>
			                  <button class="btn_star matelike" value="${pmList.no}"></button>
			                  <a href="mateView?no=${pmList.no}">
			                     <img alt="" src="<%=request.getContextPath()%>/matePic/${pmList.matepic1}" onerror="this.src='<%=request.getContextPath()%>/img/comm/no_mate_pic.png'">
			                  </a>
			               </div>
			               <div class="list_title">
			                  <span class="mate_id">${pmList.userid}</span>
			                  <span class="pay">￦ ${pmList.deposit} / ${pmList.rent}</span>
			               </div>
			               <span class="address">
			               	${pmList.area1} 
			               	<c:if test="${pmList.area2 != null}">
			                	| ${pmList.area2} 
			               	</c:if>
			               	<c:if test="${pmList.area3 != null}">
			                	| ${pmList.area3}
			               	</c:if>
			               </span>
			               <span class="address">${pmList.addr}</span>
			               <ol class="list_icon">
			                  <li>
			                  	<p>
				                  	<c:if test="${pmList.gender==1}">여</c:if>
	                  				<c:if test="${pmList.gender==3}">남</c:if>
	                  			</p>
							  </li>
			                  <li><p>${pmList.birth}세</p></li>
			                  <li><p>${pmList.enterdate}</p></li>
			               </ol>
			            </li>
			         </c:forEach>
			      </ul>
		      </c:if>
		      <c:if test="${pmList==null}">
				<div class="empty_div">
	      			<img class="empty" src="<%=request.getContextPath()%>/img/empty.png" onerror="this.src='<%=request.getContextPath()%>/img/empty.png'"/>
	      			<p style="text-align:center;">매칭에 맞는 결과가 없습니다.</p>
      			</div>
		      </c:if>
		   </section>
	   </c:if>
   </c:if>
   <!-- 신규 하우스메이트 -->
   <section class="content recommend_list mate_list">
      <div class="list_head">
         <p class="m_title">NEW 하우스메이트</p>
         <a href="">더보기</a>
      </div>
      <c:if test="${newMateListCnt>0}">
	      <ul class="list_content">
	         <c:forEach items="${newMateList}" var="newMateVO">
	            <li>
	               <div class="list_img">
	               	 <c:if test="${myHousePnoCnt>0}"> <!-- 등록된 하우스 성향이 없으면 매칭을 안보여줌 -->
	               	 	<c:if test="${logGrade==2}"> <!-- 프리미엄만 매칭을 보여줌 -->
	                  		<p><span>매칭</span>${newMateVO.score}<b>%</b></p>
	                  	</c:if>
	                 </c:if>
	                  <button class="btn_star matelike" value="${newMateVO.no}"></button>
	                  <a href="mateView?no=${newMateVO.no}
						<c:if test='${pVO.pageNum!=null && pVO.pageNum != 1}'>&pagenum=${pVO.pageNum}</c:if>
						<c:if test='${pVO.area!=null && pVO.area!=""}'>&area=${pVO.area}</c:if>
						<c:if test='${pVO.rent!=null && pVO.rent != 0}'>'&rent=${pVO.rent}</c:if>
						<c:if test='${pVO.deposit!=null && pVO.deposit != 0}'>&deposit=${pVO.deposit}</c:if>
						<c:if test='${pVO.gender!=null && pVO.gender != 0}'>&gender=${pVO.gender}</c:if>
						">
	                  	
	                     <img alt="" src="<%=request.getContextPath()%>/matePic/${newMateVO.matePic1}" onerror="this.src='<%=request.getContextPath()%>/img/comm/no_mate_pic.png'">
	                  </a>
	               </div>
	               <div class="list_title">
	                  <span class="mate_id">${newMateVO.userid}</span>
	                  <span class="pay">￦ ${newMateVO.deposit} / ${newMateVO.rent}</span>
	               </div>
	               <span class="address">
	               	${newMateVO.listVO.area1} 
	               	<c:if test="${newMateVO.listVO.area2 != null}">
	                	| ${newMateVO.listVO.area2} 
	               	</c:if>
	               	<c:if test="${newMateVO.area3 != null}">
	                	| ${newMateVO.listVO.area3}
	               	</c:if>
	               </span>
	               <ol class="list_icon">
	                  <li>
	                  	<p>
	                  		<c:if test="${newMateVO.gender==1}">여</c:if>
	                  		<c:if test="${newMateVO.gender==3}">남</c:if>
	                  	</p>
	                  </li>
	                  <li>
	                  	<p>
	                  		${newMateVO.birth}세
	                  	</p>
	                  </li>
	                  <li>
	                  	<p>
	                  		${newMateVO.enterdate}
	                  	</p>
	                  </li>
	               </ol>
	            </li>
	         </c:forEach>
	      </ul>
	  </c:if>
	  <c:if test="${newMateListCnt==0}">
	  	<div class="empty_div">
      		<img class="empty" src="<%=request.getContextPath()%>/img/empty.png" onerror="this.src='<%=request.getContextPath()%>/img/empty.png'"/>
      		<p style="text-align:center;">필터에 맞는 결과가 없습니다.</p>
     	</div>
	  </c:if>

	<div class="paging">
		<c:if test="${pVO.pageNum>1 }">
			<a href="javascript:pageClick('first_page')" class="first_page"></a>
			<a href="javascript:pageClick('prev_page')"  class="prev_page"></a>
		</c:if>
		<c:if test="${pVO.pageNum==1 }">
			<a href="#" class="first_page"></a>
			<a href="#"  class="prev_page"></a>
		</c:if>
		<c:forEach var="pageNum" begin="${pVO.startPageNum }" end="${pVO.startPageNum + pVO.onePageNum-1 }">
			<c:if test="${pageNum<=pVO.totalPage }">
				<c:if test="${pageNum==pVO.pageNum }">
					<a href="javascript:pageClick('${pageNum }')" class="nowPageNum on">${pageNum }</a>
				</c:if>
				<c:if test="${pageNum!=pVO.pageNum }">
					<a href="javascript:pageClick('${pageNum }')">${pageNum }</a>
				</c:if>
			</c:if>
		</c:forEach>
		<c:if test="${pVO.pageNum < pVO.totalPage }">
			<a href="javascript:pageClick('next_page')" class="next_page"></a>
			<a href="javascript:pageClick('last_page')" class="last_page"></a>
		</c:if>
		<c:if test="${pVO.pageNum == pVO.totalPage }">
			<a href="#" class="next_page"></a>
			<a href="#" class="last_page"></a>
		</c:if>
	</div>
   </section>
</div> <!-- 전체 div 종료 -->
<script>
//페이징
function pageClick(msg){
	var pageNum = '<c:out value="${pVO.pageNum }"/>';  //현재 눌려있는 페이지
	var startPageNum = '<c:out value="${pVO.startPageNum }"/>'; // 페이징 시작 페이지
	var totalPage = '<c:out value="${pVO.totalPage }"/>'; //마지막 페이징
	var changePageNum = 0;
	if(msg=='next_page'){
		changePageNum = Number(pageNum)+1;
	}else if(msg=='last_page'){
		changePageNum = Number(totalPage);
	}else if(msg=='first_page'){
		changePageNum = 1;
	}else if(msg=='prev_page'){
		changePageNum = Number(pageNum)-1;
	}else{
		changePageNum = Number(msg);
	}
	// 히든에 값넣고
	$('#hiddenPageNum').val(changePageNum);
	// 서브밋 실행 
	$('#mateIndexForm').submit();
}
</script>
