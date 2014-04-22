@App.module "GlobalApp.Window", (Window, App, Backbone, Marionette, $, _) ->

  Window.Controller =
    defaults: {}

    getView: ->
      new Window.View()

    onScrollNearBottom: () ->
      App.vent.trigger "window:scroll:nearBottom"

    onScrollBottom: () ->
      App.vent.trigger "window:scroll:bottom"

    onClick: (e) ->
      console.log e.target, 'click'
      App.vent.trigger "window:click"

    unwatchVents: ->

    watchVents: ->
      Window.on "scroll:nearBottom", @onScrollNearBottom.bind @
      Window.on "scroll:bottom", @onScrollBottom.bind @
      Window.on "click", @onClick.bind @

    start: ->
      _.extend @, @default, {
        view: @getView()
      }
      @watchVents()
      