"use strict"


class GAME.Loader extends GAME.Scene

  text: null
  game: null

  constructor: (game) ->
    super(0x000000)

    this.game = game

    text = new PIXI.Text("", {
      font: "bold 50px Arial"
      fill: "white"
    })
    this.stage.addChild(text)
    text.position.x = 0
    text.position.y = 0
    text.anchor.x = 0
    text.anchor.y = 0

    this.text = text

    this._startPreloading()


  _startPreloading: () ->

    config = {
      "texture": [
        "images/loading.png"
      ]
    }
    preloader = new GAME.AssetManager(config)
    preloader.onload = (loaded, all) =>
      if loaded == all
        tex = preloader.get(config.texture[0])
        sprite = new PIXI.Sprite(tex)
        sprite.position.x = 400
        sprite.position.y = 200
        sprite.anchor.x = 0.5
        sprite.anchor.y = 0.5
        this.stage.addChild(sprite)

        setTimeout(
          () =>
            this._startLoading()
          , 1000
        )


    preloader.load()


  _startLoading: () ->
    loader = new GAME.AssetManager(GAME.Assets)
    loader.onload = (loaded, all) =>
      this.text.setText(loaded + "/" + all)

      if loaded == all
        hud = new GAME.HUDMenu(this.game, document.getElementsByClassName('hud')[0])
        this.game.setScene(new EXAMPLE.ExampleScene())
        this.game.input.addHandler(new EXAMPLE.ExampleInputHandler())


    loader.load()
