class CreateGdsTypes < ActiveRecord::Migration
  def change
    create_table :gds_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
