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

  _onResize: () ->
    window.onresize = () =>
      this.renderer.resize(window.innerWidth, window.innerHeight)

  render: () ->
    this.renderer.render(this.stage)