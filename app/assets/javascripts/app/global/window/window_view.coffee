@App.module "GlobalApp.Window", (Window, App, Backbone, Marionette, $, _) ->

  class Window.View extends Marionette.ItemView  
    initialize: ->
      @ui =
        window: $(window)
        document: $(document)
      @watchScroll()

    watchScroll: ->
      @ui.window.on 'scroll', _.throttle @onScroll.bind(@), 500

    onScroll: ->
      if @isNearBottom()
        App.vent.trigger "scrollNearBottom"
      if @isBottom()
        App.vent.trigger "scrollBottom"
        
    isNearBottom: ->
      BOTTOM_OFFSET = 200
      @ui.window.scrollTop() > (@ui.document.height() - @ui.window.height() - BOTTOM_OFFSET)

    isBottom: ->
      BOTTOM_OFFSET = 10
      @ui.window.scrollTop() > (@ui.document.height() - @ui.window.height() - BOTTOM_OFFSET)      
