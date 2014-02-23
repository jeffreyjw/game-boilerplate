"use strict"

class EXAMPLE.ExampleInputHandler extends GAME.InputHandler

  run: (game, keyboard) ->

    scene = game.getScene()
    service = game.hud.service()

    sun = scene.objects[0]
    earth = scene.objects[1]
    moon = scene.objects[2]
    sun.node.rotation[2] += 0.01
    earth.node.rotation[2] += 0.01

    if (keyboard.isKeyPressed(GAMEKBD.Keys.ARROW_UP))
      scene.camera.position = [0, 161, 0]
      scene.camera.up = [0, 0, 1]
    if (keyboard.isKeyPressed(GAMEKBD.Keys.ARROW_DOWN))
      scene.camera.position = [0, 0, 1]
      scene.camera.up = [0, 1, 0]

    scene.update(game)

    service.set("sun_x", sun.sprite.position.x)
    service.set("sun_y", sun.sprite.position.y)
    service.set("earth_x", earth.sprite.position.x)
    service.set("earth_y", earth.sprite.position.y)
    service.set("moon_x", moon.sprite.position.x)
    service.set("moon_y", moon.sprite.position.y)

    service.notifyChange()
