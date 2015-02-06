class CreateRanks < ActiveRecord::Migration
  def change
    create_table :ranks do |t|
      t.integer :section_id
      t.string :name
      t.integer :index

      t.timestamps null: false
    end
  end
end
