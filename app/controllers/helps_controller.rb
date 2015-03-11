class HelpsController < ApplicationController
  before_action :set_help, only: [:show, :edit, :update, :destroy]

  respond_to :html
  add_breadcrumb "Settings", :edit_user_registration_path
  add_breadcrumb "Help", :helps_path

  def index
    @helps = Help.all
    respond_with(@helps)
  end


  def new
    add_breadcrumb "New", :new_help_path
    @help = Help.new
    respond_with(@help)
  end

  def edit
    add_breadcrumb "Edit", :edit_help_path
  end

  def create
    @help = Help.new(help_params)
    @help.save
    redirect_to helps_path
  end

  def update
    @help.update(help_params)
    redirect_to helps_path
  end

  def destroy
    @help.destroy
    redirect_to helps_path
  end

  private
    def set_help
      @help = Help.find(params[:id])
    end

    def help_params
      params.require(:help).permit(:name, :url)
    end
end
