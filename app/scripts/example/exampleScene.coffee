"use strict"


class EXAMPLE.ExampleScene extends GAME.Scene

  constructor: () ->
    super()
    this._fillScene()

  _fillScene: () ->
    this.stage.interactive = true

    texture = PIXI.Texture.fromImage('images/gb.png')
    sprite = new PIXI.Sprite(texture)

    sprite.position.x = 100
    sprite.position.y = 100

    sprite.interactive = true
    sprite.buttonMode = true
    sprite.mousedown = () ->
      alert "example scene"

    this.stage.addChild(sprite)
