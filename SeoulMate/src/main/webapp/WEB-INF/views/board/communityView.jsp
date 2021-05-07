<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/yun.css">
<script>
	//1.글삭제
	function communityDel(){
		if(confirm('해당 글을 삭제하나요?')){
			location.href="communityDel?no=${vo.no}";
		}
	}
	//2.글 수정
	
	//댓글===============================================
	//1. 댓글 목록 불러오기
	function replyList(){
		var url = "/home/replyList";
		var params = "no=${vo.no}";
		
		$.ajax({
			url : url,
			data : params,
			success : function(result){
				var $result = $(result);
				var tag = "";
				$result.each(function(idx, obj){
						//댓글 사진 div
						tag += "<li><div class='communityView_user_porfile'>";
							tag += '<img src="<%=request.getContextPath()%>/img/comm/sample.png"/>';
						tag += '</div>'
						
						//아이디랑 등록시간 div
						tag += '<div class="communityView_comment_user_detail">';
							tag += obj.userid+'<br>';
						tag += obj.writedate + '</div>';
						
						//수정취소, 수정, 답글, 신고 버튼 div
						tag += '<div class="communityView_comment_btn">';
						//로그인 아이디랑 댓글 작성자 아이디랑 같으면
						if(obj.userid == '${logId}'){
							tag += '<button class="white" style="display:none">수정취소</button>'
							tag += '<button class="white">수정</button>'
							tag += '<button class="white" href="">삭제</button>'
						}else{
							//로그인 아이디랑 댓글 작성자 아이디랑 안같으면 => 버튼의 순번으로 클릭 이벤트를 처리하기 때문에 visibility로 처리함
							tag += '<button class="white" style="display:none">수정취소</button>'
							tag += '<button class="white" style="visibility:hidden">수정</button>'
							tag += '<button class="white" style="visibility:hidden" href="">삭제</button>'
						}
						tag += '<button id="'+idx+'" class="white">답글</button>'
						tag += '<input type="hidden" value="'+obj.userid+'">'
						tag += '<input type="hidden" value="'+obj.num+'">'
						tag += '<button class="report white">신고</button></div>'
						
						tag += '<li class="communityView_comment_content">'
							tag += obj.content
						tag += '</li>';
						//댓글 수정폼
						if(obj.userid=="${logId}"){
							tag += '<form class="replyEditForm"><div style="display:none">'
							tag += '<input type="hidden" name="num" value="'+obj.num+'">'; //댓글 번호
							tag += '<input type="hidden" name="no" value="${vo.no}">'; // 원글 번호
							tag += '<input type="hidden" name="userid" value="'+obj.userid+'">';
							tag += "<li class='communityView_comment_content_edit' style='background-color:#eee;'><textarea name='content' style='width: 100%; height:100px; border-radius: 20px; background-color:#fff;'>"+obj.content+"</textarea>"
							tag += "<button class='green'>완료</button></li></div>";
							tag += '</form></li>'
						}
				});
				$("#replyList").html(tag);
			},error : function(){
				console.log("댓글 목록 실패...");
			}
		});//ajax end
	}//1.end
	$(function(){
		replyList();
		//2. 댓글 쓰기
		$("#replyBtn").click(function(){
			if($("#comment_content").val()!=''){
				var url = "/home/replyWriteOk";
				var params = $("#commentForm").serialize();
				
				$.ajax({
					url : url,
					data : params,
					success : function(result){
						replyList();
						console.log("댓글등록 성공!!");
					},error : function(){
						console.log("댓글 등록 실패...");
					}
				});//ajax end
				$("#comment_content").val(" ");
				$("#replyBtn").text('댓글 등록');
				$("#taggedNum").val(' ');
				return false;
			}else{
				alert("댓글내용을 입력해야 등록이 가능합니다.");
				return false;
			}
		});//2.end
		
		//3.댓글 수정하기
		$(document).on('click','.communityView_comment_btn>button:nth-child(2)', function(){ //수정버튼 클릭시
			$(this).parent().parent().next().next().children().css("display","block"); //수정창 열리기
			$(this).parent().parent().next().next().children().focus();
			$(this).parent().parent().next().css("display","none");//원래 댓글 숨기기
			$(this).prev().css("display","inline"); //수정취소 버튼 나오기
			$(this).css("display","none"); //수정버튼 숨기기
		});
		$(document).on('click','.communityView_comment_btn>button:nth-child(1)', function(){ //수정취소 버튼 클릭시
			$(this).parent().parent().next().next().children().css("display","none"); //수정창 숨기기
			$(this).parent().parent().next().css("display","block"); //원래 댓글 나오기
			$(this).next().css("display","inline"); //수정버튼 나오기
			$(this).css("display","none"); //수정취소 버튼 숨기기
		});
		$(document).on('submit','.replyEditForm', function(){
			var url = "/home/replyEdit";
			var params = $(this).serialize();
			alert(url);
			$.ajax({
				url : url,
				data : params,
				type : "POST",
				success : function(result){
					replyList();
				}, error : function(){
					console.log("댓글 수정 실패...");
				}
			});
			return false;
		});
		
		//4. 댓글 삭제하기
		$(document).on('click','.communityView_comment_btn>button:nth-child(3)', function(){ //삭제버튼 클릭시
			if(confirm('해당 댓글을 삭제하시겠습니까?')){
				var url = '/home/replyDel';
				var num = $(this).parent().parent().next().next().children().children().eq(0).val();
				var no = $(this).parent().parent().next().next().children().children().eq(1).val();
				var userid = $(this).parent().parent().next().next().children().children().eq(2).val();
				var params = 'num='+num+"&userid="+userid+"&no="+no;
				alert(params)
		
				$.ajax({
					url : url,
					data : params,
					type : "post",
					success : function(result){
						replyList();
					}, error : function(){
						console.log("댓글 삭제 실패...");
					}
				});
			} //confirm end
		});//4 end
	
		//5. 답글 달기
		$(document).on('click','.communityView_comment_btn>button:nth-child(4)', function(){
			var replyid = $(this).next().val();
			var taggedId = '@'+$(this).next().val()+' ';
			var replyidCnt = taggedId.length;
			var taggedNum = $(this).next().next().val();
			
			$("#taggedNum").val(taggedNum);
			$("#comment_content").val(taggedId);
			alert(taggedId);
			$("#replyBtn").text(replyid+'님에게 답글 달기');
			//아이디뒤에 커서 위치하게 만들기 위한 제이쿼리 플러그인
			$.fn.setCursorPosition = function( pos )
			{
			  this.each( function( index, elem ) {
			    if( elem.setSelectionRange ) {
			      elem.setSelectionRange(pos, pos);
			    } else if( elem.createTextRange ) {
			      var range = elem.createTextRange();
			      range.collapse(true);
			      range.moveEnd('character', pos);
			      range.moveStart('character', pos);
			      range.select();
			    }
			  });
			  return this;
			};
			$("#comment_content").focus().setCursorPosition(replyidCnt); // 아이디 뒤에 커서 위치시키기
			alert(replyidCnt+"!!");
			$("#comment_content").keyup(function(e){ //답글기능 해제시키기
				if(e.keyCode==8 || e.keyCode == 46){	//backspace or delte 키
					if($(this).val().length<replyidCnt && $(this).val().length>0) {
						if(confirm("답글 달기를 취소하시겠습니까?")){
							$(this).val(" ");
							$("#replyBtn").text('댓글 등록');
							$("#taggedNum").val(' ');
						}
					}
				}	
			});
		});
		
		$(document).on('click','.report', function(){
			//값 가져오기
			var reportUserid = $(this).prev().prev().val();
			$("#reportUserid").val(reportUserid);
			$('.reportpopup').css('display','block');
			$('body').css('overflow','hidden');
		});
		$('.popupClose').click(function(){
			$('.reportpopup').css('display','none');
			$('body').css('overflow','auto');
		});
	});
