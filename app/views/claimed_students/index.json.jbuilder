json.array!(@claimed_students) do |claimed_student|
  json.extract! claimed_student, :id, :student_id, :user_id
  json.url claimed_student_url(claimed_student, format: :json)
end
