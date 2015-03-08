class StaticController < ApplicationController
  def index
    @announcements = Announcement.all.order(:created_at).reverse
    @favorites = Favorite.where(:user_id => current_user.id, :active => true).reverse
    @helps = Help.all.order(:name)
  end
end
