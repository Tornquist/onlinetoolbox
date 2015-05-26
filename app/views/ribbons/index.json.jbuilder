json.array!(@ribbons) do |ribbon|
  json.extract! ribbon, :id, :name, :description, :hidden, :index
  json.url ribbon_url(ribbon, format: :json)
end
