class AddFieldsToUsers < ActiveRecord::Migration
  def change
    #User Types
    add_column :users, :admin, :boolean, default: false
    add_column :users, :director, :boolean, default: false
    add_column :users, :recruiter, :boolean, default: true
    add_column :users, :student_leader, :boolean, default: false
    add_column :users, :chief_of_staff, :boolean, default: false

    #Identification Information
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
  end
end
