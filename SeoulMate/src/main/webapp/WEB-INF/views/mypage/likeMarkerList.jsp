<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/hyun.css">
	<div class="wrap">
		<section class="likeMarkerContent">
			<p class="m_title">찜 목록</p>
			<p class="s_title">쉐어 하우스</p>
			<div class="likeMarkerList">
				<div class="likeMarkerHouse" >
					<div class="likeMarkerImg">
						<div>매칭 <br /><span>89</span> %</div>
						<a href=""><img alt="" src="<%=request.getContextPath()%>/img/comm/sample_house03.png"/></a>
					</div>
					<ul>
						<li>서울시 마포구 아현동</li>
						<li>보증금 : 200만원 | 월세 : 30만원</li>
						<li>
							<ul class="inviteReauestHouse">
								<li><p>1</p></li>
								<li><p>2</p></li>
								<li><p>3</p></li>
							</ul>
						</li>
					</ul>
					<div class="likeMarkerBtn">
						<a href="" class="b_btn white">찜 삭제</a>
						<a href="" class="b_btn white">약속잡기</a>
					</div>
				</div>
				<div class="likeMarkerHouse" >
					<div class="likeMarkerImg">
						<div>매칭 <br /><span>92</span> %</div>
						<a href=""><img alt="" src="<%=request.getContextPath()%>/img/comm/sample_house02.png"/></a>
					</div>
					<ul>
						<li>서울시 마포구 아현동</li>
						<li>보증금 : 100만원 | 월세 : 35만원</li>
						<li>
							<ul class="inviteReauestHouse">
								<li><p>1</p></li>
								<li><p>2</p></li>
								<li><p>3</p></li>
							</ul>
						</li>
					</ul>
					<div class="likeMarkerBtn">
						<a href="" class="b_btn white">찜 삭제</a>
						<a href="" class="b_btn white">약속잡기</a>
					</div>
				</div>
			</div>
		</section>
		<section class="likeMarkerContent">
			<p class="s_title">하우스 메이트</p>
			<div class="likeMarkerList">
				<div class="likeMarkerMate">
					<div class="likeMarkerImg">
						<div>매칭 <br /><span>90</span> %</div>
						<a href=""><img alt="" src="<%=request.getContextPath()%>/img/comm/sample_mate01.png"/></a>
					</div>
					<ul>
						<li>유저아이디</li>
						<li>보증금 : 200만원 | 월세 : 30만원</li>
						<li>아현동 | 공덕동 | 대흥동</li>
						<li>
							<ul class="inviteReauestMate">
								<li><p>여</p></li>
								<li><p>27세</p></li>
								<li><p>즉시</p></li>
							</ul>
						</li>
					</ul>
					<div class="likeMarkerBtn">
						<a href="" class="b_btn white">찜 삭제</a>
						<a href="" class="b_btn white">초대하기</a>
					</div>
				</div>
				<div class="likeMarkerMate">
					<div class="likeMarkerImg">
						<div>매칭 <br /><span>91</span> %</div>
						<a href=""><img alt="" src="<%=request.getContextPath()%>/img/comm/sample_mate02.png"/></a>
					</div>
					<ul>
						<li>유저아이디</li>
						<li>보증금 : 300만원 | 월세 : 25만원</li>
						<li>대흥동 | 공덕동 | 북아현동</li>
						<li>
							<ul class="inviteReauestMate">
								<li><p>여</p></li>
								<li><p>21세</p></li>
								<li><p>5/1</p></li>
							</ul>
						</li>
					</ul>
					<div class="likeMarkerBtn">
						<a href="" class="b_btn white">찜 삭제</a>
						<a href="" class="b_btn white">초대하기</a>
					</div>
				</div>
			</div>
		</section>
	</div>