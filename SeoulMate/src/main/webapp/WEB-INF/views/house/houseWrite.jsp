<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="//cdn.ckeditor.com/4.16.0/basic/ckeditor.js"></script>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/housemate.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<c:set var="today" value="<%=new java.util.Date()%>"/>
<c:set var="now"><fmt:formatDate value="${today}" pattern="yyyy-MM-dd"/></c:set>

<script>

$(function(){
	CKEDITOR.replace("houseprofile", {
		height:300,
		width:'100%'
		
	}); //설명글 name 설정 필요
	
	$("#write").on('submit', function(){
		if(CKEDITOR.instances.content.getData()==""){
			alert("내용을 입력해주세요");
			return false;
		}return true;
	});
	
});



// 	$(function() {
// 	    $("#input-image").on('change', function(){
// 	        readURL(this);
// 	    });
// 	});
	
	function readURL(input) {
	    if (input.files && input.files[0]) {
	    var reader = new FileReader();
	
	    reader.onload = function (e) {
	            $('#houseImg1').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}

// 		for (var image of event.target.files) { 
// 			var reader = new FileReader(); 
// 			reader.onload = function(event) { 
// 				var img = document.createElement("img"); 
// 				img.setAttribute("src", event.target.result); 
// 				document.querySelector("#multiple-container").appendChild(img); 
// 			}; 
// 				console.log(image); 
// 				reader.readAsDataURL(image); 
// 		}

// 		var reader = new FileReader(); 
// 		reader.onload = function(event) { 
// 			var img = document.createElement("img"); 
// 			img.setAttribute("src", event.target.result); 
// 			document.querySelector("#hPic").append(img); 
// 			}; 
// 			reader.readAsDataURL(event.target.files[0]);
// 			reader.readAsDataURL(event.target.files[1]);
// 			reader.readAsDataURL(event.target.files[2]);
// 			reader.readAsDataURL(event.target.files[3]);
// 			reader.readAsDataURL(event.target.files[4]);
// 	}

	}
	

// $(document).ready(function() {
//     $('#houseProfile').summernote();
//   });


$(function(){
	
//     $('select').change(function(){
//         var option = $(this).val(); //옵션의 value

//         if(option=='value값){
//            $('td:contains("텍스트이름")').parents('tr').css('display','');
//            $('td:contains("텍스트이름")').parents('tr').css('display','none');
//         }         
//      });

// 	if(!$('#selectBoxID > option:selected').val()) { //#->셀렉트 의 id 입력
// 	    alert("선택해주세요");
// 	}


	$("#roomPlus").click(function(){ //방 추가하기
		if($(".room2").css("display") == "none"){
			$('.room2 ul input').eq(0).attr('name','roomVOList[1].roomName');	//1
			$('.room2 ul input').eq(1).attr('name','roomVOList[1].rent');		//2
			$('.room2 ul input').eq(2).attr('name','roomVOList[1].deposit');	//3
			$('.room2 ul input').eq(3).attr('name','roomVOList[1].roomPeople');	//4
			$('.room2 ul input').eq(4).attr('name','roomVOList[1].enterdate');	//5
			$('.room2 ul select').eq(0).attr('name','roomVOList[1].minStay');	//6
			$('.room2 ul select').eq(1).attr('name','roomVOList[1].maxStay');	//7
			$('.room2 ul input').eq(5).attr('name','roomVOList[1].furniture');	//8
			$('.room2 ul input').eq(6).attr('name','roomVOList[1].furniture');	//9
			$('.room2 ul input').eq(7).attr('name','roomVOList[1].incFurniture');	//10
			$('#roomMinus').css("display",'inline-block');
			$('.room2').show();
		}else if($(".room3").css("display") == "none"){
			$('.room3 ul input').eq(0).attr('name','roomVOList[2].roomName');	//1
			$('.room3 ul input').eq(1).attr('name','roomVOList[2].rent');		//2
			$('.room3 ul input').eq(2).attr('name','roomVOList[2].deposit');	//3
			$('.room3 ul input').eq(3).attr('name','roomVOList[2].roomPeople');	//4
			$('.room3 ul input').eq(4).attr('name','roomVOList[2].enterdate');	//5
			$('.room3 ul select').eq(0).attr('name','roomVOList[2].minStay');	//6
			$('.room3 ul select').eq(1).attr('name','roomVOList[2].maxStay');	//7
			$('.room3 ul input').eq(5).attr('name','roomVOList[2].furniture');	//8
			$('.room3 ul input').eq(6).attr('name','roomVOList[2].furniture');	//9
			$('.room3 ul input').eq(7).attr('name','roomVOList[2].incFurniture');	//10
			$('.room3').show();
		}else if($(".room4").css("display") == "none"){
			$('.room4 ul input').eq(0).attr('name','roomVOList[3].roomName');	//1
			$('.room4 ul input').eq(1).attr('name','roomVOList[3].rent');		//2
			$('.room4 ul input').eq(2).attr('name','roomVOList[3].deposit');	//3
			$('.room4 ul input').eq(3).attr('name','roomVOList[3].roomPeople');	//4
			$('.room4 ul input').eq(4).attr('name','roomVOList[3].enterdate');	//5
			$('.room4 ul select').eq(0).attr('name','roomVOList[3].minStay');	//6
			$('.room4 ul select').eq(1).attr('name','roomVOList[3].maxStay');	//7
			$('.room4 ul input').eq(5).attr('name','roomVOList[3].furniture');	//8
			$('.room4 ul input').eq(6).attr('name','roomVOList[3].furniture');	//9
			$('.room4 ul input').eq(7).attr('name','roomVOList[3].incFurniture');	//10
			$('.room4').show();
		}
	});
	$("#roomMinus").click(function(){
		if($(".room4").css("display") == "block"){//닫기
			if(confirm('방을 제거하면 3번방 정보가 삭제됩니다.')){
				$('.room4 ul input').eq(0).attr('name','');	//1
				$('.room4 ul input').eq(0).val('');	
				$('.room4 ul input').eq(1).attr('name','');		//2
				$('.room4 ul input').eq(1).val('');	
				$('.room4 ul input').eq(2).attr('name','');	//3
				$('.room4 ul input').eq(2).val('');	
				$('.room4 ul input').eq(3).attr('name','');	//4
				$('.room4 ul input').eq(3).val('');	
				$('.room4 ul input').eq(4).attr('name','');	//5
				$('.room4 ul input').eq(4).val('');
				
				$('.room4 ul select').eq(0).attr('name','');	//6
				$('.room4 ul select').eq(1).attr('name','');	//7
				
				$('.room4 ul input').eq(5).attr('name','');	//8
				$('.room4 ul input').eq(5).val('');	
				$('.room4 ul input').eq(6).attr('name','');	//9
				$('.room4 ul input').eq(6).val('');	
				$('.room4 ul input').eq(7).attr('name','');	//10
				$('.room4 ul input').eq(7).val('');	
				$('.room4').hide();
			}
		}else if($(".room3").css("display") == "block"){
			if(confirm('방을 제거하면 3번방 정보가 삭제됩니다.')){
				$('.room3 ul input').eq(0).attr('name','');	//1
				$('.room3 ul input').eq(0).val('');	
				$('.room3 ul input').eq(1).attr('name','');		//2
				$('.room3 ul input').eq(1).val('');	
				$('.room3 ul input').eq(2).attr('name','');	//3
				$('.room3 ul input').eq(2).val('');	
				$('.room3 ul input').eq(3).attr('name','');	//4
				$('.room3 ul input').eq(3).val('');	
				$('.room3 ul input').eq(4).attr('name','');	//5
				$('.room3 ul input').eq(4).val('');	
				
				$('.room3 ul select').eq(0).attr('name','');	//6
				$('.room3 ul select').eq(1).attr('name','');	//7
				
				$('.room3 ul input').eq(5).attr('name','');	//8
				$('.room3 ul input').eq(5).val('');	
				$('.room3 ul input').eq(6).attr('name','');	//9
				$('.room3 ul input').eq(6).val('');	
				$('.room3 ul input').eq(7).attr('name','');	//10
				$('.room3 ul input').eq(7).val('');	
				$('.room3').hide();
			}
		}else if($(".room2").css("display") == "block"){
			if(confirm('방을 제거하면 2번방 정보가 삭제됩니다.')){
				$('.room2 ul input').eq(0).attr('name','');	//1
				$('.room2 ul input').eq(0).val('');	
				$('.room2 ul input').eq(1).attr('name','');		//2
				$('.room2 ul input').eq(1).val('');	
				$('.room2 ul input').eq(2).attr('name','');	//3
				$('.room2 ul input').eq(2).val('');	
				$('.room2 ul input').eq(3).attr('name','');	//4
				$('.room2 ul input').eq(3).val('');	
				$('.room2 ul input').eq(4).attr('name','');	//5
				$('.room2 ul input').eq(4).val('');	
	
				$('.room2 ul select').eq(0).attr('name','');	//6
				$('.room2 ul select').eq(1).attr('name','');	//7
				
				$('.room2 ul input').eq(5).attr('name','');	//8
				$('.room2 ul input').eq(5).val('');	
				$('.room2 ul input').eq(6).attr('name','');	//9
				$('.room2 ul input').eq(6).val('');	
				$('.room2 ul input').eq(7).attr('name','');	//10
				$('.room2 ul input').eq(7).val('');	
				$('#roomMinus').css("display",'none');
				$('.room2').hide();
			}	
		}
	});

	$("#hNext1").click(function(){

		$("#houseWrite1").css("display", "none");
		$("#houseWrite2").css("display", "block");
		
	});
	$("#hPrev1").click(function(){
		location.href="<%=request.getContextPath()%>/houseIndex"; //등록form1에서 이전 어디로?
	});
	$("#hIndex1").click(function(){
		location.href="<%=request.getContextPath()%>/houseIndex";
	});

	$("#hNext2").click(function(){
		$("#houseWrite2").css("display", "none");
		$("#houseWrite3").css("display", "block");
	});
	$("#hPrev2").click(function(){
		$("#houseWrite2").css("display", "none");
		$("#houseWrite1").css("display", "block"); 
	});
	$("#hIndex2").click(function(){
		location.href="<%=request.getContextPath()%>/houseIndex";
	});
	
	$("#hNext3").click(function(){
		$("#houseWrite3").css("display", "none");
		$("#houseWrite4").css("display", "block");
	});
	$("#hPrev3").click(function(){
		$("#houseWrite3").css("display", "none");
		$("#houseWrite2").css("display", "block"); 
	});
	$("#hIndex3").click(function(){
		location.href="<%=request.getContextPath()%>/houseIndex";
	});
	
	$("#hNext4").click(function(){
		$("#houseWrite4").css("display", "none");
		$("#houseWrite5").css("display", "block");
	});
	$("#hPrev4").click(function(){
		$("#houseWrite4").css("display", "none");
		$("#houseWrite3").css("display", "block"); 
	});
	$("#hIndex4").click(function(){
		location.href="<%=request.getContextPath()%>/houseIndex";
	});
	
	$("#hNext5").click(function(){
		$("#houseWrite5").css("display", "none");
		$("#houseWrite6").css("display", "block");
	});
	$("#hPrev5").click(function(){
		$("#houseWrite5").css("display", "none");
		$("#houseWrite4").css("display", "block"); 
	});
	$("#hIndex5").click(function(){
		location.href="<%=request.getContextPath()%>/houseIndex";
	});
	
	$("#hNext6").click(function(){
		$("#houseWrite6").css("display", "none");
		$("#houseWrite7").css("display", "block");
	});
	$("#hPrev6").click(function(){
		$("#houseWrite6").css("display", "none");
		$("#houseWrite5").css("display", "block"); 
	});
	$("#hIndex6").click(function(){
		location.href="<%=request.getContextPath()%>/houseIndex";
	});
	
	$("#hNext7").click(function(){
		$("#houseWrite7").css("display", "none");
		$("#houseWrite8").css("display", "block");
	});
	$("#hPrev7").click(function(){
		$("#houseWrite7").css("display", "none");
		$("#houseWrite6").css("display", "block"); 
	});
	$("#hIndex7").click(function(){
		location.href="<%=request.getContextPath()%>/houseIndex";
	});
	
	$("#hNext8").click(function(){
		$("#houseWrite8").css("display", "none");
		$("#houseWrite9").css("display", "block");
	});
	$("#hPrev8").click(function(){
		$("#houseWrite8").css("display", "none");
		$("#houseWrite7").css("display", "block"); 
	});
	$("#hIndex8").click(function(){
		location.href="<%=request.getContextPath()%>/houseIndex";
	});
	
	$("#hNext9").click(function(){
		location.href="<%=request.getContextPath()%>/houseIndex";
	});
	$("#hPrve9").click(function(){
		$("#houseWrite9").css("display", "none");
		$("#houseWrite8").css("display", "block"); 
	});
	$("#hIndex9").click(function(){
		location.href="<%=request.getContextPath()%>/houseIndex";
	});

	
	// input 태그에서 엔터키를 입력해 submit 막기
    $('input[type="text"], input[type="password"], input[type=date]').keydown(function(){
       if(event.keyCode === 13){
          event.preventDefault();
       };
    });
	
	
	//성향 버튼 눌렀을때 가져오기
	$('.getPropinfo').click(function(){
		var housename = $(this).text();
		var pno = $(this).attr('id');
		console.log(housename);
		$.ajax({
			url : "/home/getPropensity",
			data : 'userid=${logId}&pno='+pno,
			success : function(result){
				console.log(result);
// 				//1. 생활소음 h_noise
				$('input:radio[name=h_noise]:radio[value='+result.h_noise+']').prop('checked', true);
// 				//2. 생활시간 h_pattern
				$('input:radio[name=h_pattern]:radio[value='+result.h_pattern+']').prop('checked', true);
// 				//3. 반려동물 여부 h_pet
				$('input[name=h_pet]:radio[value='+result.h_pet+']').prop('checked', true);
// 				//4. 반려동물 동반 입주 여부 h_petwith
				$('input[name=h_petwith]:radio[value='+result.h_petwith+']').prop('checked', true);
// 				//5. 흡연 h_smoke
				$('input[name=h_smoke]:radio[value='+result.h_smoke+']').prop('checked', true);
// 				//6. 분위기 h_mood
				$('input[name=h_mood]:radio[value='+result.h_mood+']').prop('checked', true);
// 				//7. 소통방식 h_communication
				$('input[name=h_communication]:radio[value='+result.h_communication+']').prop('checked', true);
// 				//8. 모임빈도 h_party
				$('input[name=h_party]:radio[value='+result.h_party+']').prop('checked', true);
// 				//9. 모임참가 의무 h_enter
				$('input[name=h_enter]:radio[value='+result.h_enter+']').prop('checked', true);
// 				//10. 하우스내 지원서비스 h_support
				if(result.h_support != null){
					for(var i=0; i<result.h_support.length; i++){
						$('input[name=h_support]:checkbox[value='+result.h_support[i]+']').prop('checked', true);
					}
				}
				//11. 메이트 생활시간
				$('input[name=m_pattern]:radio[value='+result.m_pattern+']').prop('checked', true);
				//12. 메이트 성격 m_personality m_personality
				$('input[name=m_personality]:radio[value='+result.m_personality+']').prop('checked', true);
				//13. 메이트 반려동물 선호도 m_pet
				$('input[name=m_pet]:radio[value='+result.m_pet+']').prop('checked', true);
				//14. 메이트 흡연 m_smoke
				$('input[name=m_smoke]:radio[value='+result.m_smoke+']').prop('checked', true);
				//15. 메이트 연령대 m_age
				$('input[name=m_age]:radio[value='+result.m_age+']').prop('checked', true);
				//16. 메이트 성별 m_gender
				$('input[name=m_gender]:radio[value='+result.m_gender+']').prop('checked', true);
				//17. 메이트 외국인입주 가능여부 m_global
				$('input[name=m_global]:radio[value='+result.m_global+']').prop('checked', true);
				//18. 메이트 즉시입주 여부 m_now
				$('input[name=m_now]:radio[value='+result.m_now+']').prop('checked', true);
			},error : function(){
				alert("성향 불러오기 실패.")
			}
		});
	});//성향 버튼 눌렀을때 가져오기========================================================================끝
});
// autocomplete="off" //자동완성 막아줌

    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }

