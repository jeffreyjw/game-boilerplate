"use strict"


class GAME.HUDMenu

  hud: null
  hudElement: null
  game: null

  constructor: (game, hudElement) ->
    this.game = game
    this.hudElement = hudElement
    this._createHudElement()

    config = this._createConfig()
    this.hud = new HUD.Menu(config)

    new GAME.StopEventPropagation(this.app())
    new GAME.HUDMainCtrl(this.app())


  _createConfig: () ->
    config = {
      "/": { controller: "MainCtrl", templateUrl: "hud/main.html" }
    }

    return config


  app: () ->
    return this.hud.app


  _routeHandler: (e) ->
    evt = document.createEvent('MouseEvents')
    evt.initMouseEvent(e.type, e.bubbles, e.cancelable, window, e.detail,
      e.screenX, e.screenY, e.clientX, e.clientY, e.ctrlKey, e.altKey, e.shiftKey,
      e.metaKey, e.button, e.relatedTarget)

    this.game.renderer.renderer.view.dispatchEvent(evt)


  _createEvents: () ->
    this.hudElement.addEventListener("mousedown", (e) => this._routeHandler(e) )
    this.hudElement.addEventListener("mousemove", (e) => this._routeHandler(e) )
    this.hudElement.addEventListener("mouseout", (e) => this._routeHandler(e) )

    window.addEventListener("resize", () =>
      this.hudElement.style.width = window.innerWidth+'px'
      this.hudElement.style.height = window.innerHeight+'px'
    )

    # experimental, not working properly
    this.game.screen.addEventListener('DOMAttrModified', () =>
      ###console.log(this.hudElement.style.cursor)
      console.log(this.game.screen.style.cursor)

      if this.game.screen.style.cursor == ""
        this.hudElement.style.cursor = "inherit"
      else
        this.hudElement.style.cursor = this.game.screen.style.cursor###
    )


  _createView: () ->
    element = document.createElement("div")

    element.setAttribute("class", "fullView")
    element.setAttribute("ng-view", "")

    return element


  _createHudElement: () ->

    this.hudElement.setAttribute("ng-app", "HUDApp")
    this.hudElement.style.width = window.innerWidth+'px'
    this.hudElement.style.height = window.innerHeight+'px'

    element = this._createView()
    this.hudElement.appendChild(element)

    this._createEvents()

