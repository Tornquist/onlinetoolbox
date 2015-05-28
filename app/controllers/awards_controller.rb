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
    add_breadcrumb "Search Results", :awards_search_path
    @students = []
    @large_banner = ""
    @small_banner = ""
    if params.has_key?("user_search")
      @large_banner = "Student Search"
      if !params["first_name"].to_s.empty?
        @small_banner += "First Name: " + params["first_name"]
      end
      if !params["last_name"].to_s.empty?
        if (@small_banner != "")
          @small_banner += "  |  "
        end
        @small_banner += "Last Name: " + params["last_name"]
      end
      first_name = "%" + params["first_name"] + "%"
      last_name = "%" + params["last_name"] + "%"
      @students = StudentsHelper.sort(Student.where("first_name ILIKE :first_name AND last_name ILIKE :last_name", first_name: first_name, last_name: last_name).reject { |c| c.archive })

    elsif params.has_key?("office_search")
      @large_banner = "Office Search"
      office = Office.find(params["office_search"])
      @small_banner = office.name
      @students = StudentsHelper.sort(office.students.reject { |c| c.archive })

    elsif params.has_key?("ribbon_search")
      @large_banner = "Ribbon Search"
      ribbon = Ribbon.find(params["ribbon_search"])
      @small_banner = ribbon.name
      @students = StudentsHelper.sort(ribbon.students.reject { |c| c.archive })

    elsif params.has_key?("rank_search")
      @large_banner = "Rank Search"
      rank = OfficerRank.find(params["rank_search"])
      @small_banner = rank.name
      @students = StudentsHelper.sort(rank.real_students.reject { |c| c.archive })
    end
  end
end
