class GigsController < ApplicationController
  before_action :set_gig, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @season = Season.find(params[:season_id])
    @games = @season.games
    @gigs = Gig.all
    respond_with(@gigs)
  end

  def new
    @season = Season.find(params[:season_id])
    @gig = Gig.new
    if params[:student_id]
      @gig.student_id = params[:student_id]
    end
    respond_with(@gig)
  end

  def edit
    @season = Season.find(params[:season_id])
  end

  def create
    @season = Season.find(params[:season_id])
    gig_hash = gig_params
    gig_hash["value"] = gig_params["value"].to_i
    binding.pry
    @gig = Gig.new(gig_hash)
    @gig.save
    redirect_to season_gigs_path(@season)
  end

  def update
    @season = Season.find(params[:season_id])
    gig_hash = gig_params
    gig_hash["value"] = gig_params["value"].to_i
    binding.pry
    @gig.update(gig_hash)
    redirect_to season_gigs_path(@season)
  end

  def destroy
    @season = Season.find(params[:season_id])
    @gig.destroy
    redirect_to season_gigs_path(@season)
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
