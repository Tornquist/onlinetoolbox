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

  def create_destroy_issued_at
    if current_user.check_permissions(:edit_user_records)
      ribbon = StudentRibbon.where(ribbon_id: params["ribbon"]["ribbon_id"],
                            student_id: params["ribbon"]["student_id"])
      if ribbon.empty?
        render :nothing => true, status: :not_found
      else
        ribbon = ribbon.first
        if ribbon.issued_at.nil?
          ribbon.update(:issued_at => Time.now)
          render :json => {:message => ribbon.issued_at.strftime('%m/%d/%y')}, status: :ok
        else
          ribbon.update(:issued_at => nil)
          render :json => {:message => 'XX/XX/XX'}, status: :ok
        end
      end
    end
  end
end
