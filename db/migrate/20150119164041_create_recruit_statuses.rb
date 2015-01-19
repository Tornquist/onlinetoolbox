class CreateRecruitStatuses < ActiveRecord::Migration
  def change
    create_table :recruit_statuses do |t|
      t.string :name
      t.boolean :hidden, default: false

      t.timestamps
    end
  end
end
