class CreateHelps < ActiveRecord::Migration
  def change
    create_table :helps do |t|
      t.string :name
      t.text :url

      t.timestamps null: false
    end
  end
end
