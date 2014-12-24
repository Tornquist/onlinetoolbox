class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.integer :student_id
      t.integer :field_id
      t.string :content

      t.timestamps
    end
  end
end
