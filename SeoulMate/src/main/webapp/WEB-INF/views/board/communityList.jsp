<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/yun.css">
<script>
	$(function(){
		$("#communityWrite").click(function(){
			location.href = "/home/communityWrite";
		});
	});
</script>
<div class="wrap">
		<div class="content">
			<p class="m_title">커뮤니티</p>
			<ul class="content_menu">
				<li><a class="on">전체</a></li>
				<li><a class="">우리집 자랑</a></li>
				<li><a class="">중고장터</a></li>
				<li><a class="">쉐어TIP</a></li>
				<li><a class="">자유게시판</a></li>
			</ul>
			<ul>
				<li id="comSearchLi"><input id="comSearch" type="text" placeholder="검색어을 입력해주세요"><a href=""><img alt="검색하기" src="<%=request.getContextPath()%>/img/yun/ico_search_black.png"></a></li>
				<li><button class="green" id="communityWrite">글쓰기</button></li>
			</ul>
			<br>
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
				<tbody>
					<c:forEach var="vo" items="${list}">
						<tr>
							<td>${vo.no}+123</td>
							<td>${vo.category}</td>
							<td class="t_title"><a href="">${vo.subject}</a></td>
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