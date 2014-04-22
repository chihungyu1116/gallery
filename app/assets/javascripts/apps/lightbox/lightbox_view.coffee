@App.module "LightboxApp", (LightboxApp, App, Backbone, Marionette, $, _) ->

  class LightboxApp.View extends Marionette.ItemView  
    initialize: ->
      @ui =
        lightbox: $('#lightbox')

    open: ->
      console.log 'open lightbox'
    close: ->
      console.log 'close lightbox'