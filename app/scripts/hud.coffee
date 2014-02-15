"use strict"


class GAME.HUDMenu

  hud: null

  constructor: () ->
    config = this._createConfig()
    this.hud = new HUD.Menu(config)
    new GAME.HUDMainCtrl(this.app())


  _createConfig: () ->

    config = {
      "/": { controller: "MainCtrl", templateUrl: "hud/main.html" }
    }

    return config


  app: () ->
    return this.hud.app