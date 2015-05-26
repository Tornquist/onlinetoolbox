json.array!(@student_ribbons) do |student_ribbon|
  json.extract! student_ribbon, :id, :student_id, :ribbon_id
  json.url student_ribbon_url(student_ribbon, format: :json)
end
