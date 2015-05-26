class Ribbon < ActiveRecord::Base
  include RankedModel
  ranks :index

  has_many :student_ribbons
end
