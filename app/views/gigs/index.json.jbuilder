json.array!(@gigs) do |gig|
  json.extract! gig, :id, :student_id, :user_id, :game_id, :offense, :value
  json.url gig_url(gig, format: :json)
end
