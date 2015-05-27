class CreateStudentOfficerRanks < ActiveRecord::Migration
  def change
    create_table :student_officer_ranks do |t|
      t.integer :officer_rank_id
      t.integer :student_id
      t.date :date_approved
      t.date :date_issued
      t.date :date_returned

      t.timestamps null: false
    end
  end
end
