json.array!(@student_instruments) do |student_instrument|
  json.extract! student_instrument, :id, :student_id, :instrument_id, :ensemble_id
  json.url student_instrument_url(student_instrument, format: :json)
end
