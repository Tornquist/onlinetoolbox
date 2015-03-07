class CreateSectionNotes < ActiveRecord::Migration
  def change
    create_table :section_notes do |t|
      t.integer :section_id
      t.text :content

      t.timestamps null: false
    end
  end
end
