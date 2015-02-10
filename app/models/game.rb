class Game < ActiveRecord::Base
  belongs_to :season
  has_many :scores
end
