"use strict"


class EXAMPLE.ExampleScene extends GAME.Scene

  constructor: () ->
    super()
    this._fillScene()

  _fillScene: () ->
    this.stage.interactive = true

    sprite = new GAME.Object3("images/gb.png")

    sprite.sprite.position.x = 100
    sprite.sprite.position.y = 100

    sprite.sprite.interactive = true
    sprite.sprite.buttonMode = true
    sprite.sprite.mousedown = () ->
      alert "example scene"

    this.stage.addChild(sprite.sprite)
