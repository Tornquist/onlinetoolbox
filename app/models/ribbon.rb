class Ribbon < ActiveRecord::Base
  include RankedModel
  ranks :index

  has_many :student_ribbons
  has_many :students, through: :student_ribbons
end
