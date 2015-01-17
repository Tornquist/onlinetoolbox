class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.integer :student_id
      t.integer :field_id
      t.string :choice

      t.timestamps
    end
  end
end
