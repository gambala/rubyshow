require "statistics2"
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

  def self.paid
    includes(:comments).where(paid: true, approved: true).sort_by {|course| [course.rating, course.comments.count] }.reverse
  end

  def self.free
    includes(:comments).where(paid: false, approved: true).sort_by {|course| [course.rating, course.comments.count] }.reverse
  end

  def self.approved
    includes(:comments).where(approved: true).sort_by {|course| course.sort_of_rating }.reverse
  end

  def self.unapproved
    includes(:comments).where(approved: false)
  end

  def ci_lower_bound(pos, n, confidence)
      if n == 0
          return 0
      end
      z = Statistics2.pnormaldist(1-(1-confidence)/2)
      phat = 1.0*pos/n
      (phat + z*z/(2*n) - z * Math.sqrt((phat*(1-phat)+z*z/(4*n))/n))/(1+z*z/n)
  end

  def sort_of_rating
    five = comments.where(rating: 5).count
    four = comments.where(rating: 4).count
    three = comments.where(rating: 3).count
    two = comments.where(rating: 2).count
    one = comments.where(rating: 1).count

    total_comments = five+four+three+two+one

    return 0 if total_comments == 0

    rating = ((5*five + 4*four + 3*three + 2*two + 1*one) / (total_comments)).to_f
    rating ||= 0
  end
end
