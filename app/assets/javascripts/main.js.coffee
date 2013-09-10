# Create 'app' angular application (module)
@app = angular.module("app", ["ngResource","ui.compat"])

app.run ($rootScope, $state, $stateParams) ->
  $rootScope.$debugMode = "on" # "off"
  $rootScope.$state = $state
  $rootScope.$stateParams = $stateParams

app.config ($locationProvider) ->
  $locationProvider.html5Mode true