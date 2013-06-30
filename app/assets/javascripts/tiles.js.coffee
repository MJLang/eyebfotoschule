jQuery ->
  $('.tile .textblock').flexVerticalCenter();
  $('.tile .course').hover (->
      $(this).find('.information').fadeToggle();
    ),
    ->
      $(this).find('.information').fadeToggle();