FactoryGirl.define do
  sequence(:email) { |n| "test#{n}@test.ru" }
  sequence(:username) { |n| "Ivan#{n}" }

  factory :user do
    email
    username
    password '00000000'
    password_confirmation '00000000'
  end
end
