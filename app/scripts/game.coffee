"use strict"

class GAME.Game

  renderer: null
  screen: null

  constructor: (screen) ->
    this.screen = screen
    this._prepare()

  _prepare: () ->
    this.renderer = new GAME.Renderer(this.screen)

  _onFrame: () ->
    this.renderer.render()

  run: () ->
    TweenLite.ticker.addEventListener("tick", this._onFrame, this)