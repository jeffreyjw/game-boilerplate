"use strict"

class EXAMPLE.ExampleInputHandler extends GAME.InputHandler

  run: (game, keyboard) ->
    if (keyboard.isKeyPressed(GAMEKBD.Keys.ARROW_UP))
      console.log("arrow up is pressed")

    game.getScene().update()