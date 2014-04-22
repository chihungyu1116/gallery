@App.module "GalleryApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  Show.Controller =
    defaults:
      isLoading: false
      page: 0
      
    getView: ->
      new Show.View

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
      Backbone.history.navigate("/whisper/#{id}")

    watchVent: ->
      App.vent.on "window:scroll:nearBottom", @onScrollNearBottom.bind @
      App.vent.on "window:scroll:bottom", @onScrollBottom.bind @
      Show.on 'gallery:click', @onGalleryClick.bind @

    start: ->
      _.extend @, @default, {view: @getView()}
      @watchVent()