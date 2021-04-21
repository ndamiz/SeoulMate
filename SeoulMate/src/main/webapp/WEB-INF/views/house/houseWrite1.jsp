<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/housemate.css">
<script src="//cdn.ckeditor.com/4.16.0/full/ckeditor.js"></script>
<script>
	$(function() {
	    $("#input-image").on('change', function(){
	        readURL(this);
	    });
	});
	
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

</script>
<style>
input[type="date"] {width:200px;}
.house_wrap{width:800px; margin:0 auto; }
.house_wrap ul li{word-break:keep-all;}

</style>
<div class="wrap">
	<div class="house_wrap">
	
	<div class="title_wrap">
	<p class="m_title">하우스 등록하기 </p> 
	</div>
		<form method="post" action="">
		
		<div id="houseWrite1"> <!-- 등록form 1 -->
		
		<div class="title_wrap">
		<p class="s_title">집 기본 정보 등록 </p> <br/>
		</div>
			<ul class="form_box">
				<li> 게재 기간 &nbsp; <input type="date" /> </li>
				<li>주소 &nbsp; <input type="text"/> </li>
			<li>총 방 개수 <select>
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
					</select> 
			총 욕실 수	 <select>
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
					</select> </li>
			<li>현재 인원 <select>
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
					</select> 
			찾는 인원 <select>
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
					</select> </li>
			</ul>
			<button class="green" >방 추가등록 </button> <br/>
		</div> <!-- 등록form1 종료 -->
		<div id="houseWrite2"> <!-- 등록form 2 -->
		
		<div class="title_wrap">
		<p class="s_title">공용 시설 정보 등록 </p>
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
		</div>	<!-- 등록form2 종료 -->
			
		<div id=houseWrite3>
		
		<div class="title_wrap">
		<p class="s_title">하우스 성향 등록 (생활정보)</p> <br/>
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
		</div> <!-- 등록form3 종료 -->
			
		<div id="houseWrite4">
		
		<div class="title_wrap">
		<p class="s_title">하우스 성향 등록 (소통정보) </p>
		</div>
			
			<ul class="form_box choice">
			
				<li>
					<label><span class="red_txt">*</span>분위기</label>
					<div class="checks">
						<input type="radio" id="radio1" name="character1"> 
						<label for="radio1">화목함</label>
						
						<input type="radio" id="radio2" name="character1"> 
						<label for="radio2">보통</label>
						
						<input type="radio" id="radio3" name="character1"> 
						<label for="radio3">독립적</label>
					</div>
				</li>
				
					<li>
					<label><span class="red_txt">*</span>소통방식</label>
					<div class="checks">
						<input type="radio" id="radio4" name="character2"> 
						<label for="radio4">대화</label>
						
						<input type="radio" id="radio5" name="character2"> 
						<label for="radio5">기타</label>
					</div>
				</li>
				
					<li>
					<label><span class="red_txt">*</span>모임빈도</label>
					<div class="checks">
						<input type="radio" id="radio6" name="character3"> 
						<label for="radio6">없음</label>
						
						<input type="radio" id="radio7" name="character3"> 
						<label for="radio7">가끔</label>
						
						<input type="radio" id="radio8" name="character3"> 
						<label for="radio8">보통</label>
						
						<input type="radio" id="radio9" name="character3"> 
						<label for="radio9">자주</label>
					</div>
				</li>
				
					<li>
					<label><span class="red_txt">*</span>모임참가 의무</label>
					<div class="checks">
						<input type="radio" id="radio10" name="character4"> 
						<label for="radio10">있음</label>
						
						<input type="radio" id="radio11" name="character4"> 
						<label for="radio11">없음</label>
					</div>
				</li>
			</ul>		
		</div> <!-- 등록form4 종료 -->
		
		<div id="houseWrite5">
		
		<div class="title_wrap">
		<p class="s_title">하우스 성향 등록 (하우스지원 정보) </p> 
		</div>
		
			<ul class="form_box choice">
			
				<li>
					<label><span class="red_txt">*</span>하우스 내 지원서비스</label>
					<div class="checks">
						<input type="checkbox" id="check1" name="character1"> 
						<label for="check1">공용공간 청소지원</label>
									
						<input type="checkbox" id="check2" name="character1"> 
						<label for="check2">공용생필품 지원</label> <br/>
									
						<input type="checkbox" id="check3" name="character1"> 
						<label for="check3">기본 식품 지원</label>
						
						<input type="checkbox" id="check4" name="character1"> 
						<label for="check4">미지원</label>
					</div>
				</li> <br/><br/>
			</ul>
		</div> <!-- 등록form5 종료 -->
		
		<div id="houseWrite6">
		
		<div class="title_wrap">
			<p class="s_title">임대료 및 입주정보 </p> <br/>
		</div>
		
			<ul class="form_box">
				<li>월세(관리비) <input type="text"/> 
					<div class="checks">
						<input type="radio" id="radio12" name="character1"> 
						<label for="radio12">포함</label>
						<input type="radio" id="radio13" name="character1"> 
						<label for="radio13">불포함</label>
					</div>		
						
				<li>보증금(조율) <input type="text"/> 
					<div class="checks">
						<input type="radio" id="radio14" name="character1"> 
						<label for="radio14">포함</label>
						<input type="radio" id="radio15" name="character1"> 
						<label for="radio15">미포함</label>
					</div>	</li>
				<li>입주 가능일 <input type="date"/> </li>
				<li>최소 거주 기간
					<select>
						<option>1~3 개월</option>
						<option>4~6 개월</option>
						<option>7~12 개월</option>
						<option>1년 이상</option>
					</select> </li>
				<li>최대 거주 기간
					<select>
						<option>1~3 개월</option>
						<option>4~6 개월</option>
						<option>7~12 개월</option>
						<option>1년 이상</option>
					</select> </li>
			</ul>
		</div> <!-- 등록form6 종료 -->
			
		<div id="houseWrite7">
		
		<div class="title_wrap">
		<p class="s_title">사진 등록 </p> <br/>
		</div>
		
			<ul class="form_box">
				<li> 이미지 미리보기<img id="housePic1" name="housePic1" src="#" alt="upload image" style="width:400px; height:400px;"/></li>
				<li> <input type="file" accept="image/*" id="input-image" onchange="readURL(this);"/> <br/> </li>
			</ul>
		</div> <!-- 등록form7 종료 -->
		
		<div id="houseWrite8">
		
		<div class="title_wrap">
		<p class="s_title">선호하는 메이트성향 선택 </p> <br/>
		</div>
		
			<ul class="form_box choice">
				<li>
					<label><span class="red_txt">*</span>생활 시간</label>
					<div class="checks">
						<input type="radio" id="radio1" name="character1"> 
						<label for="radio1">야행성</label>
						<input type="radio" id="radio2" name="character1"> 
						<label for="radio2">주행성</label>
						<input type="radio" id="radio3" name="character1"> 
						<label for="radio3">상관없음</label>
					</div>
				</li>
				
				<li>
					<label><span class="red_txt">*</span>성격</label>
					<div class="checks">
						<input type="radio" id="radio4" name="character2"> 
						<label for="radio4">외향적</label>
						<input type="radio" id="radio5" name="character2"> 
						<label for="radio5">내향적</label>
						<input type="radio" id="radio6" name="character2"> 
						<label for="radio6">보통</label>
						<input type="radio" id="radio7" name="character2"> 
						<label for="radio7">상관없음</label>
					</div>
				</li>
				
				<li>
					<label><span class="red_txt">*</span>반려동물 선호도</label>
					<div class="checks">
						<input type="radio" id="radio8" name="character3"> 
						<label for="radio8">긍정적</label>
						<input type="radio" id="radio9" name="character3"> 
						<label for="radio9">부정적</label>
						<input type="radio" id="radio10" name="character3"> 
						<label for="radio10">상관없음</label>
					</div>
				</li>
				
				<li>
					<label><span class="red_txt">*</span>흡연</label>
					<div class="checks">
						<input type="radio" id="radio11" name="character4"> 
						<label for="radio11">실내흡연</label>
						<input type="radio" id="radio12" name="character4"> 
						<label for="radio12">실외흡연</label>
						<input type="radio" id="radio13" name="character4"> 
						<label for="radio13">비흡연</label>
						<input type="radio" id="radio14" name="character4"> 
						<label for="radio14">상관없음</label>
					</div>
				</li>
				
				<li>
					<label><span class="red_txt">*</span>연령대</label>
					<div class="checks">
						<input type="radio" id="radio15" name="character5"> 
						<label for="radio15">20대</label>
						<input type="radio" id="radio16" name="character5"> 
						<label for="radio16">30대</label>
						<input type="radio" id="radio17" name="character5"> 
						<label for="radio17">40대</label>
						<input type="radio" id="radio18" name="character5"> 
						<label for="radio18">상관없음</label>
					</div>
				</li>	
				
				<li>
					<label><span class="red_txt">*</span>성별</label>
					<div class="checks">
						<input type="radio" id="radio19" name="character6"> 
						<label for="radio19">여성</label>
						<input type="radio" id="radio20" name="character6"> 
						<label for="radio20">남성</label>
						<input type="radio" id="radio21" name="character6"> 
						<label for="radio21">상관없음</label>
					</div>
				</li>	
				
				<li>
					<label><span class="red_txt">*</span>외국인입주 가능여부</label>
					<div class="checks">
						<input type="radio" id="radio22" name="character7"> 
						<label for="radio22">가능</label>
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
		</div> <!-- 등록form8 종료 -->	
		
		<div id="houseWrite9">
		
		<div class="title_wrap">
		<p class="s_title">우리집설명 </p> <br/>
		</div>
		
			<textarea name="houseProfile"></textarea><br/>
		</div> <!-- 등록form9 종료 -->
		
		
		
		<div class="btnclass">
			<button class="green" onclick="location.href='<%=request.getContextPath()%>/houseWrite2'">이전</button>
			<button class="green" onclick="location.href='<%=request.getContextPath()%>/houseWrite3'" >다음</button> 
			<button class="green" onclick="location.href='<%=request.getContextPath()%>/houseIndex'" >취소</button>
		</div>
		
	</form> <!-- 방등록 form  -->
</div> <!-- house_wrap -->
</div> <!-- wrap -->
