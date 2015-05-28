class OfficerRank < ActiveRecord::Base
  has_many :student_officer_ranks
  has_many :students, through: :student_officer_ranks

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

  def real_students
    array = students.to_a
    array.reject! { |student| student.student_officer_ranks.map{|c| c.officer_rank.hours > hours}.reduce(&:|) }
    array
  end
end
