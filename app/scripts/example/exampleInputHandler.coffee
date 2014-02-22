"use strict"

class EXAMPLE.ExampleInputHandler extends GAME.InputHandler

  run: (game, keyboard) ->
    if (keyboard.isKeyPressed(GAMEKBD.Keys.ARROW_UP))
      console.log("arrow up is pressed")

    earth = game.getScene().objects[1]
    earth.node.rotation[1] += 0.01

    game.getScene().update()