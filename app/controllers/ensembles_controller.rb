class EnsemblesController < ApplicationController
  before_action :set_ensemble, only: [:edit, :update, :destroy]

  add_breadcrumb "Settings", :edit_user_registration_path
  add_breadcrumb "Ensembles", :ensembles_path

  def index
    @ensembles = Ensemble.all.order(:name)
  end

  def new
    add_breadcrumb "New", :new_ensemble_path
    @ensemble = Ensemble.new
  end

  def edit
    add_breadcrumb "Edit", :edit_ensemble_path
  end

  def create
    @ensemble = Ensemble.new(ensemble_params)

    if @ensemble.save
      redirect_to ensembles_path, notice: 'Ensemble was successfully created.'
    else
      render :new
    end
  end

  def update
    if @ensemble.update(ensemble_params)
      redirect_to ensembles_path, notice: 'Ensemble was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @ensemble.student_instruments.size > 0
      flash[:error] = "Cannot delete ensembles with associated student interests"
    else
      @ensemble.destroy
      flash[:notice] = "Ensemble was successfully destroyed."
    end
    redirect_to ensembles_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ensemble
      @ensemble = Ensemble.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ensemble_params
      params.require(:ensemble).permit(:name)
    end
end
