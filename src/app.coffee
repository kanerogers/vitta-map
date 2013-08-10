run_slide_show = (earth) ->
  pan_through_states schoolsInStates
  timeout = calculateTimeout schoolsInStates
  setTimeout run_slide_show, 1000 * 45 # 45 Seconds

MapCtrl = ($scope) ->
  window.earth = new Earth $scope
  run_slide_show earth 

  # Scope Functions
  $scope.getClass = (school) ->
    if school == $scope.selectedSchool
      return "logo-colour"
    else
      return "logo-grey"


