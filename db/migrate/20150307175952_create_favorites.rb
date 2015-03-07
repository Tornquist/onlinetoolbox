class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :type
      t.integer :index

      t.timestamps null: false
    end
  end
end