</script>
<style>
/* input[type="date"] {width:200px;} */
/* .house_wrap{width:800px; margin:0 auto; } */
.content ul li{word-break:keep-all;}
.form_box li input, .form_box li select{margin:0px; width:300px;}
.form_box{width:800px; margin:0 auto; padding-left: 100px;}
.content label{width:180px;}
.form_box.choice li > label {width: 240px;}
#houseWrite1_ul2{display: none;}
.btnclass{padding-left:50px;}
#roomPlus{margin:0 auto;}
#houseWrite1 .checks { width: 560px;}
#ck{margin:0 auto; width: 60%;}
#hPic img{width: 250px; height: 250px; }
#houseImg1{width:250px; height:250px; position: relative; margin:0 auto; text-align: center;}
#housepic1, #housepic2, #housepic3 {width:200px; height: 200px; margin:0 auto;}

#multiple-container{width: 100%; margin:0 auto; float:left; position: relative;}
#multiple-container img{width:250px; height: 250px; margin:0 auto; float:left;}
#houseWrite2, #houseWrite3, #houseWrite4, #houseWrite5, 
#houseWrite6, #houseWrite7, #houseWrite8, #houseWrite9 {display:none; margin: 0 auto;}

#houseWrite2 .form_box.choice li > label {width: 110px;}
#houseWrite2 .checks{height: 21px;}
#houseWrite2 .checks label{height: 21px;}
#hosueWrite5 .checks>label{width:100px;}
#houseWrite5 .checks {width: 295px;}
#houseWrite8{width: 800px;}
#houseWrite8 .checks>label{width:200px;}
#hPic{height:250px; width: 250px; margin:0 auto; text-align: center;}
#HproUl>li{float: right;}

