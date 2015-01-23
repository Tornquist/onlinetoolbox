module StudentsHelper
  def self.UnclaimedStudents
    claimed = ClaimedStudent.first.nil? ? [] : ClaimedStudent.first.claimed
    Student.all - claimed
  end

  def self.UnclaimedRecruits
    self.UnclaimedStudents.select { |x| x.recruit }
  end
end
