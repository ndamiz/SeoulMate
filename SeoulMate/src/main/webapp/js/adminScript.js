
var dateChoose ='';
$(function(){
	 $('#selectYearMonthDate').change(function(){
		 $("#selectYearMonthDate option:selected").each(function() {
			datePicker();
	     });
	 });
});
function datePicker(){
	$('.datePicker1, .datePicker2').datepicker('destroy');
	$('.datePicker1, .datePicker2').val("");
	var dateChoose = $("#selectYearMonthDate option:selected").val();
	$.datepicker.setDefaults({
		showOn : 'both',
		buttonImage : '../img/fi-rr-calendar.svg',
		buttonImageOnly : true,
		monthNames : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		monthNamesShort : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		dayNames : ["일","월","화","수","목","금","토"], 
		dayNamesMin : ["일","월","화","수","목","금","토"],
		dayNamesShort :  ["일","월","화","수","목","금","토"],
		changeYear : true,
		changeMonth : true,
		maxDate : '+0D',
		nextText : '다음달',
		prevTet : '이전달',
		showButtonPanel : true,
		currentText : '오늘날짜',
		closeText :'확인',
		showMonthAfterYear : true
	});
	if(dateChoose == '일별'){
		console.log("일별선택.. ");
		$('.datePicker1, .datePicker2').datepicker({
			dateFormat : 'yy-mm-dd',
			displayFormat :'yyyy-mm-dd',
			minDate : '-1M'
		}).focus(function () {
            $(".ui-datepicker-month").show();
            $(".ui-datepicker-calendar").show();
            $("div.ui-datepicker-header a.ui-datepicker-prev,div.ui-datepicker-header a.ui-datepicker-next").show();
        });
        
	}
	if(dateChoose == '월별'){
		console.log("월별선택.. ");
		$('.datePicker1, .datePicker2').datepicker({
			dateFormat : 'yy-mm',
			displayFormat :'yyyy-mm',
			minDate : '-1Y',
			onClose :function(dataText, inst){
				var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
				var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
				$(this).datepicker('setDate', new Date(year, month, 1));
			},
			beforeShow : function(input, inst) {
				if ((datestr = $(this).val()).length > 0) {
					actDate = datestr.split('-');
					year = actDate[0];
					month = actDate[1]-1;
					$(this).datepicker('option', 'defaultDate', new Date(year, month));
					$(this).datepicker('setDate', new Date(year, month));
				}
			}
		}).focus(function () {
            $(".ui-datepicker-month").show();
            $(".ui-datepicker-calendar").hide();
            $("div.ui-datepicker-header a.ui-datepicker-prev,div.ui-datepicker-header a.ui-datepicker-next").hide();
        });
 	}
 	if(dateChoose == '년별'){
 		console.log("년별선택.. ");
 		$('.datePicker1, .datePicker2').datepicker({
 			dateFormat : 'yy',
 			displayFormat :'yyyy',
		    minDate : '-10Y',
		    onClose :function(dataText, inst){
				var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
				$(this).datepicker('setDate', new Date(year, 1, 1));
			},
			beforeShow : function(input, inst) {
				if ((datestr = $(this).val()).length > 0) {
					actDate = datestr.split('-');
					year = actDate[0];
					$(this).datepicker('option', 'defaultDate', new Date(year));
					$(this).datepicker('setDate', new Date(year));
				}
			}
		}).focus(function () {
            $(".ui-datepicker-month").hide();
            $(".ui-datepicker-calendar").hide();
            $("div.ui-datepicker-header a.ui-datepicker-prev,div.ui-datepicker-header a.ui-datepicker-next").hide();
        });
	}
	$('img.ui-datepicker-trigger').css({'cursor':'pointer', 'margin':'0px 10px 3px 5px', 'width' :'25px', 'height':'25px'});
}

//자료 프린트하기 
function printPage(msg){;
	var printWidth = 800;
	var printHeghit = 800;
	var state ='';
	var grade = 0;
	var searchKey = '';
	var searchWord = '';
	if(msg == 'mateWrite'){
		state =  $("#matestate option:selected").val();
		grade = $("#grade option:selected").val();
		searchKey = $("#searchKey option:selected").val();
		searchWord = $("input[name=searchWord]").val();
		window.open("/home/admin/adminPrintPage?msg="+msg+"&matestate="+state+"&grade="+grade+"&searchKey="+searchKey+"&searchWord="+searchWord, "프린트 페이지", "width=800, height=800");
	}
	if(msg == 'houseWrite'){
		state =  $("#housestate option:selected").val();
		grade = $("#grade option:selected").val();
		searchKey = $("#searchKey option:selected").val();
		searchWord = $("input[name=searchWord]").val();
		window.open("/home/admin/adminPrintPage?msg="+msg+"&housestate="+state+"&grade="+grade+"&searchKey="+searchKey+"&searchWord="+searchWord, "프린트 페이지", "width=800, height=800");
	}
	var selectYearMonthDate = '';
	var selectStartDate = '';
	var selectEndDate = '';
	if(msg == 'pay' || msg=='sales'){
		selectYearMonthDate = $("#selectYearMonthDate option:selected").val();
		selectStartDate = $("input[name=selectStartDate]").val();
		selectEndDate = $("input[name=selectEndDate]").val();
		if(msg == 'pay'){
			searchKey = $("#searchKey option:selected").val();
			searchWord = $("input[name=searchWord]").val();
			window.open("/home/admin/adminPrintPage?msg="+msg+"&selectYearMonthDate="+selectYearMonthDate+"&selectStartDate="+selectStartDate+"&selectEndDate="+selectEndDate+"&searchKey="+searchKey+"&searchWord="+searchWord, "프린트 페이지", "width=800, height=800");
		}else if(msg=='sales'){
			window.open("/home/admin/adminPrintPage?msg="+msg+"&selectYearMonthDate="+selectYearMonthDate+"&selectStartDate="+selectStartDate+"&selectEndDate="+selectEndDate, "프린트 페이지", "width=800, height=800");
		}
	}
	if(msg == 'pop'){
		var p_body = document.body.innerHTML;
		window.onbeforeprint = function(){
			document.body.innerHTML = document.getElementById('admin_Management_popup_print').innerHTML;	
		}
		window.onafterprint = function(){
			document.body.innerHTML = p_body;
		}
		window.print();
	}
}