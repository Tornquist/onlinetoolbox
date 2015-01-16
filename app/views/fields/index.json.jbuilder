json.array!(@fields) do |field|
  json.extract! field, :id, :name, :index, :group_id, :description, :options, :hidden
  json.url field_url(field, format: :json)
end
