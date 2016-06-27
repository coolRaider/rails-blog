# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

sel = ->
  $("#tag-select").select2
    theme: "bootstrap"
    allowClear: true
    placeholder: "type in the tags here"
    ajax:
      url: "/tags"
      dataType: 'json'
      delay: 250
      data: (term, page) ->
        q: term
      processResults: (data, page) ->
        results: $.map data, (tag)->
          id: tag.id
          text: tag.name
      cache: true
      escapeMarkup: (markup) ->
        markup

$ ->
  sel()
$(window).resize ->
  sel()
