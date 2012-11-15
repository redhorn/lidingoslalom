
$(document).bind("mobileinit", function(){
  $.extend($.mobile, {
    defaultPageTransition: 'slide'
  });
});

$(document).bind("pageinit", function(){
	$("a.refresh-page").bind("click", function() {
		$.mobile.changePage($(this).attr("href"), {
			reloadPage: true
		});
		return false;
	})
});