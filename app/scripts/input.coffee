"use strict"

class GAME.Input

  game: null
  keyboard: null
  handlers: null

  constructor: (game) ->
    this.game = game
    this.handlers = []
    this._initKeyboard()

  _initKeyboard: () ->
    this.keyboard = GAMEKBD.Keyboard.get()

  _updateKeyboard: () ->
    this.keyboard.update()

  addHandler: (handler) ->
    this.handlers.push(handler)

  _runHandlers: () ->
    for handler in this.handlers
      handler.run(this.game, this.keyboard)

  update: () ->
    this._runHandlers()

    this._updateKeyboard()



