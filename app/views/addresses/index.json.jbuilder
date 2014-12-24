json.array!(@addresses) do |address|
  json.extract! address, :id, :student_id, :field_id, :address_1, :address_2, :city, :state_id, :zip
  json.url address_url(address, format: :json)
end
