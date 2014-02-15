"use strict"

screenElement = document.getElementById("screen")
game = new GAME.Game(screenElement)

game.input.addHandler(new EXAMPLE.ExampleInputHandler())

game.run()
