"use strict"


class EXAMPLE.ExampleScene extends GAME.Scene

  camera: null
  objects: null

  constructor: () ->
    super()

    this._fillScene()


  _createCamera: () ->
    camera = new PROJECTION.Camera()
    return camera

  _fillScene: () ->
    this.stage.interactive = true

    this.camera = this._createCamera()

    sprite = new GAME.Object3("images/gb.png")

    sprite.setPosition([400, 200, -2])

    sprite.sprite.interactive = true
    sprite.sprite.buttonMode = true
    sprite.sprite.mousedown = () ->
      alert "example scene"

    this.objects = [ sprite ]

    this.stage.addChild(sprite.sprite)


  update: () ->
    for o in this.objects
      o.update(this.camera)

