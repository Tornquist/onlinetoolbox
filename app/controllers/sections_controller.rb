class SectionsController < ApplicationController
  before_action :set_section, only: [:show, :edit, :update, :destroy]

  respond_to :html


  def show
    @ranks = @section.ranks.order(:index)
    @unranked = students_without_rank
    @autogds = @section.season.students.select { |s| s.automatic_gds(@section.season) }
    session[:return_to] ||= request.referer

    add_breadcrumb "Seasons", :seasons_path
    add_breadcrumb "#{@section.season.name}", season_path(@section.season.id)
    add_breadcrumb "#{@section.name}", section_path(@section.id)

    respond_with(@section)
  end

  def new
    @section = Section.new
    respond_with(@section)
  end

  def edit
    if current_user.check_permissions(:edit_section)
      @ranks = @section.ranks.order(:index)
    else
      flash[:error] = "Student Leader permissions required"
      redirect_to :back
    end
  end

  def create
    @section = Section.new(section_params)
    @section.save
    respond_with(@section)
  end

  def update
    if current_user.check_permissions(:edit_section)
      @section.update(section_params)
    else
      flash[:error] = "Student Leader permissions required"
    end
    respond_with(@section)
  end

  def destroy
    @section.destroy
    respond_with(@section)
  end

  def transfer
    if current_user.check_permissions(:transfer_students)
      @section = Section.find(params[:section_id])
    else
      flash[:error] = "Student Leader permissions required"
      redirect_to :back
    end
  end

  def transfer_students
    if current_user.check_permissions(:transfer_students)
      destination = params[:destination][:id].to_i
      upgrade = !params[:upgrade_students].nil?
      students = params[:students]
      students.each do |student|
        student_id = student.to_i
        if SectionMember.where(student_id: student_id, section_id: destination).empty?
          SectionMember.create(student_id: student_id, section_id: destination)
        end
        if upgrade
          student_object = Student.find(student_id)
          student_object.recruit = false
          student_object.save
        end
      end
      flash[:notice] = "Students Transferred"
      redirect_to section_path(Section.find(destination))
    else
      flash[:error] = "Student Leader permissions required"
      redirect_to root_path
    end
  end

  private
    def students_without_rank
      rankless = @section.students.where(:archive => false).order(:last_name, :first_name)
      @section.ranks.each { |rank| rankless -= rank.students }
      rankless
    end

    def set_section
      @section = Section.find(params[:id])
    end

    def section_params
      params.require(:section).permit(:name, :season_id,
                                     ranks_attributes:
                                     [ :id,
                                       :_destroy,
                                       :index,
                                       :name])
    end
end
