class CreateGigs < ActiveRecord::Migration
  def change
    create_table :gigs do |t|
      t.integer :student_id
      t.integer :user_id
      t.integer :game_id
      t.string :offense
      t.integer :value

      t.timestamps null: false
    end
  end
end
