<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/yun.css">
<div class="wrap">
	<div class="content">
		<div style="text-align:right; border-bottom: 1px solid red;">
			<a href="#">이전글</a>
			<a href="#">다음글</a>
			<a href="#">전체목록</a>
		</div>
		<ul>
			<li>${vo.category}</li>
			<li><p class="s_title">${vo.subject}</p></li>
			<li>
				<div class="boardView_img" style="float:left;">
					<img src="<%=request.getContextPath()%>/img/comm/sample.png"/>
				</div>
					<div style="float:left; width:200px;">
						${vo.userid}<br>
						${vo.writedate}
					</div>
					<div>	
						조회수 : ${vo.hit}<br>
						댓글 : 0
					</div>
			</li>
			<li style="width:100%; margin-top:50px; border:1px solid gray; height: 500px;">${vo.content}</li>
		</ul>
	</div>
</div>