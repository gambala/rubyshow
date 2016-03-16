FactoryGirl.define do
  factory :user do
    email 'test@test.ru'
    username 'Ivan'
    password '00000000'
    password_confirmation '00000000'
  end
end
