$(document).ready(function(){
	$(function() {
		var i;
		$('.sub_menu li').hover(function() {
			i = $('.sub_menu li').index(this);
			$('.main_menu li').eq(i).children().addClass('on');
		}, function() {
			$('.main_menu li').eq(i).children().removeClass('on');
		});
		
		$('.btn_chat').click(function() {
			if($('.chat_window').hasClass('on')==true){
				$('.chat_window').removeClass('on');
			}else{
				$('.chat_window').addClass('on');
			}
		});
		
	});
});
