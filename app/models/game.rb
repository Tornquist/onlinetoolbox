class Game < ActiveRecord::Base
  belongs_to :season
  has_many :scores
  has_many :gds
  has_many :gigs
end
