@App.module "LightboxApp", (LightboxApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  class LightboxApp.Controller extends Marionette.Controller
    defaults: {}

    getView: ->
      new LightboxApp.View()

    openLightbox: (options) ->
      @view.open()
      # disable scroll event

    closeLightbox: (options) ->
      @view.close()
      # enable scroll event

    watchEvents: ->
      App.vent.on "global:lightbox:open", @openLightbox.bind @
      App.vent.on "global:lightbox:close", @closeLightbox.bind @

    start: ->
      _.extend @, @default, {
        view: @getView()
      }
      @watchVents()

  LightboxApp.on "start", ->
    new LightboxApp.Controller()
      