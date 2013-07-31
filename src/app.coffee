setUpEarth = () ->
  google.earth.createInstance 'map3d', initCB, failureCB

initCB = (instance) ->
  window.google_earth = instance;
  window.google_earth.getWindow().setVisibility(true);

failureCB = (errorCode) ->
  console.log errorCode

class Earth
  setViewTo: (location) ->
    console.log "Hey we're at #{location.name}"
    if location.lat
      console.log location.lat

google.setOnLoadCallback setUpEarth

#####################

run_slide_show = () ->
  earth = new Earth
  $scope = {}

  pan_through_schools = (schools) ->
    console.log "IMMA LOOP THROUGH DEM SCHOOLS #{schools}"

    iterator = 0
    length = schools.length

    callback = ->
      clearInterval timer if iterator is length - 1
      iterator++
      return

    timer = setInterval callback, 1000

  pan_through_states = (states) ->
    console.log "IMMA LOOP THROUGH DEM STATES #{states}"

    iterator = 0
    length = states.length

    callback = ->
      state = states[iterator]
      earth.setViewTo state
      $scope.title = state
      $scope.highlighted = null
      pan_through_schools state.schools
      clearInterval timer if iterator is length - 1
      iterator++
      return

    timer = setInterval callback, 10000

  schools_in_states = [
    { 
      name: "Victoria"
      schools: [
        {
          name: "Camberwell Grammar"
          logo: "http://catholicschoolsguide.com.au/wp-content/uploads/xavier-college1.jpg"
          lat: "-37.8169075"
          lng: "145.0682967"
        },
        {
          name: "Xavier College"
          logo: "http://catholicschoolsguide.com.au/wp-content/uploads/xavier-college1.jpg"
          lat: "-37.812269"
          lng: "145.031685"
        },
      ]
    },
    {
      name: "Western Australia",
      schools : [
        {
          name: "Mazenod College"
          logo: "http://catholicschoolsguide.com.au/wp-content/uploads/xavier-college1.jpg"
        },
        {
          name: "Perth College"
          logo: "http://catholicschoolsguide.com.au/wp-content/uploads/xavier-college1.jpg"
        },
      ]
    }
  ]

  pan_through_states schools_in_states


  setTimeout run_slide_show, 1000 * 30 # 30 Seconds


run_slide_show()
