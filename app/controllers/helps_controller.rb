class HelpsController < ApplicationController
  before_action :set_help, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @helps = Help.all
    respond_with(@helps)
  end

  def show
    respond_with(@help)
  end

  def new
    @help = Help.new
    respond_with(@help)
  end

  def edit
  end

  def create
    @help = Help.new(help_params)
    @help.save
    respond_with(@help)
  end

  def update
    @help.update(help_params)
    respond_with(@help)
  end

  def destroy
    @help.destroy
    respond_with(@help)
  end

  private
    def set_help
      @help = Help.find(params[:id])
    end

    def help_params
      params.require(:help).permit(:name, :url)
    end
end
