$(document).ready(function(){

	function resize() {
		var left_menu_pos = $('.left-content').position().left;
		var header_height = $('.nav').height() + $('.subnav').height();
		$('.content').height($(window).height() - header_height);
		$('.right-content').css({
			left: left_menu_pos + $('.left-content').width(),
			width: $(window).width() - $('.left-content').width() - left_menu_pos
		});
	}

	resize();

  $(window).on("resize", function(){
  	resize();
  });

  // $('.button_toggle_left_menu').toggle(function(){
  // 	$('.left-content').css({ left:-220 });
  // 	resize();
  // }, function(){
  // 	$('.left-content').css({ left:0 });
  // 	resize();
  // });

$('.button_toggle_left_menu').toggle(function(){
  	$('.left-content').animate({
  		left: -220
  	}, 1000, function(){
  		resize();
  	})
  	
  }, function(){
  	$('.left-content').css({ left:0 });
  	resize();
  });

});