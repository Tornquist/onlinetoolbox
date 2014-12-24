json.array!(@texts) do |text|
  json.extract! text, :id, :student_id, :field_id, :content
  json.url text_url(text, format: :json)
end
