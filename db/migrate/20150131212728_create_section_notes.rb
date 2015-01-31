class CreateSectionNotes < ActiveRecord::Migration
  def change
    create_table :section_notes do |t|
      t.integer :section_id
      t.string :content

      t.timestamps null: false
    end
  end
end
