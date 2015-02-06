class CreateRankMembers < ActiveRecord::Migration
  def change
    create_table :rank_members do |t|
      t.integer :rank_id
      t.integer :student_id

      t.timestamps null: false
    end
  end
end
