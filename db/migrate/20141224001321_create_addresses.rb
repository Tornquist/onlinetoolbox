class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :student_id
      t.integer :field_id
      t.string :address_1
      t.string :address_2
      t.string :city
      t.integer :state_id
      t.integer :zip

      t.timestamps
    end
  end
end
