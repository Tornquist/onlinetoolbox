class ScoresController < ApplicationController
  respond_to :html

  def index
    @season = Season.find(params[:season_id])
    @games = @season.games.order(:played_on)
    @student = Student.find(params[:student_id])
  end

  def show
    respond_with(@score)
  end

  def new
    @score = Score.new
    @score.user_id = current_user.id
    @score.student_id = params[:student_id]
    @season = Season.find(params[:season_id])
    respond_with(@score)
  end

  def edit
    @score = Score.find(params[:id])
  end

  def create
    @score = Score.new(score_params)
    @score.save
    respond_with(@score)
  end

  def update
    @score.update(score_params)
    respond_with(@score)
  end

  def destroy
    @score.destroy
    respond_with(@score)
  end

  private
    def score_params
      params.require(:score).permit(:student_id, :user_id, :game_id, :memorization, :music_effort, :marching_fundamentals, :marching_precision, :marching_effort, :rehearsal_etiquette, :preparedness, :punctuality, :gameday_enthusiasm, :gameday_professionalism, :comment)
    end
end
