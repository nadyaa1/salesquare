
$(".rating").rating({
  starCaptions: {
    0.5: 'wouldn\'t make my enemy wear this',
    1: 'soooo ugly',
    1.5: 'the creator should change jobs',
    2: 'meeeehh',
    2.5: 'It is okay',
    3: 'heey not bad',
    3.5: 'Cool ',
    4: 'This thing is awesome',
    4.5: 'I will fall in love the person who wears this',
    5: 'Wear this and ill take you home for the night'
  }
});

$(document).on('ready', function(){
  $('.rating-static').rating({ displayOnly: true, step: 0.5 });
});
