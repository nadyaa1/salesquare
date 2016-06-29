


$(".rating").rating({
  showCaption: false,
  showClear: false,

});

$(document).on('ready', function(){
  $('.rating-static').rating({ displayOnly: true, step: 0.5 });
});
