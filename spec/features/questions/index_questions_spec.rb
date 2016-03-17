require 'rails_helper'

feature 'Index question', '
  In order read questions to course
  As guest
  I want to be able to see kist of question
' do
  given(:user) { create(:user) }
  given(:course) { create(:course) }
  given!(:questions) { create_list(:question, 3, course: course) }


  describe 'at course page' do
    scenario 'guest can see list of question' do
      login(user)
      visit course_path(course)

      questions.each do |question|
        expect(page).to have_content(question.content)
      end
    end
  end

  describe 'at questions index page' do
    scenario 'guest can see list of question' do
      visit course_path(course)

      click_on 'Посмотреть вопросы'

      questions.each do |question|
        expect(page).to have_content(question.content)
      end
    end
  end
end
