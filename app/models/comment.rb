class Comment < ActiveRecord::Base
  belongs_to :course
  belongs_to :user

  validates :rating, inclusion: { in: 1..5 }, allow_nil: true
  validates :content, presence: true
end
