class InstrumentsController < ApplicationController
  before_action :check_permissions, except: [:permissions_error]
  before_action :set_instrument, only: [:edit, :update, :destroy]
  add_breadcrumb "Settings", :edit_user_registration_path
  add_breadcrumb "Instruments", :instruments_path

  def permissions_error
  end

  def index
    @instruments = Instrument.all.order(:name)
  end

  def new
    add_breadcrumb "New", :new_instrument_path
    @instrument = Instrument.new
  end

  def edit
    add_breadcrumb "Edit", :edit_instrument_path
  end

  def create
    @instrument = Instrument.new(instrument_params)

    if @instrument.save
      flash[:notice] =  'Instrument was successfully created.'
      redirect_to instruments_path
    else
      render :new
    end
  end

  def update
    if @instrument.update(instrument_params)
      flash[:notice] = 'Instrument was successfully updated.'
      redirect_to instruments_path
    else
      render :edit
    end
  end

  def destroy
    if @instrument.student_instruments.size > 0
      flash[:error] = "Cannot delete instrument with associated students."
    else
      @instrument.destroy
      flash[:notice] = 'Instrument was successfully destroyed.'
    end
    redirect_to instruments_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instrument
      @instrument = Instrument.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instrument_params
      params.require(:instrument).permit(:name)
    end

    def check_permissions
      if current_user.check_permissions(:edit_site_variables)
      else
        redirect_to instruments_permissions_path
      end
    end
end
