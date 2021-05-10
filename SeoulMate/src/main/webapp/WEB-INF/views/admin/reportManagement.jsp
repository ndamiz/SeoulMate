<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	$(function(){
		//신고 상세보기
		$(".admin_ReportManagement_DetailInfo").on('click', function(){
			var params = 'num='+$(this).children().eq(0).text();
			var url = "/home/admin/reportDetailInfo"
			
			$.ajax({
				url : url,
				data : params,
				success : function(result){
					reportFormFill(result);		
				},error : function(){
					alert("신고 데이터 에러")
				}
			});
		});
		//신고 상세보기 값 넣기
		function reportFormFill(result){
// 			var no = parseInt(result.no);
			
			$("#numR").val(result.num);
			$('#useridR').val(result.userid);
			$('#reportidR').val(result.reportid);
			$('#categoryR').val(result.category);
			$('#noR').val(result.no);
			$('#reportdateR').val(result.reportdate);
			$('#reportcategoryR').val(result.reportcategory);
			$('#reportcontentR').val(result.reportcontent);
			$("input:radio[name ='state']:input[value='"+result.state+"']").attr("checked", true);

			//$("#category").val('${list.category}').prop('selected', true);
			
			//팝업 열기
			$(".report_popup").css('display','block');
			$(document.body).css('overflow','hidden');
		}
		
		//신고처리하기
		$('#reportAdmin').submit(function(){
			//게시글 공개 여부
			var state = $('input[name=visibility]').is(':checked');
			//블랙리스트 등록 여부
			var blacklist = $('input[name=blacklist]').is(':checked');
			//처리 상태
			var reportState = $('input[name=state]:checked').val();
			var num = $('#noR').val();
			alert(num)
			$.ajax({
				url : '/home/admin/reportAdmin',
				data : $(this).serialize(),
				success : function(){
					
				},error : function(){
					
				}
			})
			return false;
		});
		
		//검색어 자동완성============================================================================================================
		jQuery.curCSS = function(element, prop, val) {//jquery a.Cur샬라샬라에러떠서
		    return jQuery(element).css(prop, val);
		};
		$('input[name=searchWord]').autocomplete({
			source : function(req, res){
				$.ajax({
					type: 'get',
					url : '/home/admin/json',
					dataType: 'json',
					data : "keyword="+$("input[name=searchWord]").val(),
					success: function(data){
						res(
							$.map(data, function(item){
								return {
									label : item, //뷰단에서 보여지는 글자
									value : item, //사용자 설정값.
									test : item+'test'
								}//return end
							})//map end	
						)//res end
					}
				});// ajax end
			},//source end source는 자동 완성 대상
			select : function(event, ui){
				console.log(ui)
				console.log(ui.item.label);
				console.log(ui.item.value);
				console.log(ui.item.test);
			},
			focus : function(event, ui){
				return false;
			},
			minLength : 1,//최소 글자수
			autoFocus: true,
			classes : {
				'ui-autocomplete' : 'highlight'	
			},
			delay : 500,
			position : {my : 'right top', at : 'right bottom'},
			close : function(event){
				console.log(event);
			}
		}).autocomplete("instance")._renderItem = function(ul, item){//input에 자동완성 걸어주기
			return $('</li>')
			.append("<div>" + item.value + "<br>" + item.label + "</div>")
			.appendTo(ul);
		}//============================================================================================================
	});
</script>
<section class="admin_Section">
	<div class="admin_Content">
		<div class="m_title managementTitle">신고 관리</div>
		<form method="post" action="/home/admin/reportManagement" class="managementSearchForm">
			<div class="reportSearchKey">
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
			</div>	
			<div class="reportSearch">
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
						<th>게시글 공개</th><!-- 게시글 공개여부랑 블랙리스트 상태는 ajax로 페이지 실행될때 가져와야할거같은데 왜냐면 신고목록 select 할때 글번호, 어디 게시판인지도 모르잖아 -->
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
					<form id="reportAdmin" method="post">	
						<input id="numR" type="hidden" name="num">
						<ul>
							<li><div>회원ID</div><input id="useridR" type="text" name="userid" readonly></li>
							<li><div>신고자ID</div> <input id="reportidR" type="text" name="reportid" readonly> </li>
							<li><div>분류</div> <input id="categoryR" type="text" name="category" readonly> </li>
							<li><div>글번호</div> <input id="noR" type="text" name="no" readonly> </li>
							<li><div>신고일</div> <input id="reportdateR" type="text" name="reportdate" readonly> </li>
							<li><div>신고 사유</div> <input id="reportcategoryR" type="text" name="reportcategory" readonly> </li>
							<li><div>상세내용</div> <textarea id="reportcontentR" rows="5" name="reportcontent" readonly></textarea> </li>
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
								<div id="radioDiv" class="reportState">
									<input type="radio" name="state" value="미처리">미처리
									<input type="radio" name="state" value="처리완료">처리완료
									<input type="radio" name="state" value="허위신고">허위신고
								</div>
							</li>
						</ul>
					</form>	
				</div>
			</div>
			<div class="pup_bottom">
				<a class="btn_cancel">닫기</a>
				<a href="javascript:$('#reportAdmin').submit()" class="btn_save">처리</a>
<!-- 				<a href="" class="btn_del">삭제</a> -->
			</div>
			<a href="" class="pup_btn_close">닫기</a>
		</div>
	</div>
</body>
</html>