"use strict"

class GAME.Renderer

  renderer: null
  screen: null
  stage: null

  constructor: (screen) ->
    this.screen = screen
    this.stage = new PIXI.Stage(0x4444DD)

    this._create()
    this._onResize()


  _create: () ->
    this.renderer = PIXI.autoDetectRenderer(window.innerWidth, window.innerHeight)
    this.screen.appendChild(this.renderer.view)

    tex = PIXI.Texture.fromImage("images/gb.png")
    sprite = new PIXI.Sprite(tex)

    this.stage.addChild(sprite)

    sprite.position.x = 400
    sprite.position.y = 300
    sprite.anchor.x = 0.5
    sprite.anchor.y = 0.5
    sprite.interactive = true;
    this.stage.interactive = true;
    this.stage.click = () ->
      alert "stage"
    sprite.click = () ->
      alert "clicked"


  _onResize: () ->
    window.addEventListener("resize", () =>
      this.renderer.resize(window.innerWidth, window.innerHeight)
    )

  render: () ->
    this.renderer.render(this.stage)