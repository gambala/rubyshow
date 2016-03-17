class AnswersController < ApplicationController
  def create
    question = Question.find(params[:question_id])
    @answer = question.answers.build(answer_params)
    @answer.user_id = current_user.id

    if @answer.save
      render json: @answer.to_json(include: [:user]), notice: 'Спасибо за ваш ответ!'
    else
      render json: { errors: @answer.errors.full_messages }
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end
end
