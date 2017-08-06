# frozen_string_literal: true

class Course < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :url, :title, :description, :language, presence: true
  validates :title, uniqueness: true

  scope :approved, -> { where(approved: true) }
  scope :unapproved, -> { where(approved: false) }
  scope :free, -> { approved.where(paid: false) }
  scope :paid, -> { approved.where(paid: true) }

  def approve!
    update!(approved: true)
  end

  def graduates
    comments.pluck(:graduate)
  end

  def rated?
    scores.any?
  end

  def rating
    return 0 unless scores.any?

    (scores.inject { |sum, element| sum + element }.to_f / scores.size)
      .try(:round, 1)
  end

  private

  def scores
    @scores ||= comments.pluck(:rating).compact
  end
end

# == Schema Information
#
# Table name: courses
#
#  id          :integer          not null, primary key
#  title       :string           default(""), not null
#  description :text             default(""), not null
#  language    :string           default("Русский"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  paid        :boolean          default(FALSE)
#  approved    :boolean          default(FALSE), not null
#  url         :string
#
# Indexes
#
#  index_courses_on_title  (title) UNIQUE
#
