json.array!(@recruit_statuses) do |recruit_status|
  json.extract! recruit_status, :id, :name, :hidden
  json.url recruit_status_url(recruit_status, format: :json)
end
