class Course < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :graduates
  has_many :users, through: :graduates

  validates :url, :title, :description, :language, presence: true

  def rating
    scores = self.comments.pluck(:rating)
    scores.any? ? scores.inject{ |sum, el| sum + el } / scores.size : 0
  end
end
