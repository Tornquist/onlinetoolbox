class CreateStudentInstruments < ActiveRecord::Migration
  def change
    create_table :student_instruments do |t|
      t.integer :student_id
      t.integer :instrument_id
      t.integer :ensemble_id

      t.timestamps
    end
  end
end
