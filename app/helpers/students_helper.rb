module StudentsHelper
  def self.UnclaimedStudents
    claimed = ClaimedStudent.first.nil? ? [] : ClaimedStudent.first.claimed
    Student.all - claimed
  end
end
