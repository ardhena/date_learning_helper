# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', ->

  $('.show-event').click ->
    eventId = $(this).attr('id')
    bootbox.dialog
      title: 'Event with id ' + eventId
      message: 'Event details'
      buttons:
        success:
          label: 'Nowe wydarzenie'
          className: 'btn-success new-event'
          callback: ->
            $(this).close
        warning:
          label: 'Edytuj'
          className: 'btn-warning edit-event'
          callback: ->
            $(this).close
        danger:
          label: 'Usuń'
          className: 'btn-danger delete-event'
          callback: ->
            $(this).close
        default:
          label: 'Zamknij'
          className: 'btn-default'
          callback: ->
            $(this).close