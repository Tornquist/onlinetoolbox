class Rank < ActiveRecord::Base
  belongs_to :section
  has_many :rank_members
  has_many :students, through: :rank_members
  include RankedModel
  ranks :index
end
