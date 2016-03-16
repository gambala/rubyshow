require 'rails_helper'

feature 'Create question', '
  In order to get answer from community
  As user
  I want to be able to ask question
' do
  given(:user) { create(:user) }
  given(:course) { create(:course) }
  given(:question) { create(:question) }

  scenario 'auth user create question' do
    login(user)
    visit new_course_question_path(course)
    fill_in 'Ваш вопрос', with: question.content
    click_on 'Задать вопрос'

    expect(page).to have_content 'Спасибо за предложенный вопрос!'
    expect(page).to have_content question.content
  end

  scenario 'guest try create question' do
    visit new_course_question_path(course)

    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end
