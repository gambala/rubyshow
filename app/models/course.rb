class Course < ActiveRecord::Base
  has_many :comments
  has_many :graduates
  has_many :users, through: :graduates

  ratyrate_rateable 'score'
end
