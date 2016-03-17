require 'rails_helper'

feature 'Create answer', '
  In order to give answer to question
  As course curator
  I want to be able to create answer
' do
  given(:user) { create(:user) }
  given(:question) { create(:question) }

  scenario 'auth user create answer', js: true do
    login(user)
    visit question_path(question)
    fill_in 'Ответ', with: "test_answer"
    click_on 'Создать ответ'
    # wait_for_ajax

    expect(page).to have_content("test_answer")
  end

  scenario 'non-auth user try create answer' do
    visit question_path(question)
    expect(page).to_not have_content 'Создать ответ'
  end
end
