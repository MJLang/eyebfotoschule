jQuery ->
  $("#new_message #message_name").blur ->
    if $(this).val().length == 0
      $(this).css('border', '1px solid red')
    else 
      $(this).css('border', '1px solid #ccc')
  $("#new_message #message_email").blur ->
    if $(this).val().length == 0
      $(this).css('border', '1px solid red')
    else 
      $(this).css('border', '1px solid #ccc')
  $("#new_message #message_body").blur ->
    if $(this).val().length == 0
      $(this).css('border', '1px solid red')
    else 
      $(this).css('border', '1px solid #ccc')

jQuery ->
  $("#new_message input[name='commit']").on 'click', (e) ->
    if $("#new_message #message_name").val().length == 0 || $("#new_message #message_email").val().length == 0 || $("#new_message #message_body").val().length == 0
      e.preventDefault()
      $("#new_message input[type='text'], #new_message textarea").each ->
        if $(this).val().length == 0
          $(this).css('border', '1px solid red')

