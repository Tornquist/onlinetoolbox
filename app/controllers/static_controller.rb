class StaticController < ApplicationController
  before_action :authenticate_user!
  def index
    @announcements = Announcement.all.order(:created_at).reverse
    @favorites = Favorite.where(:user_id => current_user.id).reverse
  end
end
