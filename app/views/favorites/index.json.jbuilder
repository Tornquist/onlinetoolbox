json.array!(@favorites) do |favorite|
  json.extract! favorite, :id, :user_id, :dest_id, :dest_type
  json.url favorite_url(favorite, format: :json)
end
