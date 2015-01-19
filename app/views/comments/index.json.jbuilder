json.array!(@comments) do |comment|
  json.extract! comment, :id, :user_id, :student_id, :content, :contact_type_id, :recruit_status_id
  json.url comment_url(comment, format: :json)
end
