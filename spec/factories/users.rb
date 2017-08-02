# frozen_string_literal: true

FactoryGirl.define do
  sequence :email do |n|
    "email#{n}@factory.com"
  end

  sequence :username do |n|
    "testuser#{n}"
  end

  factory :user do
    password '00000000'
    password_confirmation '00000000'

    email
    username

    factory :admin do
      role 'admin'
    end
  end
end
