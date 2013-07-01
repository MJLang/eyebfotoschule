# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ($) ->
  $.datepicker.regional["de"] =
    closeText: "Schließen"
    prevText: "&#x3C;Zurück"
    nextText: "Vor&#x3E;"
    currentText: "Heute"
    monthNames: ["Januar", "Februar", "März", "April", "Mai", "Juni", "Juli", "August", "September", "Oktober", "November", "Dezember"]
    monthNamesShort: ["Jan", "Feb", "Mär", "Apr", "Mai", "Jun", "Jul", "Aug", "Sep", "Okt", "Nov", "Dez"]
    dayNames: ["Sonntag", "Montag", "Dienstag", "Mittwoch", "Donnerstag", "Freitag", "Samstag"]
    dayNamesShort: ["So", "Mo", "Di", "Mi", "Do", "Fr", "Sa"]
    dayNamesMin: ["So", "Mo", "Di", "Mi", "Do", "Fr", "Sa"]
    weekHeader: "KW"
    dateFormat: "dd.mm.yy"
    firstDay: 1
    isRTL: false
    showMonthAfterYear: false
    yearSuffix: ""

  $.datepicker.setDefaults $.datepicker.regional["de"]

jQuery ->
  $("#course_date_start_date, #course_date_end_date").datepicker
    dateFormat: "dd/mm/yy"
    altFormat: "dd-mm-yyyy"
    