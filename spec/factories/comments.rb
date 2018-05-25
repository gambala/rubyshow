# frozen_string_literal: true

FactoryGirl.define do
  factory :comment do
    content 'MyText'

    factory :opinion_comment do
      kind 2
      graduate true
    end
  end
end

# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  content    :text             default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :integer
#  rating     :integer
#  graduate   :boolean          default(FALSE)
#  kind       :integer          default("comment"), not null
#
# Indexes
#
#  index_comments_on_course_id  (course_id)
#  index_comments_on_kind       (kind)
#  index_comments_on_rating     (rating)
#  index_comments_on_user_id    (user_id)
#
