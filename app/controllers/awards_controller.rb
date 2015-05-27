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

  def inventory
    add_breadcrumb "Inventory", :awards_inventory_path
    @award = OfficerRank.find(params[:id])
  end

  def inventory_update
    amount = params["amount"].to_i
    rank = OfficerRank.find(params[:id])
    rank.update(inventory: (rank.inventory+amount))
    flash[:notice] = "Inventory Updated"
    redirect_to awards_inventory_path
  end

  def search
    binding.pry
    a = 1
    render nothing: true, status: 200
  end
end
