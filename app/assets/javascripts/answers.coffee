create_answer = ->
  $('#new_answer').bind 'ajax:success', (e, data, status, xhr) ->
    response = $.parseJSON(xhr.responseText)
    username = response.user.username
    content = response.content
    $('#new_answer').prepend("
     <div class='row answer'>
        <div class='well col-md-6 col-md-offset-6'>
          <h4>Ответ</h4>
          <p>#{content}</p>
          <p> #{username}</p>
        </div>
      </div>")
    $('#answer_content').val('')

$ ->
  create_answer()
