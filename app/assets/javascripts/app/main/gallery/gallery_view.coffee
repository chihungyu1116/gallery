@App.module "MainApp.Gallery", (Gallery, App, Backbone, Marionette, $, _) ->

  class Gallery.View extends Marionette.CompositeView

    ui:
      main: "#main-region"

    initialize: ->
      @bindUIElements()
      
    append: (html) ->
      $('#main-region').append html