class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.integer :student_id
      t.integer :field_id
      t.string :choice, default: ""

      t.timestamps
    end
  end
end
