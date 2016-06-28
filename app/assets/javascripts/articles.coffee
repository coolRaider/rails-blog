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

onsel = (env) ->
  alert("searching "+env)

$ ->
  sel()
  box = $("#tag-select")
  box.on 'select2:select', (e) ->
    $.ajax(
      url: "/tags/"+box.val()[0]
      dataType: "script"
    )
  box.on 'select2:unselect', (e) ->
    $.ajax(
      url: "/articles"
      dataType: "script"
    )

$(window).resize ->
  sel()
