class StudentOfficesController < ApplicationController
  def create_destroy
    StudentOffice.where(:student_id => params["student_office"]["student_id"]).destroy_all
    StudentOffice.create(student_id: params["student_office"]["student_id"],
                         office_id: params["student_office"]["office_id"])
    render :nothing => true, :status => 200
  end
end
