$(function(){
	$('#salesManagementDatePicker').datepicker({
		showOn : 'both',
		showButtonPanel : true,
		currentText: "today",
		changeYear : true,
		changeMonth : true,
		nextText : '다음달',
		prevText : '이전달',
		dateFormat : 'yy-mm-dd',
		dayNamesMin : ["일","월","화","수","목","금","토"],
		closeText : '닫기',
		minDate : '-10Y',
		maxDate : '+0D'
	});
});