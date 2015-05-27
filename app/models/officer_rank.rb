class OfficerRank < ActiveRecord::Base
  has_many :student_officer_ranks

  def adjusted_inventory
    adjust = 0
    student_officer_ranks.each do |student|
      if (student.date_issued != nil)
        adjust -= 1;
      end
      if (student.date_returned != nil)
        adjust += 1;
      end
    end
    inventory + adjust
  end
end
