class FavoriteInstrumentsController < ApplicationController
  respond_to :html

  add_breadcrumb "Favorite Instruments", :user_favorite_instruments_path

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

  private
    def favorite_instrument_params
      params.require(:favorite_instrument).permit(:user_id, :instrument_id)
    end
end
