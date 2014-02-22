"use strict"


class GAME.StopEventPropagation extends GAME.HUDComponent

  constructor: (app) ->
    app.directive('stopEventPropagation', () ->
      return {
        restrict: 'E'
        template: '<div ng-transclude></div>',
        transclude: true
        link: (scope, element, attrs) ->
          element[0].addEventListener('mousedown', (e) ->
            e.cancelBubble = true
            e.stopPropagation()
          )
      }
    )
