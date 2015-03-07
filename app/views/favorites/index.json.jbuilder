json.array!(@favorites) do |favorite|
  json.extract! favorite, :id, :user_id, :type, :index
  json.url favorite_url(favorite, format: :json)
end
