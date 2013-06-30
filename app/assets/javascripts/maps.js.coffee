jQuery ->
  if (typeof google != 'undefined') && $(document).find('#map').length > 0
    position = new google.maps.LatLng(47.564519,7.577352)
    mapOptions = {
      zoom: 16
      center: position
      disableDefaultUI: true
      scrollwheel: false
      mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    map = new google.maps.Map(document.getElementById("map"), mapOptions)
    marker = new google.maps.Marker
      map: map
      draggable: false
      position: position