@App.module "GlobalApp.Window", (Window, App, Backbone, Marionette, $, _) ->

  Window.Controller =
    getView: ->
      new Window.View

    start: ->
      view = @getView()