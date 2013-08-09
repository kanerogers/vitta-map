run_slide_show = () ->
  earth = new Earth
  $scope = {}

  pan_through_array = (array, callback, timeout) ->
    console.log "IMMA LOOP THROUGH DIS ARRAY #{array}"
    iterator = 0
    length = array.length

    timerFunction = ->
      callback array[iterator]
      clearInterval timer if iterator is length - 1
      iterator++
      return

    timer = setInterval timerFunction, timeout

  pan_through_schools = (schools) ->
    timeout = 5000 
    callback = (school) ->
      earth.setViewTo school
      return

    pan_through_array schools, callback, timeout

  pan_through_states = (states) ->
    panToAustralia = () ->
      earth.setViewTo australia

    panToState = (state) ->
      earth.setViewTo state
      $scope.title = state
      $scope.highlighted = null
      pan_through_schools state.schools
      return

    timeout = 20 * 1000
    callback = (state) ->
      panToState(state)
      setTimeout panToAustralia, 15 * 1000 # 30 Seconds

    pan_through_array states, callback, timeout


  schools_in_states = [
    { 
      name: "Victoria"
      range: 1133048
      lng: 144.53876250295943
      lat: -37.96765428547502
      schools: [
        {
          name: "Camberwell Grammar"
          logo: "http://catholicschoolsguide.com.au/wp-content/uploads/xavier-college1.jpg"
          lat: -37.8169075
          lng: 145.0682967
        },
        {
          name: "Xavier College"
          logo: "http://catholicschoolsguide.com.au/wp-content/uploads/xavier-college1.jpg"
          lat: -37.812269
          lng: 145.031685
        },
      ]
    },
    {
      name: "Western Australia"
      range: 2000000
      lat:  -27.6728168
      lng:  121.6283098
      schools : [
        {
          name: "Mazenod College"
          logo: "http://catholicschoolsguide.com.au/wp-content/uploads/xavier-college1.jpg"
          lat:  -32.006682
          lng:  116.038843
        },
        {
          name: "Perth College"
          logo: "http://catholicschoolsguide.com.au/wp-content/uploads/xavier-college1.jpg"
          lat: -31.931425
          lng: 115.875297
        },
      ]
    }
  ]
  australia = 
    name: "Australia"
    range: 4700000
    lng: 135.307
    lat: -26.91234

  pan_through_states schools_in_states


  setTimeout run_slide_show, 1000 * 45 # 30 Seconds


run_slide_show()
