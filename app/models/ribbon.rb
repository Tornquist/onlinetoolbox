class Ribbon < ActiveRecord::Base
  include RankedModel
  ranks :index
end
