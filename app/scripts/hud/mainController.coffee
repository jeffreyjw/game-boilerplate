"use strict"

class GAME.HUDMainCtrl extends GAME.HUDComponent

  constructor: (app) ->
    app.controller("MainCtrl", [ "$scope", "HUDService", ($scope, HUDService) ->

      $scope.service = HUDService

      $scope.click = () ->
        alert "button was clicked"

      $scope.init = () ->

        $scope.service.addEventListener("notifyChange", () ->
          $scope.$digest()
        )

      $scope.init()
    ])