<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#premiumInfoImg {border: 2px solid #4DA69E; border-radius: 30px;}
	#premiumInfoImg ul {overflow: auto;}
	#premiumInfoImg img {width: 33%; border-radius: 30px;}
	#premiumPayBtn {float: right;}
	#premiunPoint {color:#4DA69E; font-weight: 900;}
</style>
<div class="wrap">
	<p class="m_title">프리미엄 멤버십 및 요금 안내</p>
	<hr />
	<div>
		<p class="s_title">프리미엄 멤버십 안내</p>
		<p class="d_title">
			서울메이트는 프리미엄 멤버십을 제공합니다. <br />
			결제 여부에 따라 쉐어하우스 초대 및 조회, 하우스메이트 초대 및 조회를 무제한으로 사용이 가능하며,<br />
			조건 및 성향에 따른 매칭순위를 제공합니다. <br />
			<br />
			- 쉐어하우스로 가입 시, 해당 쉐어하우스와 가장 잘 맞는 하우스메이트를 매칭하여 상위에 순위로 표시합니다.<br />
			  또한, 하우스메이트의 상세 정보 확인 시, 어떠한 성향이나 규칙 등이 하우스와 잘 맞는지 상세한 확인이 가능합니다. <br />
			  <br />
			- 하우스메이트로 가입 시, 본인과 가장 잘 맞는 쉐어하우스를 매칭하여 상위에 순위로 표시합니다.<br />
			  또한, 쉐어하우스의 상세 정보 확인 시, 어떠한 성향이나 규칙 등이 본인과 잘 맞는지 상세한 확인이 가능합니다.<br />
			 <br />
			* 매칭은 하우스의 생활, 소통, 하우스 내 지원서비스, 원하는 메이트의 생활, 성격, 나이대 등의 정보들을 비교하여 매칭합니다.<br />
			<br />
			매칭시스템을 활용하여 즐거운 쉐어생활을 할 수 있도록 더욱 잘 맞는 쉐어하우스/하우스메이트를 구하시길 바랍니다. <br />
			<br />
		</p>
	</div>
	<div id="premiumInfoImg">
		<ul>
			<li>	
				<img src="<%=request.getContextPath()%>/img/premiumAfter.jpg" alt="" />
				<img src="<%=request.getContextPath()%>/img/img01.jpg" alt="" />
				<img src="<%=request.getContextPath()%>/img/premiumAfter.jpg" alt="" />
			</li>
		</ul>
	</div>
	<div class="content">
		<table class="tb">
			<thead>
				<tr>
					<th></th>
					<th>무료</th>
					<th>프리미엄</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>프리미엄 요금</th>
					<th></th>
					<th>15,000원 / 월</th>
				</tr>
				<tr>
					<th>쉐어하우스 신청</th>
					<th>일 3회</th>
					<th>무제한</th>
				</tr>
				<tr>
					<th>하우스메이트 초대/조회</th>
					<th>일 3회</th>
					<th>무제한</th>
				</tr>
				<tr>
					<th id="premiunPoint">성향 매칭</th>
					<th>지원 안함</th>
					<th>지원</th>
				</tr>
				<tr>
					<th>등록 작성 가능 개수</th>
					<th>총 1건</th>
					<th>총 3건</th>
				</tr>
				<tr>
					<th>검색 및 목록 순위</th>
					<th>없음</th>
					<th>상위 노출</th>
				</tr>
			</tbody>
		</table>
	</div>
	<div>
	<button class="b_btn green" id="premiumPayBtn" onclick="location.href='premiumPay'">프리미엄 멤버십 가입하기</button>
	</div>
</div>