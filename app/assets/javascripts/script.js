
$(document).bind("mobileinit", function(){
  $.extend($.mobile, {
    defaultPageTransition: 'slide'
  });
});

$(document).bind("pageinit", function(){
	$(".back-button").bind("click", function(){
		history.back();
	});
});