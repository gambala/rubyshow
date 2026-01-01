class Comment < ApplicationRecord
  belongs_to :course
  belongs_to :user

  validates :content, presence: true
  validates :rating, inclusion: {in: 1..5}, allow_nil: true

  scope :reviews, -> { where(graduate: true).or(where.not(rating: nil)) }
  scope :sorted_by_date, -> { order(created_at: :desc) }

  counter_culture :course,
    column_name: proc { |r| r.graduate ? "graduates_count" : nil },
    column_names: {Comment.where(graduate: true) => "graduates_count"}
end

# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  user_id    :integer          indexed
#  content    :text             default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :integer          indexed
#  rating     :integer          indexed
#  graduate   :boolean          default(FALSE)
#
# Indexes
#
#  index_comments_on_course_id  (course_id)
#  index_comments_on_rating     (rating)
#  index_comments_on_user_id    (user_id)
#
