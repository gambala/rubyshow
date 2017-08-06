# frozen_string_literal: true

FactoryGirl.define do
  factory :course do
    description 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At, error.'
    language 'English'
    url 'http://example.com'
    sequence(:title) { |n| "Free_Course_#{n}" }

    factory :unapproved_course do
      sequence(:title) { |n| "Unapproved_Free_Course_#{n}" }
      url 'https://example.com/unapproved_course'
      description 'some description'
    end

    factory :approved_course do
      factory :free_course do
        sequence(:title) { |n| "Approved_Free_Course_#{n}" }
      end

      factory :paid_course do
        sequence(:title) { |n| "Paid_Course_#{n}" }
        paid true
      end

      after(:create, &:approve!)
    end
  end
end

# == Schema Information
#
# Table name: courses
#
#  id          :integer          not null, primary key
#  title       :string           default(""), not null
#  description :text             default(""), not null
#  language    :string           default("Русский"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  paid        :boolean          default(FALSE)
#  approved    :boolean          default(FALSE), not null
#  url         :string
#
# Indexes
#
#  index_courses_on_title  (title) UNIQUE
#
