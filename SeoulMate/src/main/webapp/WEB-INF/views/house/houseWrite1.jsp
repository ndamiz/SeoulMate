<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/housemate.css">


<!-- <!— include summernote css/js —> -->
<!-- <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script> -->
<script>

// 	$(function() {
// 	    $("#input-image").on('change', function(){
// 	        readURL(this);
// 	    });
// 	});
	
	function readURL(input) {
	    if (input.files && input.files[0]) {
	    var reader = new FileReader();
	
	    reader.onload = function (e) {
	            $('#housePic1').attr('src', e.target.result);
	        }
	
	      reader.readAsDataURL(input.files[0]);
	    }
	}

	$(function(){
		CKEDITOR.replace("houseProfile"); //설명글 name 설정 필요
		
		$("#write").on('submit', function(){
			if(CKEDITOR.instances.content.getData()==""){
				alert("내용을 입력해주세요");
				return false;
			}return true;
		});
		
	});

// $(document).ready(function() {
//     $('#houseProfile').summernote();
//   });

$(function(){
	
	$("#hNext1").click(function(){
		$("#houseWrite1").css("display", "none");
		$("#houseWrite2").css("display", "block");
	});
	$("#hPrev1").click(function(){
		$("#houseWrite1").css("display", "none");
		$("#houseWrite1").css("display", "block"); //등록form1에서 이전 어디로?
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
		$("#houseWrite9").css("display", "none");
		$("#houseWrite1").css("display", "block"); //마지막 등록form에서는 어디로 이동?
	});
	$("#hPrev9").click(function(){
		$("#houseWrite9").css("display", "none");
		$("#houseWrite8").css("display", "block"); 
	});
	$("#hIndex9").click(function(){
		location.href="<%=request.getContextPath()%>/houseIndex";
	});

	
});



</script>
<style>
input[type="date"] {width:200px;}
.house_wrap{width:800px; margin:0 auto; }
.house_wrap ul li{word-break:keep-all;}
#houseWrite1 li{padding-left:150px;}
.btnclass{padding-left:50px;}
#roomPlus{margin-left:350px;}
#houseWrite2, #houseWrite3, #houseWrite4, #houseWrite5, 
#houseWrite6, #houseWrite7, #houseWrite8, #houseWrite9 {display:none; }
#houseWrite7 li{text-align: center; padding-right: 50%;}
#hPic{height:125px;}

