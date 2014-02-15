"use strict"

class GAME.HUDMainCtrl

  constructor: (app) ->
    app.controller("MainCtrl", [ "$scope", "HUDService", ($scope, HUDService) ->

      $scope.click = () ->
        alert "button was clicked"

      $scope.init = () ->
        return

      $scope.init()
    ])