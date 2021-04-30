<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/yun.css">
<div class="wrap">
	<div class="content">
		<a href="#" style="float:left;">신고</a>
		<div style="text-align:right; border-bottom: 1px solid red;">
			<a href="#">이전글</a>
			<a href="#">다음글</a>
			<a href="#">전체목록</a>
		</div>
		<ul>
			<li>${vo.category}</li>
			<li><p class="s_title">${vo.subject}</p></li>
			<li>
				<div class="communityView_img" style="float:left;">
					<img src="<%=request.getContextPath()%>/img/comm/sample.png"/>
				</div>
				<div class="communityView_user">
					${vo.userid}<br>
					${vo.writedate}
				</div>
				<div class="communityView_user">	
					조회수 : ${vo.hit}<br>
					댓글 : 0
				</div>
			</li>
			<li class="communityView_content">
				${vo.content}
			</li>
		</ul>
		<!-- 댓글 -->
		<ul>
			<li><p class="d_title">댓글</p></li>
			<li>
				<div class="communityComent_img" style="float:left;">
					<img src="<%=request.getContextPath()%>/img/comm/sample.png"/>
				</div>
				<div style="width:200px;">
					${vo.userid}
					${vo.writedate}
				</div>
			</li>	
			<li>
				댓글 내용~			
			</li>		
		</ul>
	</div>
</div>