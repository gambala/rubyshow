isBreakpoint = (alias) ->
  $('.device-' + alias).is ':visible'

document.addEventListener 'turbolinks:load', ->
  $('.affix-aside').each ->
    $(this).affix offset:
      top: =>
        if isBreakpoint('md') || isBreakpoint('lg')
          $(this).parent().offset().top - 10
        else
          99999
    resize = =>
      $(this).parent().outerHeight( $(this).outerHeight() )
      $(this).outerWidth( $(this).parent().outerWidth() )
      $(this).affix('checkPosition')
    $(window).resize resize
    resize()
