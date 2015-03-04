class AddNotNullToScore < ActiveRecord::Migration
  def change
    change_column_null(:scores, :memorization, false)
    change_column_null(:scores, :music_effort, false)
    change_column_null(:scores, :marching_fundamentals, false)
    change_column_null(:scores, :marching_precision, false)
    change_column_null(:scores, :marching_effort, false)
    change_column_null(:scores, :rehearsal_etiquette, false)
    change_column_null(:scores, :preparedness, false)
    change_column_null(:scores, :punctuality, false)
    change_column_null(:scores, :gameday_enthusiasm, false)
    change_column_null(:scores, :gameday_professionalism, false)
  end
end
