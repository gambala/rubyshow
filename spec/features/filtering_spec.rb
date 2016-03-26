require 'rails_helper'
require 'shared_examples/filtering_shared_examples'

def apply_filter(path, constraint)
  visit path
  find(:css, '#course_name').set(constraint)
  find(:css, '#apply_filter').click
end

describe 'Filtering feature' do
  context 'when user goes to main page' do

    before do
      create_list :free_course, 10
      create_list :paid_course, 10
      apply_filter(root_path, 'Free')
    end

    it 'shows courses that match filtering constraint' do
      expect(page).to have_content('Free_Course')
    end

    it 'does not show courses that have been filtered' do
      expect(page).not_to have_content('Paid_Course')
    end

    it 'resets filter after reset button pressed' do
      find(:css, '#reset_filter').click
      expect(page).to have_content('Paid_Course')
      expect(page).to have_content('Free_Course')
    end
  end

  context 'when user goes to paid courses page' do
    before do
      create :paid_course, title: 'Course_A'
      create :paid_course, title: 'Course_B'
      apply_filter(paid_courses_path, 'Course_A')
    end

    it_behaves_like "normally working filter"
  end

  context 'when user goes to free courses page' do
    before do
      create :free_course, title: 'Course_A'
      create :free_course, title: 'Course_B'
      apply_filter(free_courses_path, 'Course_A')
    end

    it_behaves_like "normally working filter"
  end
end
