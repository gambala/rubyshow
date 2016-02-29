class Course < ActiveRecord::Base
  has_many :comments, dependent: :destroy

  validates :url, :title, :description, :language, presence: true

  def rating
    scores = self.comments.pluck(:rating)
    scores.any? ? scores.inject{ |sum, el| sum + el } / scores.size : 0
  end

  def approve!
    update!(approved: true)
  end
end
