@App.module "GlobalApp.Window", (Window, App, Backbone, Marionette, $, _) ->

  class Window.View extends Marionette.ItemView  
    initialize: ->
      @ui =
        window: $(window)
        document: $(document)
      @watchEvents()

    watchEvents: ->
      @ui.window.on 'scroll', _.throttle @onScroll.bind(@), 500
      @ui.window.on 'click', _.throttle @onClick.bind(@), 500

    onScroll: ->
      if @isNearBottom()
        Window.trigger "scroll:nearBottom"
      if @isBottom()
        Window.trigger "scroll:bottom"
        
    onClick: (e) ->
      Window.trigger "click", e

    isNearBottom: ->
      BOTTOM_OFFSET = 200
      @ui.window.scrollTop() > (@ui.document.height() - @ui.window.height() - BOTTOM_OFFSET)

    isBottom: ->
      BOTTOM_OFFSET = 10
      @ui.window.scrollTop() > (@ui.document.height() - @ui.window.height() - BOTTOM_OFFSET)      