.title_wrap div{min-height:300px;}
.checks{width:800px;}
.checks>label{width:120px;}
/* #houseWrite6 input, #houseWrite6 select{width:230px;} */
/*방추가하기 스타일*/
.room2, .room3, .room4, #roomMinus{
	display:none;
}
</style>
<div class="wrap">
<div class="content">

	
	<div class="title_wrap">
	<p class="m_title">하우스 등록하기 </p> 
	<p>&nbsp;</p>
	</div>
		<form method="post" id="houseWriteFrm" action="houseWriteOk" enctype="multipart/form-data">
		
		<input type="hidden" name="pno" value="${housePno }"/>
<%-- 		<input type="hidden" name="no" value="${hVO.no }"/> --%>
		
		<div id="houseWrite1"> <!-- 등록form 1 -->
		
		<div class="title_wrap">
		<p class="s_title">집 기본 정보 등록 </p> <br/>
		<p>&nbsp;</p>
		</div>
			
			<ul class="form_box">
				<li> <label><span class="red_txt">*</span>주소 
				<a class="green" onclick="sample4_execDaumPostcode()" >주소 검색</a> </label> <!-- <input type="text" name="addr"/> --> 
				
				<input type="text" id="sample4_postcode" placeholder="우편번호"></li>
				<li><label><span class="red_txt"></span></label><input type="text" id="sample4_roadAddress" placeholder="도로명주소"></li>
				<li><label><span class="red_txt"></span></label><input type="text" name="addr" id="sample4_jibunAddress" placeholder="지번주소"> <br/></li>
				<li><label><span class="red_txt"></span></label><span id="guide" style="color:#999;display:none"></span></li>
				<li><label><span class="red_txt"></span></label><input type="text" id="sample4_detailAddress" placeholder="상세주소"> <br/> </li>
				<li><label><span class="red_txt"></span></label><input type="text" id="sample4_extraAddress" placeholder="참고항목"> </li>
				
				
				
				<li><label><span class="red_txt">*</span>하우스 이름 </label> <input type="text" name="housename"/></li>
			<li> <label><span class="red_txt">*</span>총 방 개수 </label><select name="room">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
					</select> </li>
			<li> <label><span class="red_txt">*</span>총 욕실 수</label> <select name="bathroom">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
					</select> </li>
			<li><label><span class="red_txt">*</span>현재 인원</label> <select name="nowpeople">
						<option value="0">0</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
					</select> </li>
			<li><label><span class="red_txt">*</span>찾는 인원</label> <select name="searchpeople">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
					</select> </li>
			</ul>
		
				<div class="btnclass">
					<a id="hPrev1" class="green" >이전</a>
					<a id="hNext1" class="green" >다음</a>
					<a id="hIndex1" class="green" >취소</a>
				</div> <!-- 버튼div 종료 -->

		</div> <!-- 등록form1 종료 -->
		
		<div id="houseWrite2"> <!-- 등록form 2 -->
		
		<div class="title_wrap">
		<p class="s_title">공용 시설 정보 등록 </p>
		<p>&nbsp;</p>
		</div>
		
			<ul class="form_box choice">
				<li>
					<label>주방</label>
					<div class="checks">
						<input type="checkbox" id="냉장고" name="publicfacility" value="냉장고"> 
						<label for="냉장고">냉장고</label>
						<input type="checkbox" id="정수기" name="publicfacility" value="정수기"> 
						<label for="정수기">정수기</label>
						<input type="checkbox" id="가스레인지" name="publicfacility" value="가스레인지"> 
						<label for="가스레인지">가스레인지</label>
						<input type="checkbox" id="밥솥" name="publicfacility" value="밥솥"> 
						<label for="밥솥">밥솥</label> 
						<input type="checkbox" id="식기세척기" name="publicfacility" value="식기세척기">  
						<label for="식기세척기">식기세척기</label>
						<input type="checkbox" id="냄비" name="publicfacility" value="냄비"> 
						<label for="냄비">냄비</label>
						<input type="checkbox" id="프라이팬" name="publicfacility" value="프라이팬"> 
						<label for="프라이팬">프라이팬</label>
						<input type="checkbox" id="토스트기" name="publicfacility" value="토스트기"> 
						<label for="토스트기">토스트기</label> 
					</div>
				</li> 
				<p>&nbsp;</p>
				<li>
					<label>거실</label>
					<div class="checks">
						<input type="checkbox" id="소파" name="publicfacility" value="소파"> 
						<label for="소파">소파</label>
						<input type="checkbox" id="티비" name="publicfacility" value="티비"> 
						<label for="티비">티비</label>
						<input type="checkbox" id="탁자" name="publicfacility" value="탁자"> 
						<label for="탁자">탁자</label>
						<input type="checkbox" id="카펫" name="publicfacility" value="카펫"> 
						<label for="카펫">카펫</label> <br/>
					</div>
				</li>
		
				<li>
					<label>욕실</label>
					<div class="checks">
						<input type="checkbox" id="욕조" name="publicfacility" value="욕조"> 
						<label for="욕조">욕조</label>
						<input type="checkbox" id="비데" name="publicfacility" value="비데"> 
						<label for="비데">비데</label>
						<input type="checkbox" id="샴푸" name="publicfacility" value="샴푸"> 
						<label for="샴푸">샴푸</label>
						<input type="checkbox" id="린스" name="publicfacility" value="린스"> 
						<label for="린스">린스</label> <br/>
					</div>
				</li>
				
				<li>
					<label>기타</label>
					<div class="checks">
						<input type="checkbox" id="세탁기" name="publicfacility" value="세탁기"> 
						<label for="세탁기">세탁기</label>
						<input type="checkbox" id="건조기" name="publicfacility" value="건조기"> 
						<label for="건조기">건조기</label>
						<input type="checkbox" id="베란다" name="publicfacility" value="베란다"> 
						<label for="베란다">베란다</label>
						<input type="checkbox" id="WIFI" name="publicfacility" value="WIFI"> 
						<label for="WIFI">WIFI</label> 
					</div>
				</li>
			</ul>	
				<div class="btnclass">
					<a class="green" id="hPrev2">이전</a>
					<a class="green" id="hNext2" >다음</a> 
					<a class="green" id="hIndex2" >취소</a>
				</div> <!-- 버튼div 종료 -->
		</div>	<!-- 등록form2 종료 -->
			
		<div id=houseWrite3>
		
		<div class="title_wrap">
		<p class="s_title">사진 등록 </p> <br/> <!-- 사진 5개 등록? -->
		<p>&nbsp;</p>
		</div>
		
			<ul class="form_box">
				<li id="hPic">
					<img id="houseImg1" name="houseImg1" src="#" alt="upload image" />
					<img id="houseImg2" name="houseImg2" src="#" alt="upload image" />
					<img id="houseImg3" name="houseImg3" src="#" alt="upload image" />
					<img id="houseImg4" name="houseImg4" src="#" alt="upload image" />
					<img id="houseImg5" name="houseImg5" src="#" alt="upload image" />
				</li>
				
				<li> 
					<input type="file" accept="image/*" name="filename"   onchange="readURL(this);" required /> 
					<input type="file" accept="image/*" name="filename"   onchange="readURL(this);"  /> 
					<input type="file" accept="image/*" name="filename"   onchange="readURL(this);" /> 
					<input type="file" accept="image/*" name="filename"   onchange="readURL(this);" /> 
					<input type="file" accept="image/*" name="filename"   onchange="readURL(this);"  /> 
