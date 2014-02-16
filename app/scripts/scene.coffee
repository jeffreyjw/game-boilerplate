"use strict"


class GAME.Scene

  stage: null

  constructor: (backgroundColor = 0x4444DD) ->
    this.stage = new PIXI.Stage(backgroundColor)
