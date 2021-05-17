function likeInsert(no, category, userid, obj){
	$.ajax({
		url : "/home/likemarkInsert",
		data : 'no='+no+'&category='+category+'&userid='+userid,
		success : function(result){
			alert('찜등록 성공')
			$(obj).addClass("on");
		}, error : function(){
			alert('찜 등록 실패')
		}
	});
}
		
		
function likeDelete(no, userid, obj){
	$.ajax({
		url : "/home/likemarkDelete",
		data : "no="+no+"&userid="+userid,
		success : function(){
			alert('찜 삭제가 되었습니다.');
			$(obj).removeClass('on');
		}, error : function(){
			console.log("찜 삭제 실패..")
		}
	});
}