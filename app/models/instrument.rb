class Instrument < ActiveRecord::Base
  has_many :student_instruments
  has_many :students, through: :student_instruments
end
