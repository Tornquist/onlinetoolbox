class Office < ActiveRecord::Base
  has_many :student_offices
  has_many :students, through: :student_offices
end