</script>
<div class="wrap">
	<div class="content">
		<p class="m_title">커뮤니티</p>
		<ul class="content_menu" style="margin:10px 0;">
			<li><a class="on">${vo.category}</a></li>
		</ul>
		<a href="#" class="reportBtn" style="float:left;">
			<img title="신고" alt="신고" src="<%=request.getContextPath()%>/img/comm/ico_report.png">
		</a>
		<div style="text-align:right; border-bottom: 1px solid #13a89e; padding-bottom:10px; margin-bottom:10px;">
			<a class="white aTagReset" href="#">이전글</a>
			<a class="white aTagReset" href="#">다음글</a>
			<a class="white aTagReset" href="communityList">전체목록</a>
		</div>
		<ul>
			<li>
				<span class="s_title">${vo.subject}</span>
				<c:if test="${vo.userid==logId}">
					<a href="">수정</a>
					<a href="javascript:communityDel()">삭제</a>
				</c:if>
			</li>
			<li>
				<div class="communityView_user_porfile">
					<img src="<%=request.getContextPath()%>/img/comm/sample.png"/>
				</div>
				<div class="communityView_user_detail">
					${vo.userid}<br>
					${vo.writedate}
				</div>
				<div class="communityView_user_detail">	
					조회수 : ${vo.hit}<br>
					댓글수 : ${replyCnt}
				</div>
			</li>
			
			<li class="communityView_content">
				${vo.content}
			</li>
		</ul>
		<!-- 댓글 -->
		<p class="d_title" style="margin:15px 0; padding-bottom:10px; border-bottom:1px solid #eee">댓글 ${replyCnt}</p>
		<ul id="replyList">
			<!-- 댓글이 들어올 부분 -->
		</ul>
		<p class="d_title"style="margin:15px 0;padding-bottom:10px; border-bottom:1px solid #eee">댓글 쓰기</p>
		<form method="post" id="commentForm">
			<ul>
				<li style=" min-height:50px; margin:0 auto;">
					<input type="hidden" name="no" value="${vo.no}"> <!-- 가져갈 원글번호 -->
					<input id="taggedNum" type="hidden" name="taggedNum" value=""> <!-- 답글 달때 원댓글 번호 -->
					<textarea id="comment_content" name="content" style="height: 150px; width: 100%"></textarea>
					<button id="replyBtn" class="q_btn green">댓글 등록</button>
					${logStatus}
				</li>
			</ul>
		</form>
	</div>
</div>
<!--  팝업창///////////////////////////////////////////// -->
<div class="pup_wrap reportpopup">
	<div class="pup_form">
		<div class="pup_head">신고 정보</div>
		<div class="pup_body">
			<div class="pup_list">
				<ul>
					<li><div>신고 ID</div><input id="reportUserid" type="text" name="userid" readonly></li>
					<li><div>신고자 ID</div> <input type="text" name="reportid" value="${logId}" readonly> </li>
					<li>
						<div>분류</div> <input type="text" name="category" readonly>
						<input type="hidden" name="no">
					</li>
					<li><div>신고 사유</div>
						<select>
							<option disabled selected hidden>신고사유를 선택하세요</option>
							<option>홍보,광고</option>
							<option>음란</option>
							<option>욕설</option>
							<option>기타</option>
						</select>
					</li>
					<li><div>상세내용</div> <textarea rows="5" name="reportcontent"></textarea> </li>
				</ul>
			</div>
		</div>
		<div class="pup_bottom">
			<a class="btn_cancel popupClose">닫기</a>
			<a class="btn_save">접수</a>
		</div>
		<a class="pup_btn_close popupClose">닫기</a>
	</div>
</div>