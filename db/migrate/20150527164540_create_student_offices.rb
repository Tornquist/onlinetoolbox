class CreateStudentOffices < ActiveRecord::Migration
  def change
    create_table :student_offices do |t|
      t.integer :office_id
      t.integer :student_id

      t.timestamps null: false
    end
  end
end
