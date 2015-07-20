class Season < ActiveRecord::Base
  has_many :games
  has_many :sections
  has_many :students, through: :sections
  accepts_nested_attributes_for :games, :allow_destroy => true
  accepts_nested_attributes_for :sections, :allow_destroy => true

  def members
    sections.map{|s| s.section_members.reject{ |i| i.student.archive}.size }.reduce(:+)
  end
end
