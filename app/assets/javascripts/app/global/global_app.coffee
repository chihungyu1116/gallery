@App.module "GlobalApp", (GlobalApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  API =
    startWindow: ->
      GlobalApp.Window.Controller.start()

  GlobalApp.on "start", ->
    API.startWindow()