@App.module "GalleryApp", (GalleryApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  API =
    startGallery: ->
      GalleryApp.Show.Controller.start()

  GalleryApp.on "start", ->
    API.startGallery()
