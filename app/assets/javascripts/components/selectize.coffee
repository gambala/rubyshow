initSelectize = ->
  $('select.selectize-default:not(.selectized)').selectize
    labelField: 'title'
    valueField: 'id'

$(document).on 'ready page:load page:partial-load', initSelectize
