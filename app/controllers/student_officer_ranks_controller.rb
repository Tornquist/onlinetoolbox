class StudentOfficerRanksController < ApplicationController
  def create_update
    if current_user.check_permissions(:edit_user_records)
      student_officer_rank = StudentOfficerRank.where(officer_rank_id: params["student_officer_rank"]["officer_rank_id"], student_id: params["student_officer_rank"]["student_id"]).first
      if (student_officer_rank == nil)
        case params["student_officer_rank"]["type"]
        when "approve"
          StudentOfficerRank.create(officer_rank_id: params["student_officer_rank"]["officer_rank_id"], student_id: params["student_officer_rank"]["student_id"], date_approved: Date.today)
        when "issue"
          StudentOfficerRank.create(officer_rank_id: params["student_officer_rank"]["officer_rank_id"], student_id: params["student_officer_rank"]["student_id"], date_issued: Date.today)
        when "return"
          StudentOfficerRank.create(officer_rank_id: params["student_officer_rank"]["officer_rank_id"], student_id: params["student_officer_rank"]["student_id"], date_returned: Date.today)
        end
      else
        case params["student_officer_rank"]["type"]
        when "approve"
          student_officer_rank.update(date_approved: Date.today)
        when "issue"
          student_officer_rank.update(date_issued: Date.today)
        when "return"
          student_officer_rank.update(date_returned: Date.today)
        end
      end
    end
    render :nothing => true, :status => 200
  end
end
