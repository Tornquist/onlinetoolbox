include FontAwesome::Rails::IconHelper
include ActionView::Helpers::TagHelper
include ActionView::Helpers::UrlHelper
module FavoritesHelper
  def self.favorite_field(input)
    user_id = input[:user_id]
    if input.has_key?(:season_id)
      f = Favorite.where(user_id: user_id, dest_id: input[:season_id], dest_type: 0)
      if f.size == 0
        link_to (fa_icon "star-o"), Rails.application.routes.url_helpers.favorite_toggle_path(season_id: input[:season_id]), method: :put, remote: true, title: "Favorite", class: "favorite-icon #{input[:classes]}"
      else
        if f.first.active
          link_to (fa_icon "star"), Rails.application.routes.url_helpers.favorite_toggle_path(season_id: input[:season_id]), method: :put, remote: true, title: "Unfavorite", class: "favorite-icon #{input[:classes]}"
        else
          link_to (fa_icon "star-o"), Rails.application.routes.url_helpers.favorite_toggle_path(season_id: input[:season_id]), method: :put, remote: true, title: "Unfavorite", class: "favorite-icon #{input[:classes]}"
        end
      end
    elsif input.has_key?(:section_id)
      f = Favorite.where(user_id: user_id, dest_id: input[:section_id], dest_type: 1)
      if f.size == 0
        link_to (fa_icon "star-o"), Rails.application.routes.url_helpers.favorite_toggle_path(section_id: input[:section_id]), method: :put, remote: true, title: "Favorite", class: "favorite-icon #{input[:classes]}"
      else
        if f.first.active
          link_to (fa_icon "star"), Rails.application.routes.url_helpers.favorite_toggle_path(section_id: input[:section_id]), method: :put, remote: true, title: "Unfavorite", class: "favorite-icon #{input[:classes]}"
        else
          link_to (fa_icon "star-o"), Rails.application.routes.url_helpers.favorite_toggle_path(section_id: input[:section_id]), method: :put, remote: true, title: "Unfavorite", class: "favorite-icon #{input[:classes]}"
        end
      end
    end
  end
end
