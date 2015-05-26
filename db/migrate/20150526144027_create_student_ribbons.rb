class CreateStudentRibbons < ActiveRecord::Migration
  def change
    create_table :student_ribbons do |t|
      t.integer :student_id
      t.integer :ribbon_id

      t.timestamps null: false
    end
  end
end
