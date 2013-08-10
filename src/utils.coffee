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
    window.earth.setViewTo school
    return

  pan_through_array schools, callback, timeout

pan_through_states = (states) ->

  timeout = 20 * 1000
  callback = (state) ->
    panToState(state)
    if aussieState state
      setTimeout panToAustralia, (statePanTime state)

  pan_through_array states, callback, timeout

panToAustralia = () ->
  australia = 
    name: "Australia"
    range: 4700000
    lng: 135.307
    lat: -26.91234
  window.earth.setViewTo australia

panToState = (state) ->
  window.earth.setViewTo state
  pan_through_schools state.schools
  return

calculateTimeout = (array) ->
  # First, we need to find out how many states we have.
  total = array.length 

  # Then, since we pan to Australia every time we go to an Australian school, we have to double that
  total = total * 2

  # Less the two times we're in Asia
  total = total - 2

  # Now we need to add a pan for each school in our states
  for state in array 
    total += state.schools.length

  # Fabulous, now how long will we wait at each place?
  panTime = 1000 * 5 # 5 Seconds

  timeout = total * panTime

statePanTime = (state) ->
  (state.schools.length + 1) * 5000 # 5 Seconds per school

aussieState = (state) ->
  state is not "China" or "South East Asia"
