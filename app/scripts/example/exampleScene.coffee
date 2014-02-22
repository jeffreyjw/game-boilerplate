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
    earth = this._createEarth(sun.node)
    moon = this._createMoon(earth.node)

    ###sprite.sprite.interactive = true
    sprite.sprite.buttonMode = true
    sprite.sprite.mousedown = () ->
      alert "example scene"###

    this.objects = [ sun, earth, moon ]

    for o in this.objects
      this.stage.addChild(o.sprite)


  _createStellarBody: (img, pos, scale, parent = null) ->
    body = new GAME.Object3(img, parent)
    body.setPosition(pos)
    body.sprite.anchor.x = 0.5
    body.sprite.anchor.y = 0.5
    body.setScale(scale)

    return body


  _createSun: () ->
    return this._createStellarBody("images/sun.png", [400, 100, -2], 1)


  _createEarth: (parent) ->
    return this._createStellarBody("images/earth.png", [600, 100, -2], 0.5, parent)


  _createMoon: (parent) ->
    return this._createStellarBody("images/moon.png", [700, 100, -2], 0.2, parent)


  update: () ->
    for o in this.objects
      o.update(this.camera)

