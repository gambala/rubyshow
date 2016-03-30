initSelectize = ->
  $('select.selectize-default:not(.selectized)').selectize
    labelField: 'title'
    valueField: 'id'

document.addEventListener 'turbolinks:load', initSelectize
