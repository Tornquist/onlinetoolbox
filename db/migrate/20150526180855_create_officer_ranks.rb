class CreateOfficerRanks < ActiveRecord::Migration
  def change
    create_table :officer_ranks do |t|
      t.string :name
      t.integer :hours
      t.integer :inventory

      t.timestamps null: false
    end
  end
end
