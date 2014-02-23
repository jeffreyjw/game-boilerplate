"use strict"

class EXAMPLE.ExampleInputHandler extends GAME.InputHandler

  run: (game, keyboard) ->
    if (keyboard.isKeyPressed(GAMEKBD.Keys.ARROW_UP))
      console.log("arrow up is pressed")

    scene = game.getScene()
    service = game.hud.service()

    sun = scene.objects[0]
    earth = scene.objects[1]
    moon = scene.objects[2]
    sun.node.rotation[2] += 0.1
    scene.update(game)

    service.set("sun_x", sun.sprite.position.x)
    service.set("sun_y", sun.sprite.position.y)
    service.set("earth_x", earth.sprite.position.x)
    service.set("earth_y", earth.sprite.position.y)
    service.set("moon_x", moon.sprite.position.x)
    service.set("moon_y", moon.sprite.position.y)

    service.notifyChange()
