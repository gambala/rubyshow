class Course < ActiveRecord::Base
  has_many :comments
end
