"use strict"

screenElement = document.getElementById("screen")
game = new GAME.Game(screenElement)
game.run()

assetManager = new GAME.AssetManager(GAME.Assets)

assetManager.onload = (loaded, all) ->
  console.log("loaded " + loaded + " of " + all)

  if loaded == all
    game.input.addHandler(new EXAMPLE.ExampleInputHandler())
    console.log("input handler initialized")
    hud = new GAME.HUDMenu(game, document.getElementsByClassName('hud')[0])



assetManager.load()