FactoryGirl.define do
  sequence(:content) { |n| "question_content#{n}" }

  factory :question do
    user
    course
    content
  end
end
