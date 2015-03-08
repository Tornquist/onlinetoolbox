class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_favorite, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @favorites = Favorite.all
    respond_with(@favorites)
  end

  def show
    respond_with(@favorite)
  end

  def new
    @favorite = Favorite.new
    respond_with(@favorite)
  end

  def edit
  end

  def create
    @favorite = Favorite.new(favorite_params)
    @favorite.save
    respond_with(@favorite)
  end

  def update
    @favorite.update(favorite_params)
    respond_with(@favorite)
  end

  def destroy
    @favorite.destroy
    respond_with(@favorite)
  end

  def toggle_favorite
    dest_id = 0
    dest_type = 0
    if params.has_key?(:season_id)
      dest_type = 0
      dest_id = params[:season_id]
    elsif params.has_key?(:section_id)
      dest_type = 1
      dest_id = params[:section_id]
    else
      render nothing: true
    end

    f = Favorite.where(user_id: current_user.id, dest_id: dest_id, dest_type: dest_type)
    if f.size == 0
      f.create(user_id: current_user.id, dest_id: dest_id, dest_type: dest_type, active: true)
    else
      fav = f.first
      fav.update(active: !fav.active)
    end
    render nothing: true
  end

  private
    def set_favorite
      @favorite = Favorite.find(params[:id])
    end

    def favorite_params
      params.require(:favorite).permit(:user_id, :dest_id, :dest_type)
    end
end
