class AddRecruitmentOfficerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :recruitment_officer, :boolean, default: false
  end
end
