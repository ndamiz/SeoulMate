function likemark(no, category, userid){
			$.ajax({
				url : "/home/likemarkInsert",
				data : 'no='+no+'&category='+category+'&userid='+userid,
				success : function(result){
					alert('찜등록 성공')
				}, error : function(){
					alert('찜 등록 실패')
				}
			});
		}