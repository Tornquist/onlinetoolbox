class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :season_id
      t.string :name
      t.date :played_on

      t.timestamps null: false
    end
  end
end
