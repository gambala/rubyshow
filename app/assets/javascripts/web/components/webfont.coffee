//= require webfontloader/webfontloader

document.addEventListener 'ready', ->
  WebFont.load
    google:
      families: ['Open+Sans:400,600,700:latin,cyrillic', 'PT+Serif:400,700:latin,cyrillic']
    active: ->
      $(window).trigger 'webfontactive'
