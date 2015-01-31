class Section < ActiveRecord::Base
  belongs_to :season
  has_many :section_members

  def display_name
    season.name + " - " + name
  end
end
