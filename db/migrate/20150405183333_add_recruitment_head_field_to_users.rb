class AddRecruitmentHeadFieldToUsers < ActiveRecord::Migration
  def change
    #User Types
    add_column :users, :recruitment_head, :boolean, default: false
  end
end
