class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_favorites
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  add_breadcrumb "Home", :root_path

  def set_favorites
    @favorites = Favorite.where(:user_id => current_user.id, :active => true).reverse
  end
end
