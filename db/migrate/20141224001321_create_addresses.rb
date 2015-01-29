class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :student_id
      t.integer :field_id
      t.string :address_1, default: ""
      t.string :address_2, default: ""
      t.string :city, default: ""
      t.integer :state_id, default: 1
      t.string :zip, default: ""

      t.timestamps
    end
  end
end
