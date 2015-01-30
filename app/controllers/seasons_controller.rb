class SeasonsController < ApplicationController
  before_action :set_season, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @seasons = Season.all
    respond_with(@seasons)
  end

  def show
    respond_with(@season)
  end

  def new
    @season = Season.new
    3.times { @season.games.build(season_id: @season.id) }
  end

  def edit
  end

  def create
    @season = Season.new(season_params)
    @season.save
    respond_with(@season)
  end

  def update
    @season.update(season_params)
    respond_with(@season)
  end

  def destroy
    @season.destroy
    respond_with(@season)
  end

  private
    def set_season
      @season = Season.find(params[:id])
    end

    def season_params
      params.require(:season).permit(:name,
                                     :start_date,
                                     :end_date,
                                    games_attributes:
                                      [:name,
                                       :id,
                                       :game_date,
                                       :season_id,
                                       :_destroy])
    end
end
