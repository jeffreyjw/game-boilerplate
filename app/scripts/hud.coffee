"use strict"


class GAME.HUDMenu

  hud: null
  hudElement: null

  constructor: (hudElement) ->
    this.hudElement = hudElement
    this._createHudElement()

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


  _createHudElement: () ->
    element = document.createElement("div")
    this.hudElement.setAttribute("ng-app", "HUDApp")
    element.setAttribute("class", "fullView")
    element.setAttribute("ng-view", "")
    element.setAttribute("style", "")

    this.hudElement.style.width = window.innerWidth+'px'
    this.hudElement.style.height = window.innerHeight+'px'
    this.hudElement.appendChild(element)

    window.addEventListener("resize", () =>
      console.log element
      this.hudElement.style.width = window.innerWidth+'px'
      this.hudElement.style.height = window.innerHeight+'px'
    )
