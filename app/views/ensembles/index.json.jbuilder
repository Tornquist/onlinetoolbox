json.array!(@ensembles) do |ensemble|
  json.extract! ensemble, :id, :name
  json.url ensemble_url(ensemble, format: :json)
end
