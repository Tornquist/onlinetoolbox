class AwardsController < ApplicationController
  add_breadcrumb "Awards", :awards_path

  def index

  end

  def student_view
    @student = Student.find(params[:id])
    add_breadcrumb @student.full_name, :awards_student_path
    @student_ribbons = StudentRibbon.where(student: @student)
    @office_id = StudentOffice.where(student: @student).first.try(:office).try(:id)
  end
end
