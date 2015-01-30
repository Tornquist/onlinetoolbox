class Season < ActiveRecord::Base
  has_many :games
  accepts_nested_attributes_for :games, :allow_destroy => true
end
