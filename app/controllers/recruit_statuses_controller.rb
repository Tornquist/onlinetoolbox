class RecruitStatusesController < ApplicationController
  before_action :check_permissions, except: [:permissions_error]
  before_action :set_recruit_status, only: [:edit, :update, :destroy]

  add_breadcrumb "Settings", :edit_user_registration_path
  add_breadcrumb "Recruit Statuses", :recruit_statuses_path

  def permissions_error
  end

  def index
    @recruit_statuses = RecruitStatus.all.order(:name)
  end

  def new
    add_breadcrumb "New", :new_recruit_status_path
    @recruit_status = RecruitStatus.new
  end

  def edit
    add_breadcrumb "Edit", :edit_recruit_status_path
  end

  def create
    @recruit_status = RecruitStatus.new(recruit_status_params)

    if @recruit_status.save
      redirect_to recruit_statuses_path, notice: 'Recruit status was successfully created.'
    else
      render :new
    end
  end

  def update
    if @recruit_status.update(recruit_status_params)
      redirect_to recruit_statuses_path, notice: 'Recruit status was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @recruit_status.comments.size > 0
      flash[:error] = "Cannot delete Recruit Statuses with associated comments. Delete comments, or hide status."
    else
      @recruit_status.destroy
      flash[:notice] = "Recruit status was successfully destroyed"
    end
    redirect_to recruit_statuses_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recruit_status
      @recruit_status = RecruitStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recruit_status_params
      params.require(:recruit_status).permit(:name, :hidden)
    end

    def check_permissions
      if current_user.check_permissions(:edit_site_variables)
      else
        redirect_to recruit_statuses_permissions_path
      end
    end
end
