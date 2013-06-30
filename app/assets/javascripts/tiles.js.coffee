jQuery ->
  $('.tile .textblock').flexVerticalCenter();
  $('.tile .course').hover (->
      $(this).find('.information').stop().fadeTo('slow', 1);
    ),
    ->
      $(this).find('.information').stop().fadeTo('slow', 0);
