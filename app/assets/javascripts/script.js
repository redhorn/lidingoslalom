
console.log($(document));
$(document).bind("mobileinit", function(){
  $.extend($.mobile, {
    defaultPageTransition: 'slide'
  });
  console.log("vafan liksom");
});