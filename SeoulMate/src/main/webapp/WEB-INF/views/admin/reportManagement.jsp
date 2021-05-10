<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	$(function(){
		$(".admin_ReportManagement_DetailInfo").on('click', function(){
			var no = $(this).children().eq(0).text();
			var userid = $(this).children().eq(1).text();
			alert(no);
			$.ajax({
				
			});

			reportFormFill();
		});
		function reportFormFill(){
			$(".report_popup").css('display','block');
			$(document.body).css('overflow','hidden');
		}
	});
</script>
<section class="admin_Section">
	<div class="admin_Content">
		<div class="m_title managementTitle">신고 관리</div>
		<form method="post" action="/home/admin/reportManagement" class="managementSearchForm">
			<div class="reportSearch">
				<select name="category" class="custom-select input">
					<option value="all">전체</option>
					<option value="sharehouse">하우스 신고 목록</option>
					<option value="mate">메이트 신고 목록</option>
					<option value="community">커뮤니티 신고 목록</option>
					<option value="reply">댓글 신고 목록</option>
				</select>
				<select name="state" class="custom-select">
					<option value="allState">전체</option>
					<option value="undone">미처리</option>
					<option value="done">처리완료</option>
					<option value="falseReport">허위신고</option>
				</select>
				<input type="text" name="searchWord" class="form-control"/>
				<input type="submit" value="Search" class="btn btn-custom"/>
			</div>
		</form>
		<div class="table-responsive, managementList">
			<table class="table table-hover table-sm table-bordered">
				<thead class="thead-light">
					<tr>
						<th>No.</th>
						<th>회원 ID</th>
						<th>신고자 ID</th>
						<th>신고분류</th>
						<th>신고글번호</th>
						<th>게시글 공개</th>
						<th>블랙리스트</th>
						<th>신고일</th>
						<th>상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="report" items="${report}">
						<tr class="admin_ReportManagement_DetailInfo">
							<td>${report.num}</td>
							<td>${report.userid}</td>
							<td>${report.reportid}</td>
							<td>${report.category}</td>
							<td>${report.no}</td>
							<td>공개</td>
							<td>미등록</td>
							<td>${report.reportdate}</td>
							<td>${report.state}</td>
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
</section>
<!--  팝업창///////////////////////////////////////////// -->
<div class="pup_wrap report_popup">
		<div class="pup_form">
			<div class="pup_head">신고 처리</div>
			<div class="pup_body">
				<div class="pup_list">
					<ul>
						<li><div>회원ID</div><input type="text" name="userid"></li>
						<li><div>신고자ID</div> <input type="text" name="reportid"> </li>
						<li><div>분류</div> <input type="text" name="category"> </li>
						<li><div>신고일</div> <input type="text" name="reportdate"> </li>
						<li><div>신고 사유</div> <input type="text" name="reportcategory"> </li>
						<li><div>상세내용</div> <textarea rows="5" name="reportcontent"></textarea> </li>
						<li><div>게시글 공개</div>
							<div class="toggle_cont">
							<input id="toggle_1" class="cmn_toggle cmn_toggle_round" type="checkbox" name="visibility">
							<label for="toggle_1"></label>
							</div><br>
						</li>
						<li><div>블랙리스트</div>
							<div class="toggle_cont">
							<input id="toggle_2" class="cmn_toggle cmn_toggle_round" type="checkbox" name="blacklist">
							<label for="toggle_2"></label>
							</div><br>
						</li>
						<li><div>처리 상태</div>
							<div id="radioDiv">
								<input type="radio" name="state">처리완료
								<input type="radio" name="state">미처리
								<input type="radio" name="state">허위신고
							</div>
						</li>
					</ul>
				</div>
			</div>
			<div class="pup_bottom">
				<a href="" class="btn_cancel">닫기</a>
				<a href="" class="btn_save">확인</a>
				<a href="" class="btn_del">삭제</a>
			</div>
			<a href="" class="pup_btn_close">닫기</a>
		</div>
	</div>
</body>
</html>