"use strict"

class GAME.Game

  renderer: null
  screen: null
  input: null

  constructor: (screen) ->
    this.screen = screen
    this._prepare()

  _prepare: () ->
    this.renderer = new GAME.Renderer(this.screen)
    this.input = new GAME.Input(this)

  _onFrame: () ->
    this.renderer.render()

    this.input.update()

  run: () ->
    TweenLite.ticker.addEventListener("tick", this._onFrame, this)