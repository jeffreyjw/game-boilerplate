"use strict"


class GAME.Object3

  sprite: null

  constructor: (obj) ->
    if toString.call(obj) == '[object String]'
      texture = this._createTextureFromURL(obj)
      this.sprite = this._createSpriteFromTexture(texture)
    else if obj instanceof PIXI.Texture
      this.sprite = this._createSpriteFromTexture(obj)
    else
      this.sprite = obj


  _createTextureFromURL: (url) ->
    texture = PIXI.Texture.fromImage(url)
    return texture


  _createSpriteFromTexture: (texture) ->
    sprite = new PIXI.Sprite(texture)
    return sprite

