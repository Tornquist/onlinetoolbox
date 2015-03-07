class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :student_id
      t.text :content
      t.integer :contact_type_id
      t.integer :recruit_status_id

      t.timestamps
    end
  end
end
