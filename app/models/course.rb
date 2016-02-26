class Course < ActiveRecord::Base
  has_many :comments
  has_many :graduates
  has_many :users, through: :graduates

  validates :url, :title, :description, :language, :paid, presence: true

  def rating
    scores = self.comments.pluck(:rating)
    scores.inject{ |sum, el| sum + el } / scores.size if scores.any?
  end
end
