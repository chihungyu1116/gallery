@App = do (Backbone, Marionette) ->

  App = new Marionette.Application

  API =
    startRouter: ->
      App.module("RouterApp").start()
      
  App.addRegions
    headerRegion: "#header-region"
    mainRegion: "#main-region"
    footerRegion: "#footer-region"

  App.addInitializer ->
    API.startRouter()
  
  App