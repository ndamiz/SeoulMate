<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/home/css/choi.css"/>
<div class="wrap">
	<div class="member_wrap">
		<p class="m_title" id="proTitle">성향 수정</p>
		<div class="title_wrap p_center">
			<c:if test="${pcaseM==1}">
				<p class="s_title s_margin">메이트 성향 수정</p><br/>
				<a class="green s_margin" href="proEditMateForm">메이트 성향 수정</a>
			</c:if>
			<c:if test="${pcaseH!=null}">
				<p class="s_title s_margin">하우스 성향 수정</p><br/>
				<ul class="s_margin" id="proUl">
					<!-- c:forEach start -->
					<c:forEach var="vo" items="${list}">
						<li><a href="proEditHouseForm?pno=${vo.pno}">${vo.housename}</a></li>
					</c:forEach>
					<!-- c:forEach end -->
				</ul>
			</c:if>
			<c:if test="${pcaseM==0}">
				<p class="s_title s_margin">메이트 성향 추가</p><br/>
				<a class="green s_margin" href="#">메이트 성향 추가</a><br/>
			</c:if>
		</div>
	</div>
</div>
</body>
</html>