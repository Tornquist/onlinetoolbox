class Season < ActiveRecord::Base
  has_many :games
  has_many :sections
  accepts_nested_attributes_for :games, :allow_destroy => true
  accepts_nested_attributes_for :sections, :allow_destroy => true
end
