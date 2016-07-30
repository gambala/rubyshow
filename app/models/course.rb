class Course < ActiveRecord::Base
  has_many :comments, dependent: :destroy

  validates :url, :title, :description, :language, presence: true

  scope :approved, -> { where(approved: true) }
  scope :unapproved, -> { where(approved: false) }

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
    ActiveRecord::Base.connection.exec_query("SELECT round(((LOG(
                     (SELECT power((SELECT MAX(count_votes)
                                      FROM
                                        (SELECT count(comments.id) AS count_votes
                                         FROM comments
                                         LEFT JOIN courses ON comments.course_id=courses.id
                                         GROUP BY courses.id) t), 0.2)), count(com.id)))+rating)/2, 2) AS actual_raiting
          FROM courses c
          LEFT JOIN comments com ON c.id=com.course_id
          WHERE c.id=#{id} GROUP BY c.id, com.rating").first['actual_raiting']
  end

  private

  def scores
    @scores ||= comments.pluck(:rating).compact
  end
end
