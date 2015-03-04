class GigsController < ApplicationController
  before_action :set_gig, only: [:show, :edit, :update, :destroy]

  respond_to :html

  add_breadcrumb "Seasons", :seasons_path
  def index
    @season = Season.find(params[:season_id])
    add_breadcrumb "#{@season.name}", season_path(@season.id)
    add_breadcrumb "Gigs", season_gigs_path(@season.id)

    @games = @season.games
    @gigs = Gig.all
    respond_with(@gigs)
  end

  def new
    @season = Season.find(params[:season_id])

    add_breadcrumb "#{@season.name}", season_path(@season.id)
    add_breadcrumb "Gigs", season_gigs_path(@season.id)
    add_breadcrumb "New", new_season_gig_path(@season.id)

    @gig = Gig.new
    if params[:student_id]
      @gig.student_id = params[:student_id]
    end
    respond_with(@gig)
  end

  def edit
    @season = Season.find(params[:season_id])
    add_breadcrumb "#{@season.name}", season_path(@season.id)
    add_breadcrumb "Gigs", season_gigs_path(@season.id)
    add_breadcrumb "Edit", edit_season_gig_path(@season.id, @gig.id)
  end

  def create
    @season = Season.find(params[:season_id])
    gig_hash = gig_params
    gig_hash["value"] = gig_params["value"].to_i
    @gig = Gig.new(gig_hash)
    @gig.save
    redirect_to season_gigs_path(@season)
  end

  def update
    @season = Season.find(params[:season_id])
    gig_hash = gig_params
    gig_hash["value"] = gig_params["value"].to_i
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
    @section = @student.season_section(@season)
    add_breadcrumb "#{@season.name}", season_path(@season.id)
    add_breadcrumb "Gigs", season_gigs_path(@season.id)
    add_breadcrumb "#{@section.name}", section_path(@section.id)
    add_breadcrumb "#{@student.full_name}", season_student_gigs_path(@season.id, @student.id)
  end

  private
    def set_gig
      @gig = Gig.find(params[:id])
    end

    def gig_params
      params.require(:gig).permit(:student_id, :user_id, :game_id, :offense, :value)
    end
end
