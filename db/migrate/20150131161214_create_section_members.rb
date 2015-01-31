class CreateSectionMembers < ActiveRecord::Migration
  def change
    create_table :section_members do |t|
      t.integer :student_id
      t.integer :section_id

      t.timestamps null: false
    end
  end
end
