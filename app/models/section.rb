class Section < ActiveRecord::Base
  belongs_to :season
  has_many :section_members
end