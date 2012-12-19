
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
	});
	//TODO: Also change appearance of button
	$("a.reset-btn").bind("click", function() {
		$($(this).attr("data-target")).find("input[type=checkbox]").each(function(){
			$(this).removeAttr("checked");
		});
	});
});