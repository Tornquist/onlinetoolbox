class GdsController < ApplicationController
  respond_to :html

  def index
    @student = Student.find(params[:student_id])
    @season = Season.find(params[:season_id])
    @games = @season.games.order(:played_on)
    @section = @student.season_section(@season)

    add_breadcrumb "Seasons", :seasons_path
    add_breadcrumb "#{@season.name}", season_path(@season.id)
    add_breadcrumb "#{@section.name}", section_path(@section.id)
    add_breadcrumb "GDS", season_student_gds_index_path(@season.id, @student)
  end

  def new
    @season = Season.find(params[:season_id])
    @student = Student.find(params[:student_id])
    @gds = Gds.new
    @gds.user_id = current_user.id
    @gds.student_id = @student.id
    @section = @student.season_section(@season)

    add_breadcrumb "Seasons", :seasons_path
    add_breadcrumb "#{@season.name}", season_path(@season.id)
    add_breadcrumb "#{@section.name}", section_path(@section.id)
    add_breadcrumb "GDS", season_student_gds_index_path(@season.id, @student)
    add_breadcrumb "New", new_season_student_gds_path(@season.id, @student)

    if (params[:game_id])
      @gds.game_id = params[:game_id]
      gds = Gds.where(:student_id => @student.id,
                          :game_id => @gds.game_id)
      if (gds.empty?)
        respond_with(@gds)
      else
        redirect_to edit_season_student_gds_path(@season, @student, gds.first)
      end
    else
      flash[:error] = "Warning: No Game ID Provided. Please click a link below."
      redirect_to season_student_gds_index_path(@season, @student)
    end
  end

  def edit
    @season = Season.find(params[:season_id])
    @student = Student.find(params[:student_id])
    @gds = Gds.find(params[:id])
    @section = @student.season_section(@season)

    add_breadcrumb "Seasons", :seasons_path
    add_breadcrumb "#{@season.name}", season_path(@season.id)
    add_breadcrumb "#{@section.name}", section_path(@section.id)
    add_breadcrumb "GDS", season_student_gds_index_path(@season.id, @student)
    add_breadcrumb "Edit", edit_season_student_gds_path(@season.id, @student, @gds)
  end

  def create
    @season = Season.find(params[:season_id])
    @student = Student.find(params[:student_id])
    @gds = Gds.new(gds_params)
    @gds.save
    redirect_to season_student_gds_index_path(@season, @student)
  end

  def update
    @season = Season.find(params[:season_id])
    @student = Student.find(params[:student_id])
    @gds = Gds.find(params[:id])
    @gds.update(gds_params)
    redirect_to season_student_gds_index_path(@season, @student)
  end

  def destroy
    @season = Season.find(params[:season_id])
    @student = Student.find(params[:student_id])
    @gds = Gds.find(params[:id])
    @gds.destroy
    redirect_to season_student_gds_index_path(@season, @student)
  end

  private
    def gds_params
      params.require(:gds).permit(:student_id, :user_id, :game_id, :gds_type_id, :available, :comment, :automatic)
    end
end
