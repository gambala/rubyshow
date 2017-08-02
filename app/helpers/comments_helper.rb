# frozen_string_literal: true

module CommentsHelper
  def comment_label(comment)
    if comment.opinion?
      'Ваш отзыв о курсе'
    elsif comment.comment?
      'Ваш комментарий к курсу'
    elsif comment.question?
      'Что вы хотите спросить у авторов курса?'
    end
  end

  def submit_button_id(comment)
    if comment.opinion?
      'submit_opinion'
    elsif comment.comment?
      'submit_comment'
    elsif comment.question?
      'submit_question'
    end
  end

  def text_area_id(comment)
    if comment.opinion?
      'opinion_content'
    elsif comment.comment?
      'comment_content'
    elsif comment.question?
      'question_content'
    end
  end
end
