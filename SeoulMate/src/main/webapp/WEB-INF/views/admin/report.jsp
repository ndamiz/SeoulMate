<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/yun.css">
<div class="dashMainDiv"> 
	<p>신고 관리</p>
	<p>TOTAL : <span>2</span></p>
	<form action="">
		<select>
			<option>전체</option>
			<option>하우스 신고 목록</option>
			<option>메이트 신고 목록</option>
			<option>커뮤니티 신고 목록</option>
		</select>
		<select>
			<option>전체</option>
			<option>미처리</option>
			<option>처리완료</option>
			<option>허위신고</option>
		</select>
		<input type="text" placeholder="검색어를 입력해주세요.">
		<button>검색</button>
	</form>
	<table style="text-align:center;">
		<colgroup>
			<col width="50" />
			<col width="120" />
			<col width="120" />
			<col width="120" />
			<col width="120" />
			<col width="100" />
			<col width="100" />
			<col width="150" />
			<col width="120" />
		</colgroup>
		<thead>
			<tr style="border-bottom:1px solid black">
				<th>번호111</th>
				<th>회원 ID</th>
				<th>신고자 ID</th>
				<th>신고 분류</th>
				<th>신고 사유</th>
				<th>게시글 공개</th>
				<th>블랙리스트</th>
				<th>신고일</th>
				<th>상태</th>
			</tr>
		</thead>
		<tbody>
<%-- 			<c:forEach var="" items=""> --%>
			<c:forEach var="i" begin="1" end="10">
				<tr>
					<td>${i}</td>
					<td>tiger${i}</td>
					<td>lion${i+10}</td>
					<td>하우스 신고</td>
					<td>폭력적 언어</td>
					<td>N</td>
					<td>Y</td>
					<td>2021-04-25 ${i+5}:40</td>
					<td>처리완료</td>
				</tr>
			</c:forEach>
<%-- 			</c:forEach> --%>
		</tbody>
	</table>
</div>
</body>
</html>