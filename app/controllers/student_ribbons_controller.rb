class StudentRibbonsController < ApplicationController
  def create_destroy
    if current_user.check_permissions(:edit_user_records)
      ribbon = StudentRibbon.where(ribbon_id: params["ribbon"]["ribbon_id"],
                            student_id: params["ribbon"]["student_id"])
      if ribbon.empty?
        new = StudentRibbon.create(ribbon_id: params["ribbon"]["ribbon_id"],
                      student_id: params["ribbon"]["student_id"]);
        render :json => {:message => new.created_at.strftime('%m/%d/%y')}, status: :ok
      else
        ribbon.destroy_all
        render :json => {:message => 'XX/XX/XX'}, status: :ok
      end
    end
  end
end
