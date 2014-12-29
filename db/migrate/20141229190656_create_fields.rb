class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.string :name
      t.integer :index
      t.integer :group
      t.string :description
      t.string :options

      t.timestamps
    end
  end
end
