json.array!(@helps) do |help|
  json.extract! help, :id, :name, :url
  json.url help_url(help, format: :json)
end
