class Earth
  constructor: (scope) ->
    @scope = scope
  setViewTo: (location) ->
    @scope.title = location.name
    @scope.$apply()
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

    if location.logo
      @scope.selectedSchool = location
      @scope.$apply()
    if location.schools
      @scope.schools = location.schools
      @scope.$apply()
    if location.name == "Australia"
      @scope.schools = []
      @scope.$apply()
