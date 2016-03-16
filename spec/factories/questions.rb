FactoryGirl.define do
  sequence(:content) { |n| "test_content#{n}" }

  factory :question do
    user
    course nil
    content
  end
end
