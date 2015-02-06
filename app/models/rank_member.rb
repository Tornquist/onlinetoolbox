class RankMember < ActiveRecord::Base
  belongs_to :student
  belongs_to :rank
end
