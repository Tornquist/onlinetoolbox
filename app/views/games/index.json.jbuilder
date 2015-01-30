json.array!(@games) do |game|
  json.extract! game, :id, :season_id, :name, :played_on
  json.url game_url(game, format: :json)
end
