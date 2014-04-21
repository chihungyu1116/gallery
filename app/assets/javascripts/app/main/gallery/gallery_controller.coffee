@App.module "MainApp.Gallery", (Gallery, App, Backbone, Marionette, $, _) ->

  Gallery.Controller =
    defaults: {
      isLoading: false
      page: 0
    }
      
    getView: ->
      new Gallery.View

    getMoreGallery: ->
      return if @isLoading

      @isLoading = true
      $.ajax
        type: 'GET'
        url: '/galleries/more'
        success: (response) =>
          @isLoading = false
          @view.append response

    onScrollNearBottom: ->
      console.log 'scroll near bottom, get more content'
      @getMoreGallery()

    onScrollBottom: ->
      console.log 'scroll at the bottom, maybe show the loading icon?'

    watchVent: ->
      App.vent.on "scrollNearBottom", @onScrollNearBottom.bind @
      App.vent.on "scrollBottom", @onScrollBottom.bind @

    start: ->
      _.extend @, @default, {
        view: @getView()
      }
      @watchVent()
