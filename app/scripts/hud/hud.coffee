"use strict"


class GAME.HUDMenu

  hud: null
  hudElement: null
  game: null
  components: null

  constructor: (game, hudElement) ->
    this.game = game
    this.hudElement = hudElement
    this.components = [
      GAME.HUDMainCtrl
      GAME.StopEventPropagation
    ]

    this._createHudElement()

    config = this._createConfig()
    this.hud = new HUD.Menu(this.hudElement, config)



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

    this.game.getScreenElement().dispatchEvent(evt)


  _createEvents: () ->
    this.hudElement.addEventListener("mousedown", (e) => this._routeHandler(e) )
    this.hudElement.addEventListener("mousemove", (e) => this._routeHandler(e) )
    this.hudElement.addEventListener("mouseout", (e) => this._routeHandler(e) )

    window.addEventListener("resize", () =>
      this.hudElement.style.width = window.innerWidth+'px'
      this.hudElement.style.height = window.innerHeight+'px'
    )

    this._observeAttributeChange()


  _observeAttributeChange: () ->
    observer = new MutationObserver(
      (mutations) =>
        mutations.forEach(
          (mutation) =>
            this.hudElement.style.cursor =
              this.game.getScreenElement().style.cursor
        )
    )

    observer.observe(
      this.game.getScreenElement(),
      {
        attributes: true,
        childList: true,
        characterData: true
      }
    )


  _createView: () ->
    element = document.createElement("div")

    element.setAttribute("class", "fullView")
    element.setAttribute("ng-view", "")

    return element


  _createHudElement: () ->

    this.hudElement.style.width = window.innerWidth+'px'
    this.hudElement.style.height = window.innerHeight+'px'

    element = this._createView()
    this.hudElement.appendChild(element)

    this._createEvents()


  addComponent: (component) ->
    this.components.push(component)


  run: () ->
    # instantiate component classes
    for component in this.components
      new component(this.app())

    this.hud.run()