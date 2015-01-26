json.array!(@favorite_instruments) do |favorite_instrument|
  json.extract! favorite_instrument, :id, :user_id, :instrument_id
  json.url favorite_instrument_url(favorite_instrument, format: :json)
end