</style>
<div class="wrap">
	<div class="house_wrap">
	
	<div class="title_wrap">
	<p class="m_title">하우스 등록하기 </p> 
	<p>&nbsp;</p>
	</div>
		<form method="post" action="">
		
		<div id="houseWrite1"> <!-- 등록form 1 -->
		
		<div class="title_wrap">
		<p class="s_title">집 기본 정보 등록 </p> <br/>
		<p>&nbsp;</p>
		</div>
			<ul class="form_box">
				<li> <label>게재 기간 </label> <input type="date" /> </li>
				<li> <label>주소 </label> <input type="text"/> </li>
			<li> <label>총 방 개수 </label><select>
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
					</select> 
			<label>총 욕실 수</label>	<select>
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
					</select> </li>
			<li><label>현재 인원</label> <select>
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
					</select> 
			<label>찾는 인원</label> <select>
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
					</select> </li>
			</ul>
			<button id="roomPlus" class="green" >방 추가등록 </button> <br/> 
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
					<label><span class="red_txt">*</span>주방</label>
					<div class="checks">
						<input type="checkbox" id="check1" name="character1"> 
						<label for="check1">냉장고</label>
						<input type="checkbox" id="check2" name="character1"> 
						<label for="check2">정수기</label>
						<input type="checkbox" id="check3" name="character1"> 
						<label for="check3">가스레인지</label>
						<input type="checkbox" id="check4" name="character1"> 
						<label for="check4">밥솥</label> <br/>
						<input type="checkbox" id="check5" name="character1">  
						<label for="check5">식기세척기</label>
						<input type="checkbox" id="check6" name="character1"> 
						<label for="check6">냄비</label>
						<input type="checkbox" id="check7" name="character1"> 
						<label for="check7">프라이팬</label>
						<input type="checkbox" id="check8" name="character1"> 
						<label for="check8">토스트기</label> 
					</div>
				</li> 
				<br/> <br/>
				<li>
					<label><span class="red_txt">*</span>거실</label>
					<div class="checks">
						<input type="checkbox" id="check9" name="character2"> 
						<label for="check9">소파</label>
						<input type="checkbox" id="check10" name="character2"> 
						<label for="check10">티비</label>
						<input type="checkbox" id="check11" name="character2"> 
						<label for="check11">탁자</label>
						<input type="checkbox" id="check12" name="character2"> 
						<label for="check12">카펫</label> <br/>
					</div>
				</li>
		
				<li>
					<label><span class="red_txt">*</span>욕실</label>
					<div class="checks">
						<input type="checkbox" id="check13" name="character3"> 
						<label for="check13">욕조</label>
						<input type="checkbox" id="check14" name="character3"> 
						<label for="check14">비데</label>
						<input type="checkbox" id="check15" name="character3"> 
						<label for="check15">샴푸</label>
						<input type="checkbox" id="check16" name="character3"> 
						<label for="check16">린스</label> <br/>
					</div>
				</li>
				
				<li>
					<label><span class="red_txt">*</span>기타</label>
					<div class="checks">
						<input type="checkbox" id="check17" name="character4"> 
						<label for="check17">세탁기</label>
						<input type="checkbox" id="check18" name="character4"> 
						<label for="check18">건조기</label>
						<input type="checkbox" id="check19" name="character4"> 
						<label for="check19">베란다</label>
						<input type="checkbox" id="check20" name="character4"> 
						<label for="check20">WIFI</label> <br/>
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
		<p class="s_title">하우스 성향 등록 (생활정보)</p> <br/>
		<p>&nbsp;</p>
		</div>
		
			<ul class="form_box choice">
				<li>
					<label><span class="red_txt">*</span>생활소음</label>
					<div class="checks">
						<input type="radio" id="radio1" name="character1"> 
						<label for="radio1">조용함</label>
						
						<input type="radio" id="radio2" name="character1"> 
						<label for="radio2">보통</label>
						
						<input type="radio" id="radio3" name="character1"> 
						<label for="radio3">활발함</label>
					</div>
				</li>
				
				<li>
					<label><span class="red_txt">*</span>생활시간</label>
					<div class="checks">
						<input type="radio" id="radio4" name="character2"> 
						<label for="radio4">야행성</label>
						
						<input type="radio" id="radio5" name="character2"> 
						<label for="radio5">주행성</label>
					</div>
				</li>
				
					<li>
					<label><span class="red_txt">*</span>반려동물</label>
					<div class="checks">
						<input type="radio" id="radio6" name="character3"> 
						<label for="radio6">있음</label>
						
						<input type="radio" id="radio7" name="character3"> 
						<label for="radio7">없음</label>
					</div>
				</li>
				
				<li>
					<label><span class="red_txt">*</span>반려동물 거주</label>
					<div class="checks">
						<input type="radio" id="radio8" name="character4"> 
						<label for="radio8">가능</label>
						
						<input type="radio" id="radio9" name="character4"> 
						<label for="radio9">불가능</label>
					</div>
				</li>
				
				<li>
					<label><span class="red_txt">*</span>흡연</label>
					<div class="checks">
						<input type="radio" id="radio10" name="character5"> 
						<label for="radio10">실내흡연</label>
						
						<input type="radio" id="radio11" name="character5"> 
						<label for="radio11">실외흡연</label>
						
						<input type="radio" id="radio12" name="character5"> 
						<label for="radio12">비흡연</label>
					</div>
				</li>
			</ul>
				<div class="btnclass">
					<a class="green" id="hPrev3" >이전</a>
					<a class="green" id="hNext3" >다음</a> 
					<a class="green" id="hIndex3" >취소</a>
				</div> <!-- 버튼div 종료 -->
			
		</div> <!-- 등록form3 종료 -->
			
		<div id="houseWrite4">
		
		<div class="title_wrap">
		<p class="s_title">하우스 성향 등록 (소통정보) </p>
		<p>&nbsp;</p>
		</div>
			
			<ul class="form_box choice">
			
				<li>
					<label><span class="red_txt">*</span>분위기</label>
					<div class="checks">
						<input type="radio" id="radio13" name="character1"> 
						<label for="radio13">화목함</label>
						
						<input type="radio" id="radio14" name="character1"> 
						<label for="radio14">보통</label>
						
						<input type="radio" id="radio15" name="character1"> 
						<label for="radio15">독립적</label>
					</div>
				</li>
				
					<li>
					<label><span class="red_txt">*</span>소통방식</label>
					<div class="checks">
						<input type="radio" id="radio16" name="character2"> 
						<label for="radio16">대화</label>
						
						<input type="radio" id="radio17" name="character2"> 
						<label for="radio17">기타</label>
					</div>
				</li>
				
					<li>
					<label><span class="red_txt">*</span>모임빈도</label>
					<div class="checks">
						<input type="radio" id="radio18" name="character3"> 
						<label for="radio18">없음</label>
						
						<input type="radio" id="radio19" name="character3"> 
						<label for="radio19">가끔</label>
						
						<input type="radio" id="radio20" name="character3"> 
						<label for="radio20">보통</label>
						
						<input type="radio" id="radio21" name="character3"> 
						<label for="radio21">자주</label>
					</div>
				</li>
				
					<li>
					<label><span class="red_txt">*</span>모임참가 의무</label>
					<div class="checks">
						<input type="radio" id="radio22" name="character4"> 
						<label for="radio22">있음</label>
						
						<input type="radio" id="radio23" name="character4"> 
						<label for="radio23">없음</label>
					</div>
				</li>
			</ul>		
				<div class="btnclass">
					<a class="green" id="hPrev4" >이전</a>
					<a class="green" id="hNext4" >다음</a> 
					<a class="green" id="hIndex4" >취소</a>
				</div> <!-- 버튼div 종료 -->
		</div> <!-- 등록form4 종료 -->
		
		<div id="houseWrite5">
		
		<div class="title_wrap">
		<p class="s_title">하우스 성향 등록 (하우스지원 정보) </p> 
		<p>&nbsp;</p>
		</div>
		
			<ul class="form_box choice">
			
				<li>
					<label><span class="red_txt">*</span>하우스 내 지원서비스</label>
					<div class="checks">
						<input type="checkbox" id="check24" name="character1"> 
						<label for="check24">공용공간 청소지원</label>
									
						<input type="checkbox" id="check25" name="character1"> 
						<label for="check25">공용생필품 지원</label> <br/>
									
						<input type="checkbox" id="check26" name="character1"> 
						<label for="check26">기본 식품 지원</label> <span>&nbsp; </span>
						
						<input type="checkbox" id="check27" name="character1"> 
						<label for="check27">미지원</label>
					</div>
				</li> <br/><br/>
			</ul>
				<div class="btnclass">
					<a class="green" id="hPrev5" >이전</a>
					<a class="green" id="hNext5" >다음</a> 
					<a class="green" id="hIndex5" >취소</a>
				</div> <!-- 버튼div 종료 -->
		</div> <!-- 등록form5 종료 -->
		
		<div id="houseWrite6">
		
		<div class="title_wrap">
			<p class="s_title">임대료 및 입주정보 </p> <br/>
			<p>&nbsp;</p>
		</div>
		
			<ul class="form_box">
				<li><label>월세(관리비)</label> <input type="text"/> 
					<div class="checks">
						<input type="radio" id="radio28" name="character1"> 
						<label for="radio28">포함</label>
						<input type="radio" id="radio29" name="character1"> 
						<label for="radio29">불포함</label>
					</div>		
						
				<li><label>보증금(조율) </label><input type="text"/> 
					<div class="checks">
						<input type="radio" id="radio30" name="character1"> 
						<label for="radio30">포함</label>
						<input type="radio" id="radio31" name="character1"> 
						<label for="radio31">미포함</label>
					</div>	</li>
				<li><label>입주 가능일</label> <input type="date"/> </li>
				<li><label>최소 거주 기간</label>
					<select>
						<option>1~3 개월</option>
						<option>4~6 개월</option>
						<option>7~12 개월</option>
						<option>1년 이상</option>
					</select> </li>
				<li><label>최대 거주 기간</label>
					<select>
						<option>1~3 개월</option>
						<option>4~6 개월</option>
						<option>7~12 개월</option>
						<option>1년 이상</option>
					</select> </li>
			</ul>
				<div class="btnclass">
					<a class="green" id="hPrev6">이전</a>
					<a class="green" id="hNext6" >다음</a> 
					<a class="green" id="hIndex6" >취소</a>
				</div> <!-- 버튼div 종료 -->
		</div> <!-- 등록form6 종료 -->
			
		<div id="houseWrite7">
		
		<div class="title_wrap">
		<p class="s_title">사진 등록 </p> <br/>
		<p>&nbsp;</p>
		</div>
		
			<ul class="form_box">
				<li id="hPic"><img id="housePic1" name="housePic1" src="#" alt="upload image" style="width:150px; height:107px;"/></li>
				<li> <input type="file" accept="image/*" id="input-image" onchange="readURL(this);"/> <br/> </li>
			</ul>
				<div class="btnclass">
					<a class="green" id="hPrev7">이전</a>
					<a class="green" id="hNext7">다음</a> 
					<a class="green" id="hIndex7" >취소</a>
				</div> <!-- 버튼div 종료 -->
		</div> <!-- 등록form7 종료 -->
		
		<div id="houseWrite8">
		
		<div class="title_wrap">
		<p class="s_title">선호하는 메이트성향 선택 </p> <br/>
		<p>&nbsp;</p>
		</div>
		
			<ul class="form_box choice">
				<li>
					<label><span class="red_txt">*</span>생활 시간</label>
					<div class="checks">
						<input type="radio" id="radio32" name="character1"> 
						<label for="radio32">야행성</label>
						<input type="radio" id="radio33" name="character1"> 
						<label for="radio33">주행성</label>
						<input type="radio" id="radio34" name="character1"> 
						<label for="radio34">상관없음</label>
					</div>
				</li>
				
				<li>
					<label><span class="red_txt">*</span>성격</label>
					<div class="checks">
						<input type="radio" id="radio35" name="character2"> 
						<label for="radio35">외향적</label>
						<input type="radio" id="radio36" name="character2"> 
						<label for="radio36">내향적</label>
						<input type="radio" id="radio37" name="character2"> 
						<label for="radio37">보통</label>
						<input type="radio" id="radio38" name="character2"> 
						<label for="radio38">상관없음</label>
					</div>
				</li>
				
				<li>
					<label><span class="red_txt">*</span>반려동물 선호도</label>
					<div class="checks">
						<input type="radio" id="radio39" name="character3"> 
						<label for="radio39">긍정적</label>
						<input type="radio" id="radio40" name="character3"> 
						<label for="radio40">부정적</label>
						<input type="radio" id="radio41" name="character3"> 
						<label for="radio41">상관없음</label>
					</div>
				</li>
				
				<li>
					<label><span class="red_txt">*</span>흡연</label>
					<div class="checks">
						<input type="radio" id="radio42" name="character4"> 
						<label for="radio42">실내흡연</label>
						<input type="radio" id="radio43" name="character4"> 
						<label for="radio43">실외흡연</label>
						<input type="radio" id="radio44" name="character4"> 
						<label for="radio44">비흡연</label>
						<input type="radio" id="radio45" name="character4"> 
						<label for="radio45">상관없음</label>
					</div>
				</li>
				
				<li>
					<label><span class="red_txt">*</span>연령대</label>
					<div class="checks">
						<input type="radio" id="radio46" name="character5"> 
						<label for="radio46">20대</label>
						<input type="radio" id="radio47" name="character5"> 
						<label for="radio47">30대</label>
						<input type="radio" id="radio48" name="character5"> 
						<label for="radio48">40대</label>
						<input type="radio" id="radio49" name="character5"> 
						<label for="radio49">상관없음</label>
					</div>
				</li>	
				
				<li>
					<label><span class="red_txt">*</span>성별</label>
					<div class="checks">
						<input type="radio" id="radio50" name="character6"> 
						<label for="radio50">여성</label>
						<input type="radio" id="radio51" name="character6"> 
						<label for="radio51">남성</label>
						<input type="radio" id="radio52" name="character6"> 
						<label for="radio52">상관없음</label>
					</div>
				</li>	
				
				<li>
					<label><span class="red_txt">*</span>외국인입주 가능여부</label>
					<div class="checks">
						<input type="radio" id="radio53" name="character7"> 
						<label for="radio53">가능</label>
						<input type="radio" id="radio23" name="character7"> 
						<label for="radio23">불가능</label>
						<input type="radio" id="radio24" name="character7"> 
						<label for="radio24">상관없음</label>
					</div>
				</li>
				
				<li>
					<label><span class="red_txt">*</span>즉시입주 가능여부</label>
					<div class="checks">
						<input type="radio" id="radio25" name="character8"> 
						<label for="radio25">가능</label>
						<input type="radio" id="radio26" name="character8"> 
						<label for="radio26">불가능</label>
						<input type="radio" id="radio27" name="character8"> 
						<label for="radio27">상관없음</label>
					</div>
				</li>		
			</ul>	
				<div class="btnclass">
					<a class="green" id="hPrve8" >이전</a>
					<a class="green" id="hNext8" >다음</a> 
					<a class="green" id="hIndex8" >취소</a>
				</div> <!-- 버튼div 종료 -->
		</div> <!-- 등록form8 종료 -->	
		
		<div id="houseWrite9">
		
		<div class="title_wrap">
		<p class="s_title">우리집설명 </p> <br/>
		<p>&nbsp;</p>
		</div>
		
			<textarea id="houseProfile" name="houseProfile"></textarea><br/>
			
				<div class="btnclass">
					<a class="green" id="hPrev9" >이전</a>
					<a class="green" id="hNext9" >다음</a> 
					<a class="green" id="hIndex9" >취소</a>
				</div> <!-- 버튼div 종료 -->
		</div> <!-- 등록form9 종료 -->
		

		
	</form> <!-- 방등록 form  -->
</div> <!-- house_wrap -->
</div> <!-- wrap -->
