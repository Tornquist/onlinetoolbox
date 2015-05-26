class StudentRibbon < ActiveRecord::Base
  belongs_to :student
  belongs_to :ribbon
end
