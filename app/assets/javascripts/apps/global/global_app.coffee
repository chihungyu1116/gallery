@App.module "GlobalApp", (GlobalApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  API =
    startWindow: ->
      GlobalApp.Window.Controller.start()

    startLightbox: ->
      GlobalApp.Lightbox.Controller.start()

  GlobalApp.on "start", ->
    API.startWindow()
    API.startLightbox()