<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<section>
			<div class="m_title managementTitle">매출 관리</div>
			<div class="checks">
				<span class="managementSpan">필터</span>
				<input type="radio" name="housestate" id="houseWriteState2"/>
				<label  for="houseWriteState2">년별</label>
				<input type="radio" name="housestate" id="houseWriteState3"/>
				<label for="houseWriteState3">월별</label>
				<input type="radio" name="housestate" id="houseWriteState4"/>
				<label for="houseWriteState4">일별</label>
			</div>
			<div>
				<input type="text" name="payStart" id="salesManagementDatePicker" readonly="readonly" />
			</div>
		</section>
	</body>
</html>