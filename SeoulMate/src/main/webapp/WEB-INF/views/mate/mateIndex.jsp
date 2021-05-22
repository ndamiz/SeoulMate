<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/doo.css">

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
	<div class="boxClass"> <!-- 상단부분 div -->
		<p class="d_title">조건검색</p>
		<form method="get" action="mateIndex" id="mateIndexForm" onsubmit="return search();">
			<input type="hidden" id="hiddenPageNum" name="pageNum" value="${pVO.pageNum}">
			<ul class="searchClass">
				<li>
					<p>지역</p>
					<input type="text" name="area" id="searchBox" value="${pVO.area}" placeholder="지역명을 입력하세요" /> 
					<!-- <a id="iconPic1"></a> -->
					<label><button id="iconPic1"></button></label> 
					
				</li>
				<li>
					<p>최대 월세</p>
					<input type="number" name="rent" id="searchRent" value="<c:if test='${pVO.rent!=0}'>${pVO.rent}</c:if>" min="0" placeholder="0"/>
					<label>만원</label> 
				</li>
				<li>
					<p>최대 보증금</p>
					<input type="number" name="deposit" id="searchDeposit" value="<c:if test='${pVO.deposit!=0}'>${pVO.deposit}</c:if>" min="0" placeholder="0"/>
					<label>만원</label> 
				</li>
				<li>
					<p> 성별</p>
					<div class="checks">
						<input type="radio" id="radio1" name="gender" value="0" <c:if test='${pVO.gender==0}'>checked</c:if>/> 
						<label for="radio1">전체</label> 
						<input type="radio" id="radio2" name="gender" value="1" <c:if test='${pVO.gender==1}'>checked</c:if>/> 
						<label for="radio2">여성</label> 
						<input type="radio" id="radio3" name="gender" value="3" <c:if test='${pVO.gender==3}'>checked</c:if>/> 
						<label for="radio3">남성</label> 
					</div>
				</li>
				<li><button class="green search"></button></li>
			</ul>		
		</form>
		<button class="green mate" onclick="location.href='<%=request.getContextPath()%>/mateWrite'">메이트 등록하기</button><br/>
	</div>
	<c:if test="${myHousePnoCnt>0}">
	   <c:if test="${logGrade==2}">
	   		<c:if test="${myHousePnoCnt>1}">
				<div class="title_wrap" id="hPnoSelect">
		   			<p class="s_title">어느 집의 메이트를 구하시나요?</p><br/>
					<c:forEach var="housePno" items="${myHousePno}" varStatus="index">
						<a class="<c:if test='${hPno==housePno.pno}'>green</c:if>" id="${housePno.pno}">
							<c:if test="${housePno.housename!=null}">${housePno.housename}</c:if>
							<c:if test="${housePno.housename==null}">이름없는 집 ${index.count}</c:if>
						</a>
					</c:forEach>
				</div>
			</c:if>
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
 </div>
<script>
	</div> <!-- content div 종료 -->
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
