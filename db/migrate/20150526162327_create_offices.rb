class CreateOffices < ActiveRecord::Migration
  def change
    create_table :offices do |t|
      t.string :name
      t.boolean :hidden

      t.timestamps null: false
    end
  end
end
