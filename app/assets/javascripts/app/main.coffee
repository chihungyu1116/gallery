@App = do (Backbone, Marionette) ->

  App = new Marionette.Application

  AppModule =
    startHistory: ->
      Backbone.history.start() if Backbone.history

  _.extend App, AppModule

  App.addRegions
    headerRegion: "#header-region"
    mainRegion: "#main-region"
    footerRegion: "#footer-region"

  App.addInitializer ->
    

  App.on "initialize:after", ->
    @startHistory()
    App.module("GlobalApp").start()

    # [!!!] should put in the router
    App.module("MainApp").start()

  App