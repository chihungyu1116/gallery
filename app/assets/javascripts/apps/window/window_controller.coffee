@App.module "WindowApp", (WindowApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  class WindowApp.Controller extends Marionette.Controller
    defaults: {}

    getView: ->
      new WindowApp.View()

    onScrollNearBottom: () ->
      App.vent.trigger "window:scroll:nearBottom"

    onScrollBottom: () ->
      App.vent.trigger "window:scroll:bottom"

    onClick: (e) ->
      console.log e.target, 'click'
      App.vent.trigger "window:click"

    unwatchEvents: ->

    watchEvents: ->
      WindowApp.on "scroll:nearBottom", @onScrollNearBottom.bind @
      WindowApp.on "scroll:bottom", @onScrollBottom.bind @
      WindowApp.on "click", @onClick.bind @

    initialize: ->
      _.extend @, @default, {
        view: @getView()
      }
      @watchEvents()
      
  WindowApp.on "start", ->
    new WindowApp.Controller()