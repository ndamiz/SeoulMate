//찜 등록
function likeInsert(no, category, userid, obj){
	$.ajax({
		url : "/home/likemarkInsert",
		data : 'no='+no+'&category='+category+'&userid='+userid,
		success : function(result){
			alert('찜 목록에 추가되었습니다.')
			$(obj).addClass("on");
			$('.btn_star[value='+no+']').addClass('on');
		}, error : function(){
			alert('찜하기가 실패했습니다. 다시 시도해주세요.')
		}
	});
}
		
// 찜 삭제		
function likeDelete(no, userid, obj){
	$.ajax({
		url : "/home/likemarkDelete",
		data : "no="+no+"&userid="+userid,
		success : function(){
			alert('찜 목록에 삭제되었습니다.');
			$(obj).removeClass('on');
			$('.btn_star[value='+no+']').removeClass('on');
		}, error : function(){
			alert('찜하기 삭제가 실패했습니다. 다시 시도해주세요.')
		}
	});
}

//로그인 후 페이지가 로딩되면 찜한 글 불 들어오기
function likeButtonOn(result){
	for(var i=0; i<result.length; i++){
		if($('.btn_star').val()==result[i]){
		$('.btn_star[value='+result[i]+']').addClass('on');
		}
	}   
}