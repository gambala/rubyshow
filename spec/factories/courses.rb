FactoryGirl.define do
  sequence :free_title do |n|
    "Free_Course_#{n}"
  end

  sequence :paid_title do |n|
    "Paid_Course_#{n}"
  end

end

FactoryGirl.define do
  factory :course do
    description "Lorem ipsum dolor sit amet, consectetur adipisicing elit. At, error."
    language "English"
    url 'http://example.com'

    factory :free_course do
      title { generate(:free_title) }
    end

    factory :paid_course do
      title { generate(:paid_title) }
      paid true
    end

    after(:create) { |c| c.approve! }
  end
end
