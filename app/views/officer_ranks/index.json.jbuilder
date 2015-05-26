json.array!(@officer_ranks) do |officer_rank|
  json.extract! officer_rank, :id, :name, :hours, :inventory
  json.url officer_rank_url(officer_rank, format: :json)
end
