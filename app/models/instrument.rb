class Instrument < ActiveRecord::Base
  has_many :student_instruments
  has_many :students, through: :student_instruments
  has_many :favorite_instruments
end
