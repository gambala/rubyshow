class Course < ActiveRecord::Base
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
