@App.module "RouterApp", (RouterApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  # availableModules = [
  #   "WindowApp",
  #   "LightboxApp",
  #   "GalleryApp"
  # ]

  # availableModules = do () ->
  #   modules = []
  #   _.each App, (val, key) ->
  #     console.log key, 'what key'
  #     modules.push key if key.match /\w+App/

  #   console.log modules
  #   return modules

  loadModules = (includeModules, route) ->
    () ->
      availableModules = do (modules = []) ->
        _.each App, (val, key) -> modules.push key if key.match /\w+App/
        modules
      excludeModules = _.without availableModules, includeModules
      _.each excludeModules, (moduleName) ->
        App.module(moduleName).stop()
      _.each includeModules, (moduleName) ->
        App.module(moduleName).start()
      route.apply @, arguments

  Controller =
    index: loadModules ["WindowApp", "LightboxApp", "GalleryApp"], ->

    singleWhisper: loadModules [], (id) ->

  Routes =
    "": "index"
    "whisper/:id": "singleWhisper"

  Router = Marionette.AppRouter.extend
    appRoutes: Routes
    controller: Controller
      
  API =
    startRouter: ->
      new Router()
      Backbone.history.start {pushState: true}
      
  RouterApp.on "start", ->
    API.startRouter()