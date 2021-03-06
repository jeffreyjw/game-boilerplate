game-boilerplate
================

A boilerplate for a game project

To use it, just unpack the archive placed in compressed/app.zip to the directory of your desire.

### Directory structure

Basic directory structure with some explanations:

* example
- files specific to the example solar system project

* game
- core system, including `GAME.InputHandler`, `GAME.Scene`, `GAME.Assets` etc. ( will be explained later in this document)

* hud
- all files connected to the HUD system


### How to use

You can look at a basic bootstrap code in `scripts/main.coffee`

The most important thing you need is a `GAME.Game` instance (all examples will be written in CoffeeScript)

```javascript
// first, we take a DOM element which will be the container for the view
screen = document.getElementById("screen")

// then, we create the game instance
game = new GAME.Game(screen)
```

We can call `game.run()` just after this code is written, but we would like to have some scene and controls, right?
To do so, we need to extend a `GAME.Scene` class to create a new scene, and `GAME.InputHandler` to add new input controls.
You can see an example in `scripts/example/exampleScene.coffee` and `scripts/example/exampleInputHandler.coffee`.

One note: there can be set only one scene at a time, but many input handlers can coexist. So for example, you can
have a separate input handler for movement, a separate for shooting a gun and a separate for punching.

Another important thing is an asset loader. In `scripts/game/loader.coffee` you can look at `GAME.Loader` class,
which extends `GAME.Scene`. This class uses `GAME.AssetManager` as a loader and also preloader (a loader which
loads only the files needed to be shown when the game is loading). You can extend the `GAME.AssetManager` class,
by adding new asset types. This class uses `UAM.js` library for this.

HUD class is intended to be used in some manner like flash in AAA games - you can create HUD and Menu views using
HTML5, and react on the data flow between the HUD and game with angular code. You can create additional controllers
by extending the `GAME.HUDComponent` class and adding it to the HUD like this:

```javascript
class ExampleComponent extends GAME.HUDComponent
    // app is an angular module, you can use it
    // to create controllers, services, directives etc.
    // For more details, please look at the angular docs
    constructor: (app) ->
        app.controller('example', () ->
            $scope.init = () ->
                ... some code ...

             $scope.init()
        )

hud = new GAME.HUDMenu(game, document.getElementById("hud"))
hud.addComponent(ExampleComponent)
hud.run()
```

You can add the needed dependencies in the class `GAME.HUDMenu` (`scripts/hud/hud.coffee`), in `_createConfig()` method.