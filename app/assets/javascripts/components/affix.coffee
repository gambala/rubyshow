(($, viewport) ->
  $(document).on 'ready page:load page:partial-load', ->
    $('.affix-aside').each ->
      $(this).affix offset:
        top: =>
          if viewport.is('>=md')
            $(this).parent().offset().top - 10
          else
            99999
      resize = =>
        $(this).parent().outerHeight( $(this).outerHeight() )
        $(this).outerWidth( $(this).parent().outerWidth() )
        $(this).affix('checkPosition')
      $(window).resize resize
      resize()
) jQuery, ResponsiveBootstrapToolkit
