"use strict"

screenElement = document.getElementById("screen")
game = new GAME.Game(screenElement)
game.run()

game.setScene(new GAME.Loader(game))
