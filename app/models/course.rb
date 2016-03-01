class Course < ActiveRecord::Base
  has_many :comments, dependent: :destroy

  validates :url, :title, :description, :language, presence: true

  def rating
    scores = self.comments.pluck(:rating).compact
    if scores && scores.any?
      scores.inject{ |sum, element| sum + element } / scores.size
    else
      0
    end
  end

  def approve!
    update!(approved: true)
  end

  def self.approved
    where(approved: true).sort_by {|course| [course.rating, course.comments.count] }.reverse
  end

  def self.unapproved
    where(approved: false)
  end
end
