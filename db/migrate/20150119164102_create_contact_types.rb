class CreateContactTypes < ActiveRecord::Migration
  def change
    create_table :contact_types do |t|
      t.string :name
      t.boolean :hidden, default: false

      t.timestamps
    end
  end
end
