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
end
