<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/yun.css">
<script>
	$(function(){
		//카테고리 클릭시 class on 바꾸기
		var category = '${category}';
		console.log(category);
		//카테고리가 null이면 전체에 불들어오기
		if(category==''){
			$(".content_menu a").first().addClass('on');
		}else{
			$(".content_menu li a").removeClass("on");
			if(category=='우리집 자랑'){
				$(".content_menu>li>a").eq(1).addClass('on');
			}else if(category=='중고장터'){
				$(".content_menu>li>a").eq(2).addClass('on');
			}else if(category=='쉐어TIP'){
				$(".content_menu>li>a").eq(3).addClass('on');
			}else if(category=='자유게시판'){
				$(".content_menu>li>a").eq(4).addClass('on');
			}
		}
		
		
		//검색어 유효성 검사
		$(".searchBtn").click(function(){
			if($("#comSearch").val()==''){
				alert("검색어를 입력해주세요.")
				return false;
			}else{
				$("#searchFrm").submit(function(){
					alert($("select[name=searchKey]").val())
					alert($("input[name=searchWord]").val())
					
				});
			}
			
		});
	});
	
	//submit
	function searchSubmit(){
		
	}
</script>
<div class="wrap">
	<div class="content">
		<p class="m_title">커뮤니티</p>
		<ul class="content_menu">
			<li><a href="communityList" class="">전체</a></li>
			<li><a href="communityList?category=우리집 자랑" class="">우리집 자랑</a></li>
			<li><a href="communityList?category=중고장터" class="">중고장터</a></li>
			<li><a href="communityList?category=쉐어TIP" class="">쉐어TIP</a></li>
			<li><a href="communityList?category=자유게시판" class="">자유게시판</a></li>
		</ul>
			<ul class="searchUl">
					<li id="comSearchLi">
						<form id="searchFrm" method="post" action="communityList">
							<input type="hidden" name="category" value="${category}">
							<select id="searchKey" name="searchKey">
								<option value="subject">제목</option>
								<option value="content">글내용</option>
								<option value="userid">사용자</option>
							</select>
							<input name="searchWord" id="comSearch" type="text" placeholder="검색어을 입력해주세요">
							<a class="searchBtn" href="javascript:searchSubmit()">
								<img alt="검색하기" src="<%=request.getContextPath()%>/img/yun/ico_search_black.png">
							</a>
						</form>	
					</li>
					
					<!-- <li id="searchKeySelect">
						<form id="searchFrm" method="post" action="communityList">
							<input type="hidden" name="category" value="${category}">
							<select id="searchKey" name="searchKey">
								<option value="subject">제목</option>
								<option value="content">글내용</option>
								<option value="userid">사용자</option>
						</select>
						</form>	
					</li>	
					<li id="comSearchLi">
						<input name="searchWord" id="comSearch" type="text" placeholder="검색어을 입력해주세요">
						<a class="searchBtn" href="">
							<img alt="검색하기" src="</img/yun/ico_search_black.png">
						</a>
					</li> -->
				<li><a href="communityWrite" class="green" id="communityWrite">글쓰기</a></li>
			</ul>
		<table class="tb">
			<caption>테이블명</caption>
			<colgroup>
				<col width="80" />
				<col width="120" />
				<col />
				<col width="100" />
				<col width="80" />
				<col width="120" />
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>카테고리</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody id="test">
				<c:forEach var="vo" items="${list}">
					<tr>
						<td>${vo.no}</td>
						<td>${vo.category}</td>
						<td class="t_title"><a href="boardView?no=${vo.no}">${vo.subject}</a></td>
						<td>${vo.userid}</td>
						<td>${vo.hit}</td>
						<td>${vo.writedate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="paging">
			<a class="first_page" href=""></a>
			<a class="prev_page" href=""></a>
			<a class="on" href="">1</a>
			<a class="" href="">2</a>
			<a class="" href="">3</a>
			<a class="" href="">4</a>
			<a class="next_page" href=""></a>
			<a class="last_page" href=""></a>
		</div>
	</div>
</div>