@App.module "GalleryApp", (GalleryApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  class GalleryApp.Controller extends Marionette.Controller
    defaults:
      isLoading: false
      page: 0
      
    getView: ->
      new GalleryApp.View

    fetch: ->
      return if @isLoading
      @isLoading = true

      $.ajax
        type: 'GET'
        url: '/galleries/more'
        success: (response) =>
          @isLoading = false
          @view.append response

    onScrollNearBottom: ->
      @fetch()

    onScrollBottom: ->

    onGalleryClick: (options) ->
      id = options.id
      Backbone.history.navigate("/whisper/#{id}",)

    watchVent: ->
      App.vent.on "window:scroll:nearBottom", @onScrollNearBottom.bind @
      App.vent.on "window:scroll:bottom", @onScrollBottom.bind @
      GalleryApp.on 'gallery:click', @onGalleryClick.bind @

    initialize: ->
      _.extend @, @default, {view: @getView()}
      @watchVent()

  GalleryApp.on "start", ->
    new GalleryApp.Controller