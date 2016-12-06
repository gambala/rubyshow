class Comment < ActiveRecord::Base
  belongs_to :course
  belongs_to :user

  validates :rating, inclusion: { in: 1..5 }, allow_nil: true
  validates :content, presence: true

  enum kind: { comment: 1, opinion: 2, question: 3 }
end
