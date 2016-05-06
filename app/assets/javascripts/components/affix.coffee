isBreakpoint = (alias) ->
  $('.device-' + alias).is ':visible'

document.addEventListener 'turbolinks:load', ->
  $('.affix-aside').each ->
    align = =>
      if $(this).hasClass('affix')
        $(this).css({ left: $(this).parent().offset().left })
      else
        $(this).css({ left: 'auto' })

    resize = =>
      $(this).parent().outerHeight( $(this).outerHeight() )
      $(this).outerWidth( $(this).parent().outerWidth() )
      $(this).affix('checkPosition')
      align()

    $(window).resize resize

    $(this).on('affixed.bs.affix', (e) ->
      align()
    )
    $(this).on('affixed-top.bs.affix', (e) ->
      align()
    )

    $(this).affix offset:
      top: =>
        if isBreakpoint('md') || isBreakpoint('lg')
          $(this).parent().offset().top - 10
        else
          99999

    resize()
