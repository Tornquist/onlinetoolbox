json.array!(@ranks) do |rank|
  json.extract! rank, :id, :section_id, :name, :index
  json.url rank_url(rank, format: :json)
end
