@App.module "GlobalApp.Lightbox", (Lightbox, App, Backbone, Marionette, $, _) ->

  class Lightbox.View extends Marionette.ItemView  
    initialize: ->
      @ui =
        lightbox: $('#lightbox')

    open: ->
      
    close: ->