class FavoriteInstrumentsController < ApplicationController
  before_action :set_favorite_instrument, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  respond_to :html

  def user
    @instruments = Instrument.all
    @favorited = current_user.instruments
  end

  def create_multiple
    current_user.favorite_instruments.destroy_all
    if !params["instruments"].nil?
      params["instruments"].each do |key, value|
        FavoriteInstrument.create(user_id: current_user.id, instrument_id: value)
      end
    end

    redirect_to students_path
  end

  def index
    @favorite_instruments = FavoriteInstrument.all
    respond_with(@favorite_instruments)
  end

  def show
    respond_with(@favorite_instrument)
  end

  def new
    @favorite_instrument = FavoriteInstrument.new
    respond_with(@favorite_instrument)
  end

  def edit
  end

  def create
    @favorite_instrument = FavoriteInstrument.new(favorite_instrument_params)
    @favorite_instrument.save
    respond_with(@favorite_instrument)
  end

  def update
    @favorite_instrument.update(favorite_instrument_params)
    respond_with(@favorite_instrument)
  end

  def destroy
    @favorite_instrument.destroy
    respond_with(@favorite_instrument)
  end

  private
    def set_favorite_instrument
      @favorite_instrument = FavoriteInstrument.find(params[:id])
    end

    def favorite_instrument_params
      params.require(:favorite_instrument).permit(:user_id, :instrument_id)
    end
end
