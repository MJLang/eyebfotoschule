# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('#courseIndex').sortable
    axis: 'y'
    handle: '.handle'
    update: ->
      $.post($(this).data('updateurl'), $(this).sortable('serialize'))

jQuery ->
  $(document).on 'click', '.tile', (e) ->
    $("#coursesection").ScrollTo();