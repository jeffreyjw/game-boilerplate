"use strict"

# develop this class by adding new asset types
# of your needs
class GAME.AssetManager extends UAM.AssetManager

  constructor: (assets) ->
    assetTypes = this._createAssetTypes()

    config = {}
    config.assetTypes = assetTypes
    config.assets = assets

    super(config)


  _createAssetTypes: () ->
    assetTypes = {}

    this._createTextureType(assetTypes)
    this._createSoundType(assetTypes)

    return assetTypes


  _createTextureType: (assetTypes) ->
    assetTypes["texture"] = (url, asset) ->
      loader = new PIXI.ImageLoader(url)
      loader.addEventListener("loaded", () ->
        asset.data = PIXI.Texture.fromImage(url)
        asset.done()
      )

      loader.load()

  _createSoundType: (assetTypes) ->
    assetTypes["sound"] = (urls, asset) ->
      sound = new Howl({
        urls: urls,
        autoplay: false
        onload: () ->
          asset.data = sound
          asset.done()

        onloaderror: () ->
          asset.error()
      })