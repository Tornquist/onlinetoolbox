class ScoresController < ApplicationController
  respond_to :html

  def index
    @season = Season.find(params[:season_id])
    @games = @season.games.order(:played_on)
    @student = Student.find(params[:student_id])
    @section = @student.season_section(@season)

    add_breadcrumb "Seasons", :seasons_path
    add_breadcrumb "#{@season.name}", season_path(@season.id)
    add_breadcrumb "#{@section.name}", section_path(@section.id)
    add_breadcrumb "GDS Scores", season_student_scores_path(@season.id, @student)
  end

  def show
    respond_with(@score)
  end

  def new
    @season = Season.find(params[:season_id])
    @student = Student.find(params[:student_id])
    @score = Score.new
    @score.user_id = current_user.id
    @score.student_id = @student.id
    @section = @student.season_section(@season)

    add_breadcrumb "Seasons", :seasons_path
    add_breadcrumb "#{@season.name}", season_path(@season.id)
    add_breadcrumb "#{@section.name}", section_path(@section.id)
    add_breadcrumb "GDS Scores", season_student_scores_path(@season.id, @student)
    add_breadcrumb "New", new_season_student_score_path(@season.id, @student)

    if (params[:game_id])
      @score.game_id = params[:game_id]
      score = Score.where(:student_id => @student.id,
                          :game_id => @score.game_id)
      if (score.empty?)
        respond_with(@score)
      else
        redirect_to edit_season_student_score_path(@season, @student, score.first)
      end
    else
      flash[:error] = "Warning: No Game ID Provided. Please click a link below."
      redirect_to season_student_scores_path(@season, @student)
    end
  end

  def edit
    @season = Season.find(params[:season_id])
    @student = Student.find(params[:student_id])
    @score = Score.find(params[:id])
    @section = @student.season_section(@season)

    add_breadcrumb "Seasons", :seasons_path
    add_breadcrumb "#{@season.name}", season_path(@season.id)
    add_breadcrumb "#{@section.name}", section_path(@section.id)
    add_breadcrumb "GDS Scores", season_student_scores_path(@season.id, @student)
    add_breadcrumb "Edit", edit_season_student_score_path(@season.id, @student, @score)
  end

  def create
    @season = Season.find(params[:season_id])
    @student = Student.find(params[:student_id])
    @score = Score.new(score_params)
    begin
      @score.save
      redirect_to season_student_scores_path(@season, @student)
    rescue => errors
      flash[:error] = "Error: Record did not save properly.  Make sure all fields are filled out."
      redirect_to season_student_scores_path(@season, @student)
    end
  end

  def update
    @season = Season.find(params[:season_id])
    @student = Student.find(params[:student_id])
    @score = Score.find(params[:id])
    @score.update(score_params)
    redirect_to season_student_scores_path(@season, @student)
  end

  private
    def score_params
      params.require(:score).permit(:student_id, :user_id, :game_id, :memorization, :music_effort, :marching_fundamentals, :marching_precision, :marching_effort, :rehearsal_etiquette, :preparedness, :punctuality, :gameday_enthusiasm, :gameday_professionalism, :comment)
    end
end
