"use strict"


class GAME.Object3

  sprite: null
  node: null
  _scale: null

  constructor: (obj, parent=null) ->
    this.sprite = this._createSprite(obj)
    this.node = this._createNode(parent)
    this._scale = 1


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


  _createNode: (parent) ->
    node = new PROJECTION.Node(parent)
    return node


  setPosition: (position) ->
    this.node.position = position


  setScale: (scale) ->
    this._scale = scale


  update: (camera) ->
    this.node.update()
    data = this.node.getData2d(camera)
    this.sprite.scale.x = this._scale*data.scale
    this.sprite.scale.y = this._scale*data.scale
    this.sprite.position.x = data.position[0]
    this.sprite.position.y = data.position[1]
