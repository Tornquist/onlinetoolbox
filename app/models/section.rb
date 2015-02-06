class Section < ActiveRecord::Base
  belongs_to :season
  has_many :section_members
  has_many :students, through: :section_members
  has_many :section_notes
  has_many :ranks
  accepts_nested_attributes_for :ranks, allow_destroy: true

  def display_name
    season.name + " > " + name
  end

  def returning_members
    section_members.reject{ |i| i.student.recruit }.size
  end

  def rookies
    section_members.reject{ |i| !i.student.recruit }.size
  end
end
