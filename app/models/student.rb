class Student < ActiveRecord::Base
  has_many :student_instruments
  has_many :instruments, through: :student_instruments
  has_many :ensembles, through: :student_instruments
  has_many :addresses
  has_many :texts
  has_many :options
  has_many :comments
  has_many :claimed_students

  accepts_nested_attributes_for :student_instruments, :allow_destroy => true
  accepts_nested_attributes_for :texts#, :reject_if => lambda { |a| a[:content].blank? }
  accepts_nested_attributes_for :addresses
  accepts_nested_attributes_for :options

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
    when Group.where(name: "Option").first
      return options.where(field_id: i).first
    end
  end

  def full_name_inversed
    last_name + ", " + first_name
  end

  def full_name
    first_name + " " + last_name
  end
end
