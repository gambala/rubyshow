# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :course
  belongs_to :user

  validates :rating, inclusion: { in: 1..5 }, allow_nil: true
  validates :content, presence: true
  validates :graduate, acceptance: { accept: true }, if: :grad

  enum kind: { comment: 1, opinion: 2, question: 3 }

  def grad
    opinion?
  end
end
