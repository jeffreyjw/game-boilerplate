"use strict"


class GAME.Object3

  sprite: null
  node: null

  constructor: (obj) ->
    this.sprite = this._createSprite(obj)
    this.node = this._createNode()


  _createSprite: (obj) ->
    sprite = null
    if toString.call(obj) == '[object String]'
      texture = this._createTextureFromURL(obj)
      sprite = this._createSpriteFromTexture(texture)
    else if obj instanceof PIXI.Texture
      sprite = this._createSpriteFromTexture(obj)
    else
      sprite = obj

    return sprite


  _createTextureFromURL: (url) ->
    texture = PIXI.Texture.fromImage(url)
    return texture


  _createSpriteFromTexture: (texture) ->
    sprite = new PIXI.Sprite(texture)
    return sprite


  _createNode: () ->
    node = new PROJECTION.Node()
    return node

