<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#houseManagementSearchForm { width: 90%; margin: 20px auto; overflow: hidden;}
	.houseManagementSpan{width: 100px; display:inline-block; text-align: right;font-weight: bold; font-size:1.1em; margin-right: 15px;}
	#houseWriteStateRadio, #houseMemberStateRadio{float: right; width: 560px; height: 30px;}
	#houseManagementRadio{ width: 570px; float: right; }
	#hmSearch {width: 380px; float: left; overflow: auto; margin-top: 20px; }
	#hmSearch>select, #hmSearch input{float: left;}
	#hmSearchKey{width: 100px; float: left;}
	#hmSearchWord{width: 200px; float: left;}
	
	#houseManagementList{width: 90%; margin: 10px auto;}
	
</style>
		<section>
			<form method="post" action="/home/admin/houseManagement" id="houseManagementSearchForm">
				<div id="houseManagementRadio">
					<div id="houseWriteStateRadio">
						<span class="houseManagementSpan">상태</span>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" name="houseWriteState" id="houseWriteState" class="custom-control-input" checked/>
							<label class="custom-control-label" for="houseWriteState" >전체</label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" name="houseWriteState" id="houseWriteState2" class="custom-control-input"/>
							<label class="custom-control-label" for="houseWriteState2">모집중</label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" name="houseWriteState" id="houseWriteState3" class="custom-control-input"/>
							<label class="custom-control-label" for="houseWriteState3">매칭완료</label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" name="houseWriteState" id="houseWriteState4" class="custom-control-input"/>
							<label class="custom-control-label" for="houseWriteState4">기간만료</label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" name="houseWriteState" id="houseWriteState5" class="custom-control-input"/>
							<label class="custom-control-label" for="houseWriteState5">비공개</label>
						</div>
					</div>
					<div id="houseMemberStateRadio">
						<span class="houseManagementSpan">일반/프리미엄</span>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" name="state" id="houseMemberState" class="custom-control-input" checked/>
							<label class="custom-control-label" for="houseMemberState">전체</label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" name="state" id="houseMemberState2" class="custom-control-input"/>
							<label class="custom-control-label" for="houseMemberState2">일반</label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" name="state" id="houseMemberState3" class="custom-control-input"/>
							<label class="custom-control-label" for="houseMemberState3">프리미엄</label>
						</div>
					</div>
				</div>
				<div id="hmSearch">
					<select name="hmSearchKey" id="hmSearchKey" class="custom-select">
						<option value="userid" selected>아이디</option>
						<option value="addr">주소</option>
					</select>
					<input type="text" name="hmSearchWord" id="hmSearchWord" class="form-control"/>
					<input type="submit" value="Search" class="btn btn-secondary"/>
				</div>
			</form>
			<div id="houseManagementList" class="table-responsive">
				<table class="table table-hover table-sm table-bordered">
					<thead class="thead-light">
						<tr>
							<th>No.</th>
							<th>아이디</th>
							<th>주소</th>
							<th>등급</th>
							<th>신고 누적 수</th>
							<th>상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="i" begin="1" end="10" step="1">
						<tr>
							<td>${i }</td>
							<td>${i }${i }${i }${i }${i }${i }${i }${i }${i }${i }</td>
							<td>${i }${i }${i }${i }${i }${i }${i }${i }${i }${i }${i }${i }${i }${i }${i }${i }${i }</td>
							<td>${i }${i }${i }${i }</td>
							<td>${i }</td>
							<td>${i }${i }${i }${i }</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
			
		</section>
	</body>
</html>