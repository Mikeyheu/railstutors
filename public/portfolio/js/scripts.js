$(document).ready(function(){




// GLOBAL VARIABLE HERE MIKE BE CAREFUL!!!
dropped_on_menu = false;
appended = false;

 // WINDOW RESIZE 

 function resize() {

 	var primary_nav_height = $('#primary-navbar').height();
 	var secondary_nav_height = $('#secondary-navbar').height();
 	var tertiary_nav_height = $('#tertiary-navbar').height();
 	var left_menu_pos = $('.left-panel').position().left;
 	$('.content').height($(window).height() - primary_nav_height);
 	$('.right-inner').css({
 		height: $(window).height() - primary_nav_height - secondary_nav_height - tertiary_nav_height - 20
 	});
 	$('#panes').css({
 		height: $(window).height() - primary_nav_height - secondary_nav_height
 	});
 	$('.right-panel').css({
 		left: left_menu_pos + $('.left-panel').width(),
 		width: $(window).width() - $('.left-panel').width() - left_menu_pos
 	});
 }

 resize();

 $(window).on("resize", function(){
 	resize();
 });

  // TOP NAV CARET  

  $('#caret').toggle(function(){
  	$('.left-panel').css({ left:-220 });
  	$('#caret .icon').removeClass('caret-left').addClass('caret-right');
  	resize();
  }, function(){
  	$('#caret .icon').removeClass('caret-right').addClass('caret-left');
  	$('.left-panel').css({ left:0 });
  	resize();
  });

  // LEFT MENU PANEL 

  $('ol.sortable').nestedSortable({
  	disableNesting: 'no-nest',
  	forcePlaceholderSize: true,
  	handle: 'div',
  	helper:	'clone',
  	items: 'li',
  	maxLevels: 2,
  	opacity: .6,
  	placeholder: 'placeholder',
  	revert: 250,
  	tabSize: 25,
  	tolerance: 'pointer',
  	toleranceElement: '> div'
  });

  $('li.folder ol').hide();

  $('li.folder div:first-child').toggle(function(){
  	$( this ).find('i').addClass("open");
  	$(this).parent().find('ol').show();
  }, function(){
  	console.log("hide");
  	$( this ).find('i').removeClass("open");
  	$(this).parent().find('ol').hide();
  });

	// Stop propagation if text is clicked
	$('#page-menu li div a').on("click", function(e) {
		e.preventDefault;
		e.stopPropagation();
		$('#page-menu li div').removeClass("active");
		$(this).parent().addClass("active");
	});

	// DRAGGIN BEHAVIOR TEST FOR THUMBS INTO LEFT MENU

	$( ".dropzone" ).droppable({
		hoverClass: "menu-hover",
		tolerance: "pointer",
		accept: '.drop_allowed',
		over: function(event, ui) {
		// var offset = $('.ui-sortable-helper').offset();

		// console.log('top: ' + offset.left + ' left: ' + offset.top);
		// $('.ui-sortable-helper').appendTo('#panes');
		// $('.ui-sortable-helper').css({
		// 	left: offset.left,
		// 	top: offset.top
		// })


},
drop: function( event, ui ) {
	dropped_on_menu = true;
}
});

	// Dragging panes
	westLayout = $('#panes').layout({
				minSize:				50	// ALL panes
				,	center__paneSelector:	".west-center"
				,	south__paneSelector:	".west-south"
				,	south__size:			100
			});

// RESIZNG TEXT OBJECT


$('.right-inner').on("click", function(e){
	var target = $(e.target);

	if (!target.hasClass('selected-object')) {
		removeBox();
	}

});



function removeBox() {

	$('#tertiary-navbar').addClass('hide');
	resize();


	$('.ui-resizable-handle').remove();
	$('.lines').remove();

	$('.selected-object').css({
		top:$('#box').css('top'),
		left:$('#box').css('left'),
		width:$('#box').css('width'),
		height:$('#box').css('height')
	});

	$('.selected-object').unwrap('<div id="box" class="ui-widget-content"></div>');
	$('.selected-object').removeClass('selected-object');

}

// CLICK TO ADD BOUNDING BOX

$('.element').on("mousedown", function(e){

	if($(this).hasClass("selected-object")){
		return;
	}

	removeBox();

	$('#tertiary-navbar').removeClass('hide');
	resize();

	var inner = $(this);

	$(this).addClass('selected-object');

	$('.element').removeClass('z-top');




	inner.wrap('<div id="box" class="ui-widget-content"></div>');
	$('#box').css({
		top:inner.css('top'),
		left:inner.css('left'),
		width:inner.css('width'),
		height:inner.css('height')
	});

	inner.css({
		top:0,
		left:0,
		width:'100%',
		height:'100%'
	});

	$('<div class="lines hline"></div><div class="lines hline bottom"></div><div class="lines vline"></div><div class="lines vline right"></div><div id="n" class="ui-resizable-handle handle ui-resizable-n"></div><div id="ne" class="ui-resizable-handle handle ui-resizable-ne"></div><div id="nw" class="ui-resizable-handle handle ui-resizable-nw"></div><div id="e" class="ui-resizable-handle handle ui-resizable-e"></div><div id="s" class="ui-resizable-handle handle ui-resizable-s"></div><div id="se" class="ui-resizable-handle handle ui-resizable-se"></div><div id="sw" class="ui-resizable-handle handle ui-resizable-sw"></div><div id="w" class="ui-resizable-handle handle ui-resizable-w"></div>').insertAfter(inner);

	$('#x').val(parseInt($('#box').css('left')));
	$('#y').val(parseInt($('#box').css('top')));
	$('#width').val(parseInt($('#box').css('width')));
	$('#height').val(parseInt($('#box').css('height')));

	$("#box").resizable({ 
		stop: function(e, ui) {
			var width = ui.size.width;
			var height = ui.size.height;
			var x = ui.position.left;
			var y = ui.position.top;
			$('#x').val(x);
			$('#y').val(y);
			$('#width').val(width);
			$('#height').val(height);
		},
		handles: {
			n: '#n', 
			e: '#e', 
			s: '#s', 
			w: '#w', 
			ne: '#ne', 
			se: '#se', 
			nw: '#nw', 
			sw: '#sw'}
		}).draggable({
			stop: function(e, ui) {
				var x = ui.position.left;
				var y = ui.position.top;
				$('#x').val(x);
				$('#y').val(y);
			}
		});

// Refactor this ganky z-index code!!!
$(this).addClass('z-top');
$('.ui-resizable-handle').addClass('z-top');
$('.lines').addClass('z-top');



	// KEYPRESS
	var element = $('#box');

	$(document).on('keydown', function(e){
		switch (e.which) {
			case 37:  // left arrow
			if (e.shiftKey) {
				element.css('left', parseInt(element.css('left')) - 10);
			} else {
				element.css('left', parseInt(element.css('left')) - 1);
			}
			$('#x').val(parseInt($('#box').css('left')));
			$('#y').val(parseInt($('#box').css('top')));
			$('#width').val(parseInt($('#box').css('width')));
			$('#height').val(parseInt($('#box').css('height')));
			break;
			case 38:  // up arrow
			if (e.shiftKey) {
				element.css('top', parseInt(element.css('top')) - 10);
			} else {
				element.css('top', parseInt(element.css('top')) - 1);
			}
			$('#x').val(parseInt($('#box').css('left')));
			$('#y').val(parseInt($('#box').css('top')));
			$('#width').val(parseInt($('#box').css('width')));
			$('#height').val(parseInt($('#box').css('height')));
			break;
			case 39:  // right arrow
			if (e.shiftKey) {
				element.css('left', parseInt(element.css('left')) + 10);
			} else {
				element.css('left', parseInt(element.css('left')) + 1);

			}
			$('#x').val(parseInt($('#box').css('left')));
			$('#y').val(parseInt($('#box').css('top')));
			$('#width').val(parseInt($('#box').css('width')));
			$('#height').val(parseInt($('#box').css('height')));
			break;
			case 40:  // down arrow
			if (e.shiftKey) {
				element.css('top', parseInt(element.css('top')) + 10);
			} else {
				element.css('top', parseInt(element.css('top')) + 1);
			}
			$('#x').val(parseInt($('#box').css('left')));
			$('#y').val(parseInt($('#box').css('top')));
			$('#width').val(parseInt($('#box').css('width')));
			$('#height').val(parseInt($('#box').css('height')));
			break;
		}

		$('#update').on("click", function(){
			$('#box').css({
				left: parseInt($('#x').val()),
				top: parseInt($('#y').val()),
				width: $('#width').val(),
				height: $('#height').val()
			});
		});


	});

});

$('.element').disableSelection();


// PORTFOLIO MULTISORT JS
// $('#sortable').sortable({
// 	stop: function(event, ui) {
// 			$('#sortable').sortable('cancel');
// 		}
// });

$('#sortable').multisortable({
	placeholder: "mh-placeholder",
	helper: 'clone',
	appendTo: '#content',
	scrollSensitivity:70,
	forcePlaceholderSize: true,
	tolerance: "pointer",
	start: function(event, ui) {


		dropped_on_menu = false;
		ui.placeholder.height(120);
		ui.placeholder.width(120);
		var foo = $('<span id="thumb-num" class="badge badge-important"></span>');
		foo.html($('.selected:not(:hidden)').length);
		foo.css ({
			position:'absolute',
			right:'10px',
			bottom:'10px'
		});
		ui.helper.find('div').css({
			opacity:.6
		});
		ui.helper.append(foo);
		//$('#sortable').find('li:hidden').show();
			//$('#sortable').find('li.selected.ui-sortable-helper').show();
		},
		sort: function(event, ui){
		},
		stop: function(event, ui) {
			$('#sortable').find('li.selected').show();
			$('#sortable').find('li.selected div').css({
				opacity:1
			});
			$('#thumb-num').remove();
			

			if(dropped_on_menu == true) {
				$('#sortable').sortable('cancel');
				//$(this).sortable("cancel");
				dropped_on_menu == false;
			}

			appended = false
			
		}

	});

// Click off thumbnail to deselect

$('.content').on("click", function(event){

	if (event.target.nodeName != 'IMG') {
		$('.thumb_grid li').removeClass('selected');
	}

});

// $("img").mousedown(function(){
//     return false;
// });




});