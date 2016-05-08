isBreakpoint = (alias) ->
  $('.device-' + alias).is ':visible'

document.addEventListener 'turbolinks:load', ->
  $('.affix-aside').each ->
    align = (is_affix) =>
      if is_affix
        $(this).css({ left: $(this).parent().offset().left })
      else
        $(this).css({ left: 'auto' })

    resize = =>
      $(this).parent().outerHeight( $(this).outerHeight() )
      $(this).outerWidth( $(this).parent().outerWidth() )
      $(this).affix('checkPosition')
      align($(this).hasClass('affix'))

    $(window).resize resize

    $(this).on('affix.bs.affix', (e) ->
      align(true)
    )
    $(this).on('affix-top.bs.affix', (e) ->
      align(false)
    )

    $(this).affix offset:
      top: =>
        if isBreakpoint('md') || isBreakpoint('lg')
          $(this).parent().offset().top - 10
        else
          99999

    resize()
