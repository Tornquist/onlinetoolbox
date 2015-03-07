class StaticController < ApplicationController
  def index
    @announcements = Announcement.all.order(:created_at).reverse
  end
end
