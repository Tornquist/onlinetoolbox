json.array!(@rank_members) do |rank_member|
  json.extract! rank_member, :id, :rank_id, :student_id
  json.url rank_member_url(rank_member, format: :json)
end
