class FavoritesController < ApplicationController
  def toggle_favorite
    dest_id = 0
    dest_type = 0
    if params.has_key?(:season_id)
      dest_type = 0
      dest_id = params[:season_id]
    elsif params.has_key?(:section_id)
      dest_type = 1
      dest_id = params[:section_id]
    else
      render nothing: true
    end

    f = Favorite.where(user_id: current_user.id, dest_id: dest_id, dest_type: dest_type)
    if f.size == 0
      f.create(user_id: current_user.id, dest_id: dest_id, dest_type: dest_type, active: true)
    else
      fav = f.first
      fav.update(active: !fav.active)
    end
    render nothing: true
  end
end
