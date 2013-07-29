setUpEarth = () ->
  google.earth.createInstance 'map3d', initCB, failureCB

initCB = (instance) ->
  window.google_earth = instance;
  window.google_earth.getWindow().setVisibility(true);

failureCB = (errorCode) ->
  console.log errorCode

class Earth
  setViewTo: (location) ->
    if location.name
      console.log "Hey we're at #{location.name}"
    else
      console.log "Yo here's #{location}"

google.setOnLoadCallback setUpEarth

#####################



run_slide_show = () ->
  earth = new Earth
  $scope = {}

  pan_through_schools = (schools) ->
    console.log "IMMA LOOP THROUGH DEM SCHOOLS #{schools}"

    doSetTimeout = (school, time) ->
      setTimeout (school) ->
        earth.setViewTo school
      , time

    time = 5000
    for school in schools
      doSetTimeout school, time
      time += 5000

    

  schools_in_states =
    "Victoria": [
      {
        name: "Camberwell Grammar"
        logo: "http://catholicschoolsguide.com.au/wp-content/uploads/xavier-college1.jpg"
      },
      {
        name: "Xavier College"
        logo: "http://catholicschoolsguide.com.au/wp-content/uploads/xavier-college1.jpg"
      },
    ]

  for state, schools of schools_in_states
    earth.setViewTo state
    $scope.title = state
    $scope.highlighted = null
    pan_through_schools schools

  setTimeout run_slide_show, 1000 * 30 # 30 Seconds


run_slide_show()
