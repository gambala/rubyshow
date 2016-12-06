module CommentsHelper
  def comment_label(comment)
    case
    when comment.opinion?
      'Ваш отзыв о курсе'
    when comment.comment?
      'Ваш комментарий к курсу'
    when comment.question?
      'Что вы хотите спросить у авторов курса?'
    end
  end

  def submit_button_id(comment)
    case
    when comment.opinion?
      'submit_opinion'
    when comment.comment?
      'submit_comment'
    when comment.question?
      'submit_question'
    end
  end

  def text_area_id(comment)
    case
    when comment.opinion?
      'opinion_content'
    when comment.comment?
      'comment_content'
    when comment.question?
      'question_content'
    end
  end
end
