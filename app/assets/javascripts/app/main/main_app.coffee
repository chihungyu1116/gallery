@App.module "MainApp", (MainApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  API =
    startGallery: ->
      MainApp.Gallery.Controller.start()

  MainApp.on "start", ->
    API.startGallery()


