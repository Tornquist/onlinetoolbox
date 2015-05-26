class StudentRibbonsController < ApplicationController
  def create_destroy
    ribbon = StudentRibbon.where(ribbon_id: params["ribbon"]["ribbon_id"],
                          student_id: params["ribbon"]["student_id"])
    if ribbon.empty?
      StudentRibbon.create(ribbon_id: params["ribbon"]["ribbon_id"],
                    student_id: params["ribbon"]["student_id"]);
    else
      ribbon.destroy_all
    end
    render :nothing => true, :status => 200
  end
end