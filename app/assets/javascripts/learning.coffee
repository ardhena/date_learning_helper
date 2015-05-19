# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', ->

  topicId = $('.timeline').attr('id')
  createStoryJS
    type: 'timeline'
    width: '100%'
    height: '500'
    source: '/learning/'+topicId+'.json'
    embed_id: 'timeline'
    debug: true
    lang: 'pl'