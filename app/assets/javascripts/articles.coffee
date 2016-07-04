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
  $('.pagination a').attr('data-remote', 'true')
  $article = $('.article')
  $articleText = $article.find('.body')
  $articleText.readingTime(
      readingTimeTarget: $article.find('.eta')
      wordCountTarget: $article.find('.word-count')
      wordsPerMinute: 100
    )
  sel()
  box = $("#tag-select")
  box.on 'select2:select', (e) ->
    $.ajax(
      url: "/tags/" + box.val()[0]
      dataType: "script"
    )
  box.on 'select2:unselect', (e) ->
    $.ajax(
      url: "/articles"
      dataType: "script"
    )


$(window).resize ->
  sel()
