class Student < ActiveRecord::Base
  has_many :student_instruments
  has_many :instruments, through: :student_instruments
  has_many :ensembles, through: :student_instruments
end
