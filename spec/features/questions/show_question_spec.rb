require 'rails_helper'

feature 'Show question', '
  In order to get question details
  As guest
  I want to  be able to view the question
' do
  given(:question) { create(:question) }

  scenario 'non-auth view question detail' do
    visit course_path(question.course)

    click_on "#{question.content}"

    expect(page).to have_content question.content
    expect(page).to have_content question.user.username
  end
end
