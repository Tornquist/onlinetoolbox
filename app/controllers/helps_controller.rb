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
    if current_user.check_permissions(:modify_documentation)
      add_breadcrumb "New", :new_help_path
      @help = Help.new
      respond_with(@help)
    else
      flash[:error] = "Director of Chief of Staff Permissions Required"
      redirect_to helps_path
    end
  end

  def edit
    if current_user.check_permissions(:modify_documentation)
      add_breadcrumb "Edit", :edit_help_path
    else
      flash[:error] = "Director of Chief of Staff Permissions Required"
      redirect_to helps_path
    end
  end

  def create
    if current_user.check_permissions(:modify_documentation)
      @help = Help.new(help_params)
      @help.save
      redirect_to helps_path
    else
      flash[:error] = "Director of Chief of Staff Permissions Required"
      redirect_to helps_path
    end
  end

  def update
    if current_user.check_permissions(:modify_documentation)
      @help.update(help_params)
      redirect_to helps_path
    else
      flash[:error] = "Director of Chief of Staff Permissions Required"
      redirect_to helps_path
    end
  end

  def destroy
    if current_user.check_permissions(:modify_documentation)
      @help.destroy
      redirect_to helps_path
    else
      flash[:error] = "Director of Chief of Staff Permissions Required"
      redirect_to helps_path
    end
  end

  private
    def set_help
      @help = Help.find(params[:id])
    end

    def help_params
      params.require(:help).permit(:name, :url)
    end
end
