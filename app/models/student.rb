class Student < ActiveRecord::Base
  has_many :student_instruments
  has_many :instruments, through: :student_instruments
  has_many :ensembles, through: :student_instruments
  has_many :addresses
  has_many :texts
  has_many :options

  accepts_nested_attributes_for :student_instruments, :allow_destroy => true
  accepts_nested_attributes_for :texts#, :reject_if => lambda { |a| a[:content].blank? }

  def fields
    (addresses + texts + options).map { |o| o.field }
  end

  def field(i)
    f = Field.find(i)
    case f.group
    when Group.where(name: "Address").first
      return addresses.where(field_id: i).first
    when Group.where(name: "Text").first
      return texts.where(field_id: i).first
    when Group.where(name: "Options").first
      return options.where(field_id: i).first
    end
  end

  def full_name()
    first_name + " " + last_name
  end
end
