<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="wrap">
	<div class="content">
		<p class="m_title">결제 내역 확인</p>
		<input type="month" />
		<table class="tb" id="payDetailTable">
			<caption>결제내역</caption>
			<colgroup>
				<col width="40"/>
				<col width="200"/>
				<col width="200"/>
				<col width="200"/>
				<col width="200"/>
				<col width="100"/>
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>설명</th>
					<th>결제일</th>
					<th>서비스기간</th>
					<th>결제수단</th>
					<th>금액</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="i" begin="1" end="9" step="1">
				<tr>
					<td>${i }</td>
					<td>프리미엄 멤버쉽 결제</td>
					<td>2021-0${i }-01</td>
					<td>2021-0${i }-31</td>
					<td>신용카드(${i }${i }카드)</td>
					<td>₩ 12,000 </td>
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