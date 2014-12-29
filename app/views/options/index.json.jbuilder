json.array!(@options) do |option|
  json.extract! option, :id, :student_id, :field_id, :choice
  json.url option_url(option, format: :json)
end
