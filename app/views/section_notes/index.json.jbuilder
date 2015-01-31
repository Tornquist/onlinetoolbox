json.array!(@section_notes) do |section_note|
  json.extract! section_note, :id, :section_id, :content
  json.url section_note_url(section_note, format: :json)
end
