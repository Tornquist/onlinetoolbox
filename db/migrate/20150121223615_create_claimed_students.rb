class CreateClaimedStudents < ActiveRecord::Migration
  def change
    create_table :claimed_students do |t|
      t.integer :student_id
      t.integer :user_id

      t.timestamps
    end
  end
end
