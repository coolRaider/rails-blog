# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('.pagination a').attr('data-remote', 'true')
  $article = $('.article')
  $articleText = $article.find('.body')
  $articleText.readingTime(
      readingTimeTarget: $article.find('.eta')
      wordCountTarget: $article.find('.word-count')
      wordsPerMinute: 100
    )
