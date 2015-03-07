class CreateGds < ActiveRecord::Migration
  def change
    create_table :gds do |t|
      t.integer :student_id
      t.integer :user_id
      t.integer :game_id
      t.integer :gds_type_id
      t.boolean :available, default: true
      t.boolean :automatic, default: false
      t.text :comment

      t.timestamps null: false
    end
  end
end
