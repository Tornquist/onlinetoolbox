class CreateRibbons < ActiveRecord::Migration
  def change
    create_table :ribbons do |t|
      t.string :name
      t.text :description
      t.boolean :hidden
      t.integer :index

      t.timestamps null: false
    end
  end
end
