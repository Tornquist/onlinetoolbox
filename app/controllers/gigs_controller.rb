class GigsController < ApplicationController
  before_action :set_gig, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @season = Season.find(params[:season_id])
    @games = @season.games
    @gigs = Gig.all
    respond_with(@gigs)
  end

  def show
    respond_with(@gig)
  end

  def new
    @gig = Gig.new
    respond_with(@gig)
  end

  def edit
  end

  def create
    @gig = Gig.new(gig_params)
    @gig.save
    respond_with(@gig)
  end

  def update
    @gig.update(gig_params)
    respond_with(@gig)
  end

  def destroy
    @gig.destroy
    respond_with(@gig)
  end

  def student_view
    @student = Student.find(params[:student_id])
    @season = Season.find(params[:season_id])
    @games = @season.games.order(:played_on)
  end

  private
    def set_gig
      @gig = Gig.find(params[:id])
    end

    def gig_params
      params.require(:gig).permit(:student_id, :user_id, :game_id, :offense, :value)
    end
end
