FactoryGirl.define do
  sequence(:title) { |n| "test_title#{n}" }
  factory :course do
    title
    description "Lorem ipsum dolor sit amet, consectetur adipisicing elit. At, error."
    language "English"
    url 'http://example.com'
    paid true
    approved true
  end
end
