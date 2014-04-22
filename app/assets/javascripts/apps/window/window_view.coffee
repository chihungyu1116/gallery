@App.module "WindowApp", (WindowApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  class WindowApp.View extends Marionette.ItemView  
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
        WindowApp.trigger "scroll:nearBottom"
      if @isBottom()
        WindowApp.trigger "scroll:bottom"
        
    onClick: (e) ->
      WindowApp.trigger "click", e

    isNearBottom: ->
      BOTTOM_OFFSET = 200
      @ui.window.scrollTop() > (@ui.document.height() - @ui.window.height() - BOTTOM_OFFSET)

    isBottom: ->
      BOTTOM_OFFSET = 10
      @ui.window.scrollTop() > (@ui.document.height() - @ui.window.height() - BOTTOM_OFFSET)      
    