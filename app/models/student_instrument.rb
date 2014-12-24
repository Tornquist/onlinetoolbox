class StudentInstrument < ActiveRecord::Base
  belongs_to :ensemble
  belongs_to :instrument
  belongs_to :student
end
