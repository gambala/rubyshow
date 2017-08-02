# frozen_string_literal: true

FactoryGirl.define do
  factory :comment do
    content "MyText"

    factory :opinion_comment do
      kind 2
      graduate true
    end
  end
end
