class ClaimedStudent < ActiveRecord::Base
  belongs_to :user
  belongs_to :student

  def self.claimed
    ClaimedStudent.all.map { |x| x.student }
  end
end
