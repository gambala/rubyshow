FactoryGirl.define do
  factory :course do
    title "Coursera"
    description "Lorem ipsum dolor sit amet, consectetur adipisicing elit. At, error."
    language "English"
    url 'http://example.com'
    paid true
    approved true
  end
end
