@App.module "GlobalApp.Lightbox", (Lightbox, App, Backbone, Marionette, $, _) ->

  Lightbox.Controller =
    defaults: {}

    getView: ->
      new Lightbox.View()

    openLightbox: (options) ->
      @view.open()
      console.log 'open lightbox', options
      # disable scroll event

    closeLightbox: (options) ->
      @view.close()
      console.log 'close lightbox', options
      # enable scroll event

    watchVents: ->
      App.vent.on "global:lightbox:open", @openLightbox.bind @
      App.vent.on "global:lightbox:close", @closeLightbox.bind @

    start: ->
      _.extend @, @default, {
        view: @getView()
      }
      @watchVents()
      