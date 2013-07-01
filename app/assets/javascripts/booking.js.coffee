jQuery ->
  $("#booking_training_attributes_date").datepicker({
      dateFormat: "dd/mm/yy",
      altFormat: "dd-mm-yyyy"
    });
    
jQuery ->
  $(document).on "click", "#submitBooking", (e) ->
    $(this).closest("#bookingsection").css('opacity', '.5')
    $(this).closest('form').find('input').each ->
      if $(this).val().length == 0
        unless $(this).prop('autocomplete') == 'off'
          e.preventDefault()
          $(this).css('border', '1px solid red')
          $(this).closest("#bookingsection").css('opacity', '1.0')
      else 
        $(this).css('border', '1px solid #ccc')