<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/yun.css">
<script>
	//글삭제
	function communityDel(){
		if(confirm('해당 글을 삭제하나요?')){
			location.href="communityDel?no=${vo.no}";
		}
	}
	//1. 댓글 목록 불러오기
	function replyList(){
		var url = "/home/replyList";
		var params = "no=${vo.no}";
		
		$.ajax({
			url : url,
			data : params,
			success : function(result){
				var $result = $(result);
				var tag = "<li>";
				
				$result.each(function(idx, obj){
					tag += "<div class='communityView_user_porfile'>";
					tag += '<img src="<%=request.getContextPath()%>/img/comm/sample.png"/>';
					tag += '</div>'
					tag += '<div class="communityView_comment_user_detail">';
					tag += obj.userid+'<br>';
					tag += obj.writedate + '</div>';
					tag += '<div class="communityView_comment_btn">';
					
					if(obj.userid == '${logId}'){
						tag += '<form method="post">' //숮
						tag += '<button class="white">수정</button>'
						tag += '<button class="white" href="">삭제</button>'
					}
					tag += '<a href="">답글</a>'
					tag += '<a href="">신고</a></div></li>'
					tag += '<li class="communityView_comment_content">'
					tag += obj.content+'</li>';
					//댓글 수정폼
					if(obj.userid=="${logId}"){
						tag += "<li class='communityView_comment_content' style='display:none; background-color:#eee;'><textarea style='width: 100%; border:none; background-color:#eee;'>"+obj.content+"</textarea></li>";
					}
				});
				tag += '</li>';
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
						$("#comment_content").val("");
						replyList();
						console.log("댓글등록 성공!!");
					},error : function(){
						console.log("댓글 등록 실패...");
					}
				});//ajax end
			}else{
				alert("댓글내용을 입력해야 등록이 가능합니다.");
			}
		});//2.end
		
		//3.댓글 수정하기
		$(document).on('submit','#')
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
			
		</ul>
		<p class="d_title"style="margin:15px 0;padding-bottom:10px; border-bottom:1px solid #eee">댓글 쓰기</p>
		<form method="post" id="commentForm">
			<ul>
				<li style="width:600px; min-height:50px; margin:0 auto;">
					<input type="hidden" name="replyid" value="${vo.userid}">
					<input type="hidden" name="no" value="${vo.no}">
					<input type="text" name="userid" value="${logId}" readonly style="width:100%">
					<textarea id="comment_content" name="content" style="height: 150px; width: 100%"></textarea>
					<button id="replyBtn" class="q_btn green">댓글 등록</button>
				</li>
			</ul>
		</form>
	</div>
</div>