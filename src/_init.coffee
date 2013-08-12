setUpEarth = () ->
  google.earth.createInstance 'map3d', initCB, failureCB

initCB = (instance) ->
  window.ge = instance;
  ge.getWindow().setVisibility(true);

failureCB = (errorCode) ->
  console.log errorCode

google.setOnLoadCallback setUpEarth
