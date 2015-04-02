class StaticController < ApplicationController
  def index
    @announcements = Announcement.all.order(:created_at).reverse
    # In application controller now:
    #@favorites = Favorite.where(:user_id => current_user.id, :active => true).reverse
    @helps = Help.all.order(:name)
  end
end
