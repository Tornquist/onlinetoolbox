class Rank < ActiveRecord::Base
  belongs_to :section
  include RankedModel
  ranks :index
end
