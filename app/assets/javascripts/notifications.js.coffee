# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  class Notifications
    constructor: ->
      @getNewNotifications()
      @notifications = $("[data-behavior='notifications']")
      if @notifications.length > 0
        @handleSuccess @notifications.data('notifications')

    getNewNotifications: ->
      $.ajax(
        url: '/notifications.json'
        dataType: 'JSON'
        method: 'GET'
        success: @handleSuccess
      )

    handleSuccess: (data) =>
      if (data == undefined)
        console.log "Undefined !"
      else
        items = $.map data, (notification) ->
          notification.template

        $("[data-behavior='unread-count']").text(items.length)
        $("[data-behavior='notification-items']").append(items)
        $("[data-behavior='notification-link']").on 'click', @notificationClick
    
    notificationClick: (e) =>
      $.ajax(
        url: "/notifications/#{e.currentTarget.id}/mark_as_read"
        dataType: 'JSON'
        method: 'POST'
      )

  jQuery ->
    new Notifications