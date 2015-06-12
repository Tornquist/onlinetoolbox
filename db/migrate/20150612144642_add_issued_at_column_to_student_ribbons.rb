class AddIssuedAtColumnToStudentRibbons < ActiveRecord::Migration
  def change
    add_column :student_ribbons, :issued_at, :datetime
  end
end
