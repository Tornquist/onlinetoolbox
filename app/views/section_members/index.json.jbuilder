json.array!(@section_members) do |section_member|
  json.extract! section_member, :id, :student_id, :section_id
  json.url section_member_url(section_member, format: :json)
end
