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

  def inventory_ribbon
    if current_user.check_permissions(:edit_records)
      add_breadcrumb "Ribbon Inventory", :awards_inventory_ribbon_path
      @award = Ribbon.find(params[:id])
    else
      flash[:error] = "Error: R&R Office Head Privileges Required to Update Inventory"
      redirect_to awards_path
    end
  end

  def inventory_ribbon_update
    if current_user.check_permissions(:edit_records)
      amount = params["amount"].to_i
      ribbon = Ribbon.find(params[:id])
      ribbon.update(inventory: (ribbon.inventory.to_i+amount))
      flash[:notice] = "Inventory Updated"
      redirect_to awards_inventory_ribbon_path
    else
      flash[:error] = "Error: R&R Office Head Privileges Required to Update Inventory"
      redirect_to awards_path
    end
  end

  def inventory_rank
    if current_user.check_permissions(:edit_records)
      add_breadcrumb "Rank Inventory", :awards_inventory_rank_path
      @award = OfficerRank.find(params[:id])
    else
      flash[:error] = "Error: R&R Office Head Privileges Required to Update Inventory"
      redirect_to awards_path
    end
  end

  def inventory_rank_update
    if current_user.check_permissions(:edit_records)
      amount = params["amount"].to_i
      rank = OfficerRank.find(params[:id])
      rank.update(inventory: (rank.inventory+amount))
      flash[:notice] = "Inventory Updated"
      redirect_to awards_inventory_rank_path
    else
      flash[:error] = "Error: R&R Office Head Privileges Required to Update Inventory"
      redirect_to awards_path
    end
  end

  def search
    add_breadcrumb "Search Results", :awards_search_path
    @students = []
    @large_banner = ""
    @small_banner = ""
    @rank_info = false
    @office_info = false
    @ribbon_info = false
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

    elsif params.has_key?("full_rank_search")
      @large_banner = "Rank Search"
      @small_banner = "All Ranks"
      @rank_info = true
      @students = StudentsHelper.sort(StudentOfficerRank.all.map(&:student).uniq.reject { |c| c.archive })

    elsif params.has_key?("full_officer_search")
      @large_banner = "Office Search"
      @small_banner = "All Offices"
      @office_info = true
      @students = StudentsHelper.sort(StudentOffice.all.map(&:student).uniq.reject {|c| c.archive })

    elsif params.has_key?("full_ribbon_search")
      @large_banner = "Ribbon Search"
      @small_banner = "All Ribbons"
      @ribbon_info = true
      @students = StudentsHelper.sort(StudentRibbon.all.map(&:student).uniq.reject {|c| c.archive })

    end
  end
end
