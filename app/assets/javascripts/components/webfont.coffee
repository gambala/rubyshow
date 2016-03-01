//= require webfontloader

$(document).on 'ready page:load page:partial-load', ->
  WebFont.load
    google:
      families: ['Open+Sans:400,600,700:latin,cyrillic', 'PT+Serif:400,700:latin,cyrillic']
    active: ->
      $(window).trigger 'webfontactive'
