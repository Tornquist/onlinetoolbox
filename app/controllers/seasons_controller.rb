class SeasonsController < ApplicationController
  before_action :set_season, only: [:show, :edit, :update, :destroy, :sections]

  respond_to :html
  add_breadcrumb "Seasons", :seasons_path

  def index
    @seasons = Season.all
    respond_with(@seasons)
  end

  def show
    add_breadcrumb "#{@season.name}", season_path(@season.id)
    respond_with(@season)
  end

  def recruitment
    @season = Season.find(params[:season_id])
    add_breadcrumb "#{@season.name}", season_path(@season.id)
    add_breadcrumb "Recruitment", season_recruitment_path(@season.id)
    respond_with(@season)
  end

  def gds
    @season = Season.find(params[:season_id])
    add_breadcrumb "#{@season.name}", season_path(@season.id)
    add_breadcrumb "GDS", season_gds_path(@season.id)
  end

  def new
    if current_user.check_permissions(:modify_create_seasons)
      @season = Season.new
      3.times { @season.games.build(season_id: @season.id) }
      default_section_names.each do |section|
        @season.sections.build(name: section, season_id: @season.id)
      end
    else
      flash[:error] = "Admin, Director, of Chief of Staff privileges required."
      redirect_to seasons_path
    end
  end

  def edit
    if current_user.check_permissions(:modify_create_seasons)
      add_breadcrumb "#{@season.name}", season_path(@season.id)
      add_breadcrumb "Edit", :edit_season_path, id: @season.id
    else
      flash[:error] = "Admin, Director, of Chief of Staff privileges required."
      redirect_to :back
    end
  end

  def create
    if current_user.check_permissions(:modify_create_seasons)
      @season = Season.new(season_params)
      @season.save
    else
      flash[:error] = "Admin, Director, of Chief of Staff privileges required."
    end
    redirect_to seasons_path
  end

  def update
    if current_user.check_permissions(:modify_create_seasons)
      @season.update(season_params)
    else
      flash[:error] = "Admin, Director, of Chief of Staff privileges required."
    end
    redirect_to seasons_path
  end

  private
    def default_section_names
      ["Piccolo","Clarinet","Saxophone", "Trumpet", "Mellophone",
       "Twirling Team", "Low Brass", "Tuba", "Percussion", "Big Bass Drum",
       "Big Ten Flags", "Golden Silks", "Golduster Dance Team"].sort_by!{ |m| m.downcase }
    end

    def set_season
      @season = Season.find(params[:id])
    end

    def season_params
      params.require(:season).permit(:name,
                                     :start,
                                     :end,
                                    sections_attributes:
                                      [:name,
                                       :id,
                                       :season_id,
                                       :_destroy],
                                    games_attributes:
                                      [:name,
                                       :id,
                                       :played_on,
                                       :season_id,
                                       :_destroy])
    end
end
