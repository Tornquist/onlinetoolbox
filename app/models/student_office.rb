class StudentOffice < ActiveRecord::Base
  belongs_to :student
  belongs_to :office
end
