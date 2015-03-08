class AddActiveToFavorites < ActiveRecord::Migration
  def change
    add_column :favorites, :active, :boolean
  end
end
