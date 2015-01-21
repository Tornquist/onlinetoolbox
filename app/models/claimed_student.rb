class ClaimedStudent < ActiveRecord::Base
  belongs_to :user
  belongs_to :student

  def claimed
    ClaimedStudent.all.map { |x| x.student }
  end
end
