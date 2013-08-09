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
    setTimeout panToAustralia, 15 * 1000 # 30 Seconds

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