<!-- 					<input type="file" accept="image/*" name="filename2"  id="housepic2" onchange="readURL(this);"/> -->
<!-- 					<input type="file" accept="image/*" name="filename3"  id="housepic3" onchange="readURL(this);"/> -->
<!-- 					<input type="file" accept="image/*" name="filename4"  id="housepic4" onchange="readURL(this);"/> -->
<!-- 					<input type="file" accept="image/*" name="filename5"  id="housepic5" onchange="readURL(this);"/>  -->
					<br/> 
				</li>
					
			</ul>
				<div class="btnclass">
					<a class="green" id="hPrev3">이전</a>
					<a class="green" id="hNext3">다음</a> 
					<a class="green" id="hIndex3" >취소</a>
				</div> <!-- 버튼div 종료 -->
	
		</div>	<!-- 등록form3 종료 -->
			
		<div id="houseWrite4">
		
		<div class="title_wrap">
		<p class="s_title">우리집설명 </p> <br/>
		<p>&nbsp;</p>
		</div>
		<div id="ck">
			<textarea id="write" name="houseprofile"></textarea><br/>
		</div>	
				<div class="btnclass">
					<a class="green" id="hPrev4" >이전</a>
					<a class="green" id="hNext4" >다음</a> 
					<a class="green" id="hIndex4" >취소</a>
				</div> <!-- 버튼div 종료 -->
		
		</div>	<!-- 등록form4 종료 -->
		
		<div id="houseWrite5">
		
		<div class="title_wrap">
			<p class="s_title">임대료 및 입주정보 </p> <br/>
			<p>&nbsp;</p>
		</div>
		
			<ul class="form_box">
				<li><label><span class="red_txt">*</span>방 이름 </label> <input type="text" name="roomVOList[0].roomName"/></li>
				<li><label><span class="red_txt">*</span>월세(관리비포함)</label> <input type="number" name="roomVOList[0].rent"/> </li> 
					
				<li><label><span class="red_txt">*</span>보증금 </label><input type="number" name="roomVOList[0].deposit"/> 	</li>
				<li><label><span class="red_txt">*</span>방 인원</label> <input type="number" name="roomVOList[0].roomPeople"/> </li>
				<li><label><span class="red_txt">*</span>입주 가능일 </label> <input type="date" name="roomVOList[0].enterdate"  min="${now}"/> </li>
				<li><label><span class="red_txt">*</span>최소 거주 기간</label>
					<select name="roomVOList[0].minStay" id="minStay">
						<option value="1-3개월">1~3 개월</option>
						<option value="4-6개월">4~6 개월</option>
						<option value="7-12개월">7~12 개월</option>
						<option value="1년이상">1년 이상</option>
					</select> 
				<li><label ><span class="red_txt">*</span>최대 거주 기간</label>
					<select name="roomVOList[0].maxStay" id="maxStay">
						<option value="1-3개월">1~3 개월</option>
						<option value="4-6개월">4~6 개월</option>
						<option value="7-12개월">7~12 개월</option>
						<option value="1년이상">1년 이상</option>
					</select> </li>
					
				<li><label><span class="red_txt">*</span>가구 여부</label> 
					<div class="checks">
							<input type="radio" id="furniture1" value="1" name="roomVOList[0].furniture"> 
							<label for="furniture1">있음</label>
							
							<input type="radio" id="furniture2" value="2" name="roomVOList[0].furniture"> 
							<label for="furniture2">없음</label>
						</div>	</li>

				<li><label>포함된 가구</label><input type="text" name="roomVOList[0].incFurniture"/></li>
			</ul>
			<!-- 2번방============================================================================ -->
			<div class="room2">
				<br><br>
				<div class="title_wrap">
					<p class="s_title">2번 방 임대료 및 입주정보 </p><br/>
					<p>&nbsp;</p>
				</div><br><br>
				<ul class="form_box room_box">
					<li><label><span class="red_txt">*</span>두번째 방 이름 </label> <input type="text" name=""/></li>
					<li><label><span class="red_txt">*</span>월세(관리비포함)</label> <input type="number" name=""/> </li> 
						
					<li><label><span class="red_txt">*</span>보증금 </label><input type="number" name=""/> 	</li>
					<li><label><span class="red_txt">*</span>방 인원</label> <input type="number" name=""/> </li>
					<li><label><span class="red_txt">*</span>입주 가능일 </label> <input type="date" name=""  min="${now}"/> </li>
					<li><label><span class="red_txt">*</span>최소 거주 기간</label>
						<select name="" id="minStay">
							<option value="1-3개월">1~3 개월</option>
							<option value="4-6개월">4~6 개월</option>
							<option value="7-12개월">7~12 개월</option>
							<option value="1년이상">1년 이상</option>
						</select> 
					<li><label ><span class="red_txt">*</span>최대 거주 기간</label>
						<select name="" id="maxStay">
							<option value="1-3개월">1~3 개월</option>
							<option value="4-6개월">4~6 개월</option>
							<option value="7-12개월">7~12 개월</option>
							<option value="1년이상">1년 이상</option>
						</select> </li>
						
					<li><label><span class="red_txt">*</span>가구 여부</label> 
						<div class="checks">
								<input type="radio" id="furniture3" value="1" name=""> 
								<label for="furniture3">있음</label>
								
								<input type="radio" id="furniture4" value="2" name=""> 
								<label for="furniture4">없음</label>
							</div>	</li>
					<li><label>포함된 가구</label><input type="text" name=""/> </li>
				</ul>
			</div>

			<!-- 3번방============================================================================ -->
			<div class="room3">
				<br><br>
				<div class="title_wrap">
					<p class="s_title">3번 방 임대료 및 입주정보 </p> <br/>
					<p>&nbsp;</p>
				</div><br><br>
				<ul class="form_box room_box room3">
					<li><label><span class="red_txt">*</span>세번째 방 이름 </label> <input type="text" name=""/></li>
					<li><label><span class="red_txt">*</span>월세(관리비포함)</label> <input type="number" name=""/> </li> 
						
					<li><label><span class="red_txt">*</span>보증금 </label><input type="number" name=""/> 	</li>
					<li><label><span class="red_txt">*</span>방 인원</label> <input type="number" name=""/> </li>
					<li><label><span class="red_txt">*</span>입주 가능일 </label> <input type="date" name=""  min="${now}"/> </li>
					<li><label><span class="red_txt">*</span>최소 거주 기간</label>
						<select name="" id="minStay">
							<option value="1-3개월">1~3 개월</option>
							<option value="4-6개월">4~6 개월</option>
							<option value="7-12개월">7~12 개월</option>
							<option value="1년이상">1년 이상</option>
						</select> 
					<li><label ><span class="red_txt">*</span>최대 거주 기간</label>
						<select name="" id="maxStay">
							<option value="1-3개월">1~3 개월</option>
							<option value="4-6개월">4~6 개월</option>
							<option value="7-12개월">7~12 개월</option>
							<option value="1년이상">1년 이상</option>
						</select> </li>
						
					<li><label><span class="red_txt">*</span>가구 여부</label> 
						<div class="checks">
								<input type="radio" id="furniture3" value="1" name=""> 
								<label for="furniture3">있음</label>
								
								<input type="radio" id="furniture4" value="2" name=""> 
								<label for="furniture4">없음</label>
							</div>	</li>
					<li><label>포함된 가구</label><input type="text" name=""/></li>
				</ul>
			</div>

			<!-- 마지막방 4번째============================================================================ -->
			<div class="room4">
				<br><br>
				<div class="title_wrap">
					<p class="s_title">4번 방 임대료 및 입주정보</p><br/>
					<p>&nbsp;</p>
				</div><br><br>
				<ul class="form_box room_box ">
					<li><label><span class="red_txt">*</span>네번째 방 이름 </label> <input type="text" name=""/></li>
					<li><label><span class="red_txt">*</span>월세(관리비포함)</label> <input type="number" name=""/> </li> 
						
					<li><label><span class="red_txt">*</span>보증금 </label><input type="number" name=""/> 	</li>
					<li><label><span class="red_txt">*</span>방 인원</label> <input type="number" name=""/> </li>
					<li><label><span class="red_txt">*</span>입주 가능일 </label> <input type="date" name=""  min="${now}"/> </li>
					<li><label><span class="red_txt">*</span>최소 거주 기간</label>
						<select name="" id="minStay">
							<option value="1-3개월">1~3 개월</option>
							<option value="4-6개월">4~6 개월</option>
							<option value="7-12개월">7~12 개월</option>
							<option value="1년이상">1년 이상</option>
						</select> 
					<li><label ><span class="red_txt">*</span>최대 거주 기간</label>
						<select name="" id="maxStay">
							<option value="1-3개월">1~3 개월</option>
							<option value="4-6개월">4~6 개월</option>
							<option value="7-12개월">7~12 개월</option>
							<option value="1년이상">1년 이상</option>
						</select> </li>
						
					<li><label><span class="red_txt">*</span>가구 여부</label> 
						<div class="checks">
								<input type="radio" id="furniture3" value="1" name=""> 
								<label for="furniture3">있음</label>
								
								<input type="radio" id="furniture4" value="2" name=""> 
								<label for="furniture4">없음</label>
							</div>	</li>
					<li><label>포함된 가구</label><input type="text" name=""/> </li>
				</ul>
			</div>
				<div class="btnclass">
					<a class="green" id="roomPlus">방 추가하기</a>
					<a class="green" id="roomMinus">방 삭제하기</a>
				</div>
				<div class="btnclass">
					<a class="green" id="hPrev5">이전</a>
					<a class="green" id="hNext5" >다음</a> 
					<a class="green" id="hIndex5" >취소</a>
				</div> <!-- 버튼div 종료 -->
		
		</div> <!-- 등록form5 종료 -->
		
			
		<div id=houseWrite6>
		<div class="title_wrap">
		<ul class="s_margin" id="HproUl">
			<c:forEach var="vo" items="${list}">
				<li>
					<a id="${vo.pno }" class="getPropinfo">
						<c:if test="${vo.housename!=null}">${vo.housename}</c:if>
						<c:if test="${vo.housename==null}">성향${vo.pno}</c:if>
					</a>
				</li>
			</c:forEach>
		</ul>
		<p class="s_title">하우스 성향 등록 (생활정보)</p><br/>
		
		<p>&nbsp;</p>
		</div>
		
			<ul class="form_box choice">
				<li>
					<label><span class="red_txt">*</span>생활소음</label>
					<div class="checks houseWrtieProp">
						<input type="radio" id="h_noise1" value="1" name="h_noise"> 
						<label for="h_noise1">매우 조용함</label>

						<input type="radio" id="h_noise2" value="2" name="h_noise"> 
						<label for="h_noise2">보통</label>
						
						<input type="radio" id="h_noise3" value="3" name="h_noise"> 
						<label for="h_noise3">조용하지 않음</label>
					</div>
				</li>
				
				<li>
					<label><span class="red_txt">*</span>생활시간</label>
					<div class="checks houseWrtieProp">
						<input type="radio" id="h_pattern1" value="1" name="h_pattern"> 
						<label for="h_pattern1">주행성</label>
						
						<input type="radio" id="h_pattern3" value="3" name="h_pattern"> 
						<label for="h_pattern3">야행성</label>
					</div>
				</li>
				
					<li>
					<label><span class="red_txt">*</span>반려동물 여부</label>
					<div class="checks houseWrtieProp">
						<input type="radio" id="h_pet3" value="3" name="h_pet"> 
						<label for="h_pet3">있음</label>	
						
						<input type="radio" id="h_pet1" value="1" name="h_pet"> 
						<label for="h_pet1">없음</label>
					</div>
				</li>
				
				<li>
					<label><span class="red_txt">*</span>반려동물 동반 입주 여부</label>
					<div class="checks houseWrtieProp">
						<input type="radio" id="h_petwith3" value="3" name="h_petwith"> 
						<label for="h_petwith3">가능</label>
						
						<input type="radio" id="h_petwith1" value="1" name="h_petwith"> 
						<label for="h_petwith1">불가능</label>
					</div>
				</li>
				
				<li>
					<label><span class="red_txt">*</span>흡연</label>
					<div class="checks houseWrtieProp">
						<input type="radio" id="h_smoke1" value="1" name="h_smoke"> 
						<label for="h_smoke1">비흡연</label>
						
						<input type="radio" id="h_smoke2" value="2" name="h_smoke"> 
						<label for="h_smoke2">실외흡연</label>
						
						<input type="radio" id="h_smoke3" value="3" name="h_smoke"> 
						<label for="h_smoke3">실내흡연</label>
					</div>
				</li>
			</ul>
				<div class="btnclass">
					<a class="green" id="hPrev6" >이전</a>
					<a class="green" id="hNext6" >다음</a> 
					<a class="green" id="hIndex6" >취소</a>
				</div> <!-- 버튼div 종료 -->
			
		</div> <!-- 등록form6 종료 -->
			
		<div id="houseWrite7">
		
		<div class="title_wrap">
		<p class="s_title">하우스 성향 등록 (소통정보) </p>
		<p>&nbsp;</p>
		</div>
			
			<ul class="form_box choice">
			
				<li>
					<label><span class="red_txt">*</span>분위기</label>
					<div class="checks houseWrtieProp">
						<input type="radio" id="h_mood1" value="1" name="h_mood"> 
						<label for="h_mood1">화목함</label>
						
						<input type="radio" id="h_mood2" value="2" name="h_mood"> 
						<label for="h_mood2">보통</label>
						
						<input type="radio" id="h_mood3" value="3" name="h_mood"> 
						<label for="h_mood3">독립적</label>
					</div>
				</li>
				
					<li>
					<label><span class="red_txt">*</span>소통방식</label>
					<div class="checks houseWrtieProp">
						<input type="radio" id="h_communication3" value="3" name="h_communication"> 
						<label for="h_communication3">대화</label>
						<input type="radio" id="h_communication1" value="1" name="h_communication"> 
						<label for="h_communication1">메신저</label>
						<input type="radio" id="h_communication2" value="2" name="h_communication"> 
						<label for="h_communication2">기타</label>
					</div>
				</li>
				
					<li>
					<label><span class="red_txt">*</span>모임빈도</label>
					<div class="checks houseWrtieProp">
						<input type="radio" id="h_party3" value="3" name="h_party"> 
						<label for="h_party3">자주</label>
						<input type="radio" id="h_party2" value="2" name="h_party"> 
						<label for="h_party2">가끔</label>
						<input type="radio" id="h_party1" value="1" name="h_party"> 
						<label for="h_party1">없음</label>
					</div>
				</li>
				
					<li>
					<label><span class="red_txt">*</span>모임참가 의무</label>
					<div class="checks houseWrtieProp">
						<input type="radio" id="h_enter1" value="1" name="h_enter"> 
						<label for="h_enter1">없음</label>
						<input type="radio" id="h_enter2" value="2" name="h_enter"> 
						<label for="h_enter2">상관없음</label>
						<input type="radio" id="h_enter3" value="3" name="h_enter"> 
						<label for="h_enter3">있음</label>
					</div>
				</li>
			</ul>		
				<div class="btnclass">
					<a class="green" id="hPrev7" >이전</a>
					<a class="green" id="hNext7" >다음</a> 
					<a class="green" id="hIndex7" >취소</a>
				</div> <!-- 버튼div 종료 -->
		</div> <!-- 등록form7 종료 -->
		
		<div id="houseWrite8">
		
		<div class="title_wrap">
		<p class="s_title">하우스 성향 등록 (하우스지원 정보) </p> 
		<p>&nbsp;</p>
		</div>
		
			<ul class="form_box choice">
			
				<li>
					<label><span class="red_txt">*</span>하우스 내 지원서비스</label>
					<div class="checks houseWrtieProp">
						<input type="checkbox" id="h_support1" value="1" name="h_support"> 
						<label for="h_support1">공용공간 청소지원</label>
									
						<input type="checkbox" id="h_support2" value="2" name="h_support"> 
						<label for="h_support2">공용생필품 지원</label> <br/>
									
						<input type="checkbox" id="h_support3" value="3" name="h_support"> 
						<label for="h_support3">기본 식품 지원</label>
					</div>
				</li> <br/><br/>
				<li><label><span class="red_txt">*</span>기타</label>
						<div class="checks checkbox">
							<input type="checkbox" name="h_etc" id="h_etc1" value="1"/>
							<label for="h_etc1">보증금 조절 가능</label>
							<input type="checkbox" name="h_etc" id="h_etc3" value="3"/>
							<label for="h_etc3">즉시 입주 가능</label>
						</div>
					</li>
			</ul>
				<div class="btnclass">
					<a class="green" id="hPrev8" >이전</a>
					<a class="green" id="hNext8" >다음</a> 
					<a class="green" id="hIndex8" >취소</a>
				</div> <!-- 버튼div 종료 -->
		</div> <!-- 등록form8 종료 -->
		
		<div id="houseWrite9">
		
		<div class="title_wrap">
		<p class="s_title">선호하는 메이트성향 선택 </p> <br/>
		
		<p>&nbsp;</p>
		</div>
		
			<ul class="form_box choice">
				<li>
					<label><span class="red_txt">*</span>생활 시간</label>
					<div class="checks">
						<input type="radio" id="m_pattern1" value="1" name="m_pattern"> 
						<label for="m_pattern1">주행성</label>
						
						<input type="radio" id="m_pattern3" value="3" name="m_pattern"> 
						<label for="m_pattern3">야행성</label>
					</div>
				</li>
				
				<li>
					<label><span class="red_txt">*</span>성격</label>
					<div class="checks">
						<input type="radio" id="m_personality1" value="1" name="m_personality"> 
						<label for="m_personality1">내향적</label>
						<input type="radio" id="m_personality3" value="3" name="m_personality"> 
						<label for="m_personality3">외향적</label>
						<input type="radio" id="m_personality2" value="2" name="m_personality"> 
						<label for="m_personality2">상관없음</label>
					</div>
				</li>
				
				<li>
					<label><span class="red_txt">*</span>반려동물 선호도</label>
					<div class="checks">
						<input type="radio" id="m_pet1" value="1" name="m_pet"> 
						<label for="m_pet1">가능</label>
						<input type="radio" id="m_pet3" value="3" name="m_pet"> 
						<label for="m_pet3">불가능</label>
					</div>
				</li>
				
				<li>
					<label><span class="red_txt">*</span>흡연</label>
					<div class="checks">
						<input type="radio" id="m_smoke1" value="1" name="m_smoke"> 
						<label for="m_smoke1">비흡연</label>
						<input type="radio" id="m_smoke3" value="3" name="m_smoke"> 
						<label for="m_smoke3">흡연</label>
						<input type="radio" id="m_smoke2" value="2" name="m_smoke"> 
						<label for="m_smoke2">상관없음</label>
					</div>
				</li>
				
				<li>
					<label><span class="red_txt">*</span>연령대</label>
					<div class="checks">
						<input type="radio" id="m_age1" value="1" name="m_age"> 
						<label for="m_age1">20~30대</label>
						<input type="radio" id="m_age3" value="3" name="m_age"> 
						<label for="m_age3">40대 이상</label>
						<input type="radio" id="m_age2" value="2" name="m_age"> 
						<label for="m_age2">상관없음</label>
					</div>
				</li>	
				
				<li>
					<label><span class="red_txt">*</span>성별</label>
					<div class="checks">
						<input type="radio" id="m_gender1" value="1" name="m_gender"> 
						<label for="m_gender1">여성</label>
						<input type="radio" id="m_gender3" value="3" name="m_gender"> 
						<label for="m_gender3">남성</label>
						<input type="radio" id="m_gender2" value="2" name="m_gender"> 
						<label for="m_gender2">상관없음</label>
					</div>
				</li>	
				
				<li>
					<label><span class="red_txt">*</span>외국인입주 가능여부</label>
					<div class="checks">
						<input type="radio" id="m_global3" value="3" name="m_global"> 
						<label for="m_global3">가능</label>
						<input type="radio" id="m_global1" value="1" name="m_global"> 
						<label for="m_global1">불가능</label>
					</div>
				</li>
				
				<li>
					<label><span class="red_txt">*</span>즉시입주 가능여부</label>
					<div class="checks">
						<input type="radio" id="m_now1" value="1" name="m_now"> 
						<label for="m_now1">가능</label>
						<input type="radio" id="m_now3" value="3" name="m_now"> 
						<label for="m_now3">불가능</label>
					</div>
				</li>		
			</ul>	
				<div class="btnclass">
					<a class="green" id="hPrve9" >이전</a>
					<button class="green" id="hNext9" >등록</button> 
					<a class="green" id="hIndex9" >취소</a>
				</div> <!-- 버튼div 종료 -->
		</div> <!-- 등록form9 종료 -->	
	
	</form> <!-- 방등록 form  -->

</div> <!-- content 종료 -->
</div> <!-- wrap -->
