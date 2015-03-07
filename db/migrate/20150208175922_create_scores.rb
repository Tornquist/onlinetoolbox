class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :student_id
      t.integer :user_id
      t.integer :game_id
      t.integer :memorization
      t.integer :music_effort
      t.integer :marching_fundamentals
      t.integer :marching_precision
      t.integer :marching_effort
      t.integer :rehearsal_etiquette
      t.integer :preparedness
      t.integer :punctuality
      t.integer :gameday_enthusiasm
      t.integer :gameday_professionalism
      t.text :comment

      t.timestamps null: false
    end
  end
end
