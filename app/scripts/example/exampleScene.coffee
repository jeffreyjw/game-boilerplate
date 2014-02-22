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

    sun = this._createSun()
    earth = this._createEarth()
    moon = this._createMoon()

    ###sprite.sprite.interactive = true
    sprite.sprite.buttonMode = true
    sprite.sprite.mousedown = () ->
      alert "example scene"###

    this.objects = [ sun, earth, moon ]

    for o in this.objects
      this.stage.addChild(o.sprite)


  _createStellarBody: (img, pos, scale) ->
    body = new GAME.Object3(img)
    body.setPosition(pos)
    body.sprite.anchor.x = 0.5
    body.sprite.anchor.y = 0.5
    body.setScale(scale)

    return body


  _createSun: () ->
    return this._createStellarBody("images/sun.png", [400, 100, -2], 1)


  _createEarth: () ->
    return this._createStellarBody("images/earth.png", [500, 100, -2], 0.5)


  _createMoon: () ->
    return this._createStellarBody("images/moon.png", [550, 100, -2], 0.2)


  update: () ->
    for o in this.objects
      o.update(this.camera)

