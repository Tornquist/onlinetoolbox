class RibbonsController < ApplicationController
  before_action :set_ribbon, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @ribbons = Ribbon.all
    respond_with(@ribbons)
  end

  def show
    respond_with(@ribbon)
  end

  def new
    @ribbon = Ribbon.new
    respond_with(@ribbon)
  end

  def edit
  end

  def create
    @ribbon = Ribbon.new(ribbon_params)
    @ribbon.save
    respond_with(@ribbon)
  end

  def update
    @ribbon.update(ribbon_params)
    respond_with(@ribbon)
  end

  def destroy
    @ribbon.destroy
    respond_with(@ribbon)
  end

  private
    def set_ribbon
      @ribbon = Ribbon.find(params[:id])
    end

    def ribbon_params
      params.require(:ribbon).permit(:name, :description, :hidden, :index)
    end
end
