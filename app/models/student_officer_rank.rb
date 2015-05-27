class StudentOfficerRank < ActiveRecord::Base
  belongs_to :student
  belongs_to :officer_rank
end
