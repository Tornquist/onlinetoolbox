json.array!(@scores) do |score|
  json.extract! score, :id, :student_id, :user_id, :game_id, :memorization, :music_effort, :marching_fundamentals, :marching_precision, :marching_effort, :rehearsal_etiquette, :preparedness, :punctuality, :gameday_enthusiasm, :gameday_professionalism, :comment
  json.url score_url(score, format: :json)
end
