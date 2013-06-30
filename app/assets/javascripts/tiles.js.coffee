jQuery ->
  $('.tile .textblock').flexVerticalCenter();
  $('.tile').hover (->
      $(this).find('.information').fadeToggle();
    ),
    ->
      $(this).find('.information').fadeToggle();