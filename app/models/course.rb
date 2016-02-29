class Course < ActiveRecord::Base
  has_many :comments, dependent: :destroy

  validates :url, :title, :description, :language, presence: true

  def rating
    scores = self.comments.pluck(:rating)
    if scores && scores.any?
      scores.inject{ |sum, el| sum + el } / scores.size
    else
      0
    end
  end

  def approve!
    update!(approved: true)
  end

  def self.paid
    where(paid: true, approved: true).sort_by {|course| course.rating }.reverse
  end

  def self.free
    where(paid: false, approved: true).sort_by {|course| course.rating }.reverse
  end

  def self.approved
    where(approved: true).sort_by {|course| course.rating }.reverse
  end
end
