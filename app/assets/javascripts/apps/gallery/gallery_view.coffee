@App.module "GalleryApp", (GalleryApp, App, Backbone, Marionette, $, _) ->

  class GalleryApp.View extends Marionette.ItemView

    initialize: ->
      @ui =
        main: $("#main-region")
      @watchEvents()
      
    append: (html) ->
      @ui.main.append html

    watchEvents: ->
      @ui.main.on "click", @onClick.bind(@)

    onClick: (e) ->
      id = $(e.target).parents(".single-whisper").attr("data-wid")
      GalleryApp.trigger 'gallery:click', {id:id} if id
      false