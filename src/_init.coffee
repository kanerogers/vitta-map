setUpEarth = () ->
  google.earth.createInstance 'map3d', initCB, failureCB

initCB = (instance) ->
  window.ge = instance;
  ge.getWindow().setVisibility(true);

failureCB = (errorCode) ->
  console.log errorCode

class Earth
  setViewTo: (location) ->
    document.getElementById("school-title").innerHTML = location.name
    console.log "Hey we're at #{location.name}"
    if location.lat
      console.log location.lat

      # Get the current view.
      lookAt = ge.getView().copyAsLookAt(ge.ALTITUDE_RELATIVE_TO_GROUND)
      lookAt.setRange(location.range || 564.00);

       # Set new latitude and longitude values.
      lookAt.setLatitude(location.lat)
      lookAt.setLongitude(location.lng)
      ge.getView().setAbstractView(lookAt)

google.setOnLoadCallback setUpEarth
