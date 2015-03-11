class AnnouncementsController < ApplicationController
  before_action :set_announcement, only: [:destroy]
  add_breadcrumb "Settings", :edit_user_registration_path
  add_breadcrumb "Announcements", :announcements_path
  respond_to :html

  def index
    @announcements = Announcement.all.order(:created_at).reverse
    @announcement = Announcement.new
    respond_with(@announcements)
  end

  def create
    @announcement = Announcement.new(announcement_params)
    @announcement.save
    redirect_to announcements_path
  end

  def destroy
    if (@announcement.user_id == current_user.id || current_user.director || current_user.admin)
      @announcement.destroy
      redirect_to announcements_path
    else
      flash[:error] = "You can only delete announcements you have created"
      redirect_to announcements_path
    end
  end

  private
    def set_announcement
      @announcement = Announcement.find(params[:id])
    end

    def announcement_params
      params.require(:announcement).permit(:user_id, :content)
    end
end
