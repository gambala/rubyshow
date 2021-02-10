# frozen_string_literal: true

class Comment < ApplicationRecord
  enum kind: { comment: 1, opinion: 2 }

  belongs_to :course
  belongs_to :user

  validates :content, presence: true
  validates :graduate, acceptance: { accept: true }, if: :need_graduate?
  validates :rating, inclusion: { in: 1..5 }, allow_nil: true

  scope :sorted_by_date, -> { order(created_at: :desc) }

  def need_graduate?
    opinion?
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
