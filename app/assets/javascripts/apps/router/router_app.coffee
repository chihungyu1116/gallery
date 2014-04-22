@App.module "RouterApp", (RouterApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false


  Controller =
    index: ->
      console.log 'index page'
      App.module("GlobalApp").start()
      App.module("GalleryApp").start()

    singleWhisper: (id) ->
      console.log "single whisper page -> id: #{id}"
      console.log 'get single whisper data by id from server '
      console.log 'start the lightbox module'

  Routes =
    "":            "index"
    "whisper/:id":  "singleWhisper"

  Router = Marionette.AppRouter.extend
    appRoutes: Routes
    controller: Controller
      
  API =
    startRouter: ->
      new Router()
      Backbone.history.start {pushState: true}
      
  RouterApp.on "start", ->
    API.startRouter()