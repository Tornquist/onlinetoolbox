class Season < ActiveRecord::Base
  has_many :games
  has_many :sections
  accepts_nested_attributes_for :games, :allow_destroy => true
  accepts_nested_attributes_for :sections, :allow_destroy => true

  def members
    sections.map{|s| s.section_members.reject{ |i| i.student.archive}.size }.reduce(:+)
  end

  def students
    sections.map(&:students).flatten(1).sort { |a, b| a.full_name_reversed.downcase <=> b.full_name_reversed.downcase }
  end
end
