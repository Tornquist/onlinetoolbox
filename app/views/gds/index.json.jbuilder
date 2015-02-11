json.array!(@gds) do |gds|
  json.extract! gds, :id, :student_id, :user_id, :game_id, :gds_type_id, :available, :comment
  json.url gds_url(gds, format: :json)
end
