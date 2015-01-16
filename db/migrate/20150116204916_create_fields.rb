class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.string :name
      t.integer :index
      t.integer :group_id
      t.string :description
      t.string :options
      t.boolean :hidden

      t.timestamps
    end
  end
end
