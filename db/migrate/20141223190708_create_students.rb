class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.boolean :recruit, default: true
      t.boolean :archive, default: false

      t.timestamps
    end
  end
end
